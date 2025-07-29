import * as fs from 'fs';
import * as path from 'path';

const onlyFunctions = false;

/**
 * Рекурсивно собирает все .zn и .vj файлы из директории
 * @param string dir
 * @returns string[] - абсолютные пути файлов
 */
function getAllFiles(dir: string): string[] {
	const files: string[] = [];
	const entries = fs.readdirSync(dir, { withFileTypes: true });

	for (const entry of entries) {
		const fullPath = path.join(dir, entry.name);
		if (entry.isDirectory()) {
			files.push(...getAllFiles(fullPath));
		} else if (entry.isFile() && (entry.name.endsWith('.zn') || entry.name.endsWith('.vj'))) {
			files.push(fullPath);
		}
	}
	return files;
}

/**
 * Парсит .zn файл и вытаскивает public декларации
 * @param string filePath
 * @returns string[]
 */
function parsePublicExportsZn(filePath: string): string[] {
	const lines = fs.readFileSync(filePath, 'utf-8').split('\n');

	const result: string[] = [];
	let docBuffer: string[] = [];
	let i = 0;

	while (i < lines.length) {
		let line = lines[i].trim();

		// комментарии
		if (line.startsWith('//')) {
			docBuffer.push('\t' + line);
			i++;
			continue;
		}

		// public constant TYPE NAME = ...
		const constMatch = line.match(/^public\s+constant\s+(\w+)\s+(\w+)/);
		if (constMatch) {
			if (onlyFunctions) {
				docBuffer = [];
				i++;
				continue;
			}
			if (docBuffer.length) {
				result.push(...docBuffer);
				docBuffer = [];
			}
			result.push('\t' + `constant ${constMatch[1]} ${constMatch[2]}`);
			result.push('');
			i++;
			continue;
		}

		// public function NAME(...) -> TYPE {
		if (line.startsWith('public function')) {
			let funcLines = [line];
			let openParens = (line.match(/\(/g) || []).length;
			let closeParens = (line.match(/\)/g) || []).length;

			while (openParens > closeParens && i + 1 < lines.length) {
				i++;
				const nextLine = lines[i].trim();
				funcLines.push(nextLine);
				openParens += (nextLine.match(/\(/g) || []).length;
				closeParens += (nextLine.match(/\)/g) || []).length;
			}

			const joined = funcLines.join(' ');
			const funcMatch = joined.match(/^public\s+function\s+(\w+)\s*\((.*?)\)\s*(?:->\s*([\w\s]+))?/);

			if (funcMatch) {
				if (docBuffer.length) {
					result.push(...docBuffer);
					docBuffer = [];
				}
				const name = funcMatch[1];
				let args = funcMatch[2].replace(/\s+/g, ' ').trim();
				const retType = funcMatch[3] ? funcMatch[3].trim() : 'nothing';
				args = args ? args : 'nothing';
				result.push('\t' + `native ${name} takes ${args} returns ${retType}`);
				result.push('');
			}
			docBuffer = [];
			i++;
			continue;
		}

		// public TYPE NAME;
		const varMatch = line.match(/^public\s+(\w+)\s+(\w+)\s*;/);
		if (varMatch) {
			if (onlyFunctions || varMatch[1] === 'key') { // Ignore variables of type 'key'
				docBuffer = [];
				i++;
				continue;
			}
			if (docBuffer.length) {
				result.push(...docBuffer);
				docBuffer = [];
			}
			result.push('\t' + `${varMatch[1]} ${varMatch[2]}`);
			result.push('');
			i++;
			continue;
		}

		docBuffer = [];
		i++;
	}

	return result;
}

/**
 * Парсит .vj файл и вытаскивает public декларации (глобалы и функции)
 * @param string filePath
 * @returns string[]
 */
function parsePublicExportsVj(filePath: string): string[] {
	const lines = fs.readFileSync(filePath, 'utf-8').split('\n');

	const result: string[] = [];
	let docBuffer: string[] = [];

	let inGlobals = false;
	let i = 0;

	while (i < lines.length) {
		let line = lines[i].trim();

		// Комментарии
		if (line.startsWith('//')) {
			docBuffer.push('\t' + line);
			i++;
			continue;
		}

		// Начало секции globals
		if (line === 'globals') {
			inGlobals = true;
			i++;
			continue;
		}

		// Конец секции globals
		if (line === 'endglobals') {
			inGlobals = false;
			docBuffer = [];
			i++;
			continue;
		}

		if (inGlobals) {
			// Пропускаем private переменные и константы
			if (line.startsWith('private ')) {
				i++;
				continue;
			}

			// constant real LN2 = 0.693147 // ...
			const constMatch = line.match(/^constant\s+(\w+(?:\s+array)?)\s+(\w+)/);
			if (constMatch) {
				if (onlyFunctions) {
					docBuffer = [];
					i++;
					continue;
				}
				if (docBuffer.length) {
					result.push(...docBuffer);
					docBuffer = [];
				}
				const type = constMatch[1];
				const name = constMatch[2];
				result.push('\t' + `constant ${type} ${name}`);
				result.push('');
				i++;
				continue;
			}

			// var формат: type [array] name
			const varMatch = line.match(/^(\w+(?:\s+array)?)(?:\s+)(\w+)/);
			if (varMatch) {
				if (onlyFunctions || varMatch[1] === 'key') { // Ignore variables of type 'key'
					docBuffer = [];
					i++;
					continue;
				}
				if (docBuffer.length) {
					result.push(...docBuffer);
					docBuffer = [];
				}
				const type = varMatch[1];
				const name = varMatch[2];
				result.push('\t' + `${type} ${name}`);
				result.push('');
				i++;
				continue;
			}
		}

		// Парсим функции (по умолчанию public, пропускаем private)
		const funcMatch = line.match(/^(public|private)?\s*function\s+(\w+)\s+takes\s+(.*)\s+returns\s+(.*)$/);
		if (funcMatch) {
			const visibility = funcMatch[1]; // undefined или 'public' или 'private'
			const name = funcMatch[2];
			const takesRaw = funcMatch[3].trim();
			const returnsRaw = funcMatch[4].trim();

			if (visibility === 'private') {
				i++;
				continue;
			}

			// Парсим аргументы из takes
			let argsStr = '';
			if (takesRaw.toLowerCase() === 'nothing') {
				argsStr = '';
			} else {
				const args = takesRaw.split(',').map(arg => arg.trim());
				const argsParsed = args.map(a => {
					const parts = a.split(/\s+/);
					if (parts.length >= 2) {
						const t = parts[0];
						const n = parts.slice(1).join(' ');
						return `${t} ${n}`;
					}
					return a;
				});
				argsStr = argsParsed.join(', ');
			}

			if (docBuffer.length) {
				result.push(...docBuffer);
				docBuffer = [];
			}

			const ret = returnsRaw.toLowerCase() === 'nothing' ? 'nothing' : `${returnsRaw}`;
			argsStr = argsStr ? argsStr : 'nothing';
			result.push('\t' + `native ${name} takes ${argsStr} returns ${ret}`);
			result.push('');
			i++;
			continue;
		}

		docBuffer = [];
		i++;
	}

	return result;
}

/**
 * Основная функция — запускает сканирование и запись результата
 */
function main() {
	const root = process.cwd();

	const files = getAllFiles(root);
	files.sort(); // сортируем для стабильного порядка

	const declarations: string[] = [];

	for (const file of files) {
		const ext = path.extname(file).toLowerCase();
		let decls: string[] = [];

		if (ext === '.zn') {
			decls = parsePublicExportsZn(file);
		} else if (ext === '.vj') {
			decls = parsePublicExportsVj(file);
		}

		if (decls.length > 0) {
			const relPath = path.relative(root, file);
			declarations.push('\t' + `//===================================================`);
			declarations.push('\t' + `// ${relPath}`);
			declarations.push('\t' + `//===================================================`);
			declarations.push('');
			declarations.push(...decls);
			declarations.push('');
			declarations.push('');
		}
	}

	fs.writeFileSync('public_declarations.zn', declarations.join('\n'), 'utf-8');
	console.log('✅ public_declarations.zn создан');
}

main();
