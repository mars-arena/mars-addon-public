import * as fs from 'fs';
import * as path from 'path';

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

type Parsed = {
	types: string[];
	globals: string[];
	natives: string[];
	guiTypes: string[];
	guiGlobals: string[];
	guiNatives: string[];
};

function getFilesFromImportList(filePath: string): string[] {
	const content = fs.readFileSync(filePath, 'utf-8');
	const dir = path.dirname(filePath);
	const files: string[] = [];

	for (const line of content.split('\n')) {
		const trimmed = line.trim();

		// игнорируем закомментированные //! import
		if (trimmed.startsWith('//') && !trimmed.startsWith('//!')) continue;

		// матчим только активные //! import строки
		const match = trimmed.match(/^\/\/!\s+import\s+(zinc|vjass)\s+"(.+?)"/);
		if (match) {
			const [, , relPath] = match;
			const fullPath = path.resolve(dir, relPath);
			if (fs.existsSync(fullPath)) {
				files.push(fullPath);
			} else {
				console.warn(`⚠️ Файл не найден: ${fullPath}`);
			}
		}
	}

	return files;
}

function parsePublicExportsZn(filePath: string): Parsed {
	const lines = fs.readFileSync(filePath, 'utf-8').split('\n');

	const types: string[] = [];
	const globals: string[] = [];
	const natives: string[] = [];
	const guiTypes: string[] = [];
	const guiGlobals: string[] = [];
	const guiNatives: string[] = [];

	let docBuffer: string[] = [];
	let isGuiBlock = false;
	let hasGuiTag = false;
	let currentGuiTags: string | null = null;
	let pendingGuiTags: string | null = null;
	let wasLastComment = false;
	let i = 0;

	// накапливаем ошибки, чтобы показать все за файл разом
	const errors: string[] = [];

	while (i < lines.length) {
		let lineRaw = lines[i];
		let line = lineRaw.trim();

		if (line.startsWith('//!')) {
			const isStart = /^\/\/!\s+gui(?:\s+.*)?$/.test(line);
			const isEnd = /^\/\/!\s+endgui$/.test(line);
			const isAtGui = /@gui\b/.test(line);

			if (isStart) {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: найден вложенный //! gui - ожидался //! endgui перед новым //! gui`);
				}
				isGuiBlock = true;
				const m = line.match(/^\/\/!\s+gui(?:\s+(.*))?$/);
				currentGuiTags = m && m[1] ? m[1].trim() : null;
			} else if (isEnd) {
				if (!isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: //! endgui без открывающего //! gui`);
				}
				isGuiBlock = false;
				currentGuiTags = null;
			} else if (isAtGui) {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: //! @gui внутри //! gui запрещён (внутри блока допустим только //! endgui)`);
				}
				hasGuiTag = true;
				const m = line.match(/@gui(?:\s+(.*))?$/);
				pendingGuiTags = m && m[1] ? m[1].trim() : null;
			} else {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: внутри //! gui допустим только //! endgui, найден: "${lineRaw.trim()}"`);
				}
			}

			i++;
			continue;
		}

		if (line.startsWith('//')) {
			if (!wasLastComment) docBuffer.push('');
			docBuffer.push('\t' + line);
			wasLastComment = true;
			i++;
			continue;
		} else {
			wasLastComment = false;
		}

		const structMatch = line.match(/^public\s+struct\s+(\w+)\s*\{?/);
		if (structMatch) {
			const name = structMatch[1];
			const lineOut = `type ${name} extends integer`;

			const guiTagText = (pendingGuiTags ?? currentGuiTags ?? '').trim();
			const suffix = guiTagText ? ` //! ${guiTagText}` : '';

			if (docBuffer.length) types.push(...docBuffer);
			types.push('\t' + lineOut);

			if (isGuiBlock || hasGuiTag) {
				if (docBuffer.length) guiTypes.push(...docBuffer);
				guiTypes.push('\t' + lineOut + suffix);
			}

			docBuffer = [];
			hasGuiTag = false;
			pendingGuiTags = null;
			i++;
			continue;
		}

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
				const name = funcMatch[1];
				let args = funcMatch[2].replace(/\s+/g, ' ').trim();
				const retType = funcMatch[3] ? funcMatch[3].trim() : 'nothing';
				args = args || 'nothing';

				const lineOut = `native ${name} takes ${args} returns ${retType}`;

				const guiTagText = (pendingGuiTags ?? currentGuiTags ?? '').trim();
				const suffix = guiTagText ? ` //! ${guiTagText}` : '';

				if (docBuffer.length) natives.push(...docBuffer);
				natives.push('\t' + lineOut);

				if (isGuiBlock || hasGuiTag) {
					if (docBuffer.length) guiNatives.push(...docBuffer);
					guiNatives.push('\t' + lineOut + suffix);
				}
			}

			docBuffer = [];
			hasGuiTag = false;
			pendingGuiTags = null;
			i++;
			continue;
		}

		const constMatch = line.match(/^public\s+constant\s+(\w+)\s+(\w+)\s*(=\s*[^;]+)?\s*;?/);
		const varMatch = line.match(/^public\s+(\w+)\s+(\w+)\s*(=\s*[^;]+)?\s*;?/);

		if (constMatch || varMatch) {
			const [, type, name, valueRaw] = constMatch || varMatch!;
			if (type === 'key' || type === 'struct') {
				docBuffer = [];
				i++;
				continue;
			}

			const value = valueRaw ? ` ${valueRaw.trim()}` : ' = undefined';
			const lineOut = `constant ${type} ${name}${value}`;

			if (docBuffer.length) globals.push(...docBuffer);
			globals.push('\t' + lineOut);

			if (isGuiBlock || hasGuiTag) {
				if (docBuffer.length) guiGlobals.push(...docBuffer);
				guiGlobals.push('\t' + lineOut);
			}

			docBuffer = [];
			hasGuiTag = false;
			i++;
			continue;
		}

		docBuffer = [];
		hasGuiTag = false;
		i++;
	}

	if (isGuiBlock) {
		errors.push(`${filePath}:EOF: не закрыт //! gui (ожидался //! endgui)`);
	}
	if (errors.length) {
		throw new Error(errors.join('\n'));
	}

	return { types, globals, natives, guiTypes, guiGlobals, guiNatives };
}

function parsePublicExportsVj(filePath: string): Parsed {
	const lines = fs.readFileSync(filePath, 'utf-8').split('\n');

	const types: string[] = [];
	const globals: string[] = [];
	const natives: string[] = [];
	const guiTypes: string[] = [];
	const guiGlobals: string[] = [];
	const guiNatives: string[] = [];

	let docBuffer: string[] = [];
	let inGlobals = false;
	let isGuiBlock = false;
	let hasGuiTag = false;
	let currentGuiTags: string | null = null;
	let pendingGuiTags: string | null = null;
	let wasLastComment = false;
	let i = 0;

	const errors: string[] = [];

	while (i < lines.length) {
		let lineRaw = lines[i];
		let line = lineRaw.trim();

		if (line.startsWith('//!')) {
			const isStart = /^\/\/!\s+gui(?:\s+.*)?$/.test(line);
			const isEnd = /^\/\/!\s+endgui$/.test(line);
			const isAtGui = /@gui\b/.test(line);

			if (isStart) {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: найден вложенный //! gui - ожидался //! endgui перед новым //! gui`);
				}
				isGuiBlock = true;
				const m = line.match(/^\/\/!\s+gui(?:\s+(.*))?$/);
				currentGuiTags = m && m[1] ? m[1].trim() : null;
			} else if (isEnd) {
				if (!isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: //! endgui без открывающего //! gui`);
				}
				isGuiBlock = false;
				currentGuiTags = null;
			} else if (isAtGui) {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: //! @gui внутри //! gui запрещён (внутри блока допустим только //! endgui)`);
				}
				hasGuiTag = true;
				const m = line.match(/@gui(?:\s+(.*))?$/);
				pendingGuiTags = m && m[1] ? m[1].trim() : null;
			} else {
				if (isGuiBlock) {
					errors.push(`${filePath}:${i + 1}: внутри //! gui допустим только //! endgui, найден: "${lineRaw.trim()}"`);
				}
			}

			i++;
			continue;
		}

		if (line.startsWith('//')) {
			if (!wasLastComment) docBuffer.push('');
			docBuffer.push('\t' + line);
			wasLastComment = true;
			i++;
			continue;
		} else {
			wasLastComment = false;
		}

		if (line === 'globals') {
			inGlobals = true;
			i++;
			continue;
		}
		if (line === 'endglobals') {
			inGlobals = false;
			docBuffer = [];
			i++;
			continue;
		}

		const funcMatch = line.match(/^(public|private)?\s*function\s+(\w+)\s+takes\s+(.*)\s+returns\s+(.*)$/);
		if (funcMatch) {
			if (funcMatch[1] === 'private') {
				i++;
				continue;
			}
			const name = funcMatch[2];
			const takesRaw = funcMatch[3].trim();
			const returnsRaw = funcMatch[4].trim();

			const args = takesRaw.toLowerCase() === 'nothing' ? 'nothing' : takesRaw;
			const ret = returnsRaw.toLowerCase() === 'nothing' ? 'nothing' : returnsRaw;

			const lineOut = `native ${name} takes ${args} returns ${ret}`;

			const guiTagText = (pendingGuiTags ?? currentGuiTags ?? '').trim();
			const suffix = guiTagText ? ` //! ${guiTagText}` : '';

			if (docBuffer.length) natives.push(...docBuffer);
			natives.push('\t' + lineOut);

			if (isGuiBlock || hasGuiTag) {
				if (docBuffer.length) guiNatives.push(...docBuffer);
				guiNatives.push('\t' + lineOut + suffix);
			}

			docBuffer = [];
			hasGuiTag = false;
			pendingGuiTags = null;
			i++;
			continue;
		}

		if (inGlobals) {
			if (line.startsWith('private ')) {
				i++;
				continue;
			}

			const constMatch = line.match(/^constant\s+(\w+(?:\s+array)?)\s+(\w+)\s*(=\s*[^;]+)?\s*;?/);
			const varMatch = line.match(/^(\w+(?:\s+array)?)\s+(\w+)\s*(=\s*[^;]+)?\s*;?/);

			if (constMatch || varMatch) {
				const [, type, name, valueRaw] = constMatch || varMatch!;
				if (type === 'key') {
					docBuffer = [];
					i++;
					continue;
				}

				const value = valueRaw ? ` ${valueRaw.trim()}` : ' = undefined';
				const lineOut = `constant ${type} ${name}${value}`;

				if (docBuffer.length) globals.push(...docBuffer);
				globals.push('\t' + lineOut);

				if (isGuiBlock || hasGuiTag) {
					if (docBuffer.length) guiGlobals.push(...docBuffer);
					guiGlobals.push('\t' + lineOut);
				}
				docBuffer = [];
				hasGuiTag = false;
				i++;
				continue;
			}
		}

		docBuffer = [];
		hasGuiTag = false;
		i++;
	}

	if (isGuiBlock) {
		errors.push(`${filePath}:EOF: не закрыт //! gui (ожидался //! endgui)`);
	}
	if (errors.length) {
		throw new Error(errors.join('\n'));
	}

	return { types, globals, natives, guiTypes, guiGlobals, guiNatives };
}

function formatFileName(file: string): string {
	const fileName = path.basename(file, path.extname(file));
	const spaced = fileName.replace(/([a-z])([A-Z])/g, '$1 $2');
	const final = spaced.replace(/([A-Z])([A-Z][a-z])/g, '$1 $2');
	return final.toUpperCase();
}

function writeOutput(filePath: string, types: string[], globals: string[], natives: string[]) {
	const output: string[] = [];

	if (types.length) {
		output.push(...types, '');
	}

	if (globals.length) {
		output.push('globals', ...globals, 'endglobals', '');
	}

	output.push(...natives);

	fs.writeFileSync(filePath, output.join('\n'), 'utf-8');
}

function main() {
	const buildPath = process.argv[2];
	if (!buildPath) {
		console.error('❌ Укажи путь к build-файлу:');
		console.error('   npm run generate <build.zn>');
		process.exit(1);
	}

	console.log(`🔍 ${buildPath} inspect`);

	const files = getFilesFromImportList(buildPath);
	files.sort();

	const types: string[] = [];
	const globals: string[] = [];
	const natives: string[] = [];
	const guiTypes: string[] = [];
	const guiGlobals: string[] = [];
	const guiNatives: string[] = [];

	for (const file of files) {
		const ext = path.extname(file).toLowerCase();
		let parsed: Parsed;

		if (ext === '.zn') {
			parsed = parsePublicExportsZn(file);
		} else if (ext === '.vj') {
			parsed = parsePublicExportsVj(file);
		} else {
			continue;
		}

		const words = formatFileName(file);
		const topic = '='.repeat(words.length);
		const header = [
			`\t//============${topic}============`,
			`\t//=========== ${words} ===========`,
		];

		if (parsed.types.length) types.push(...header, ...parsed.types, '');
		if (parsed.globals.length) globals.push(...header, ...parsed.globals, '');
		if (parsed.natives.length) natives.push(...header, ...parsed.natives, '');
		if (parsed.guiTypes.length) guiTypes.push(...header, ...parsed.guiTypes, '');
		if (parsed.guiGlobals.length) guiGlobals.push(...header, ...parsed.guiGlobals, '');
		if (parsed.guiNatives.length) guiNatives.push(...header, ...parsed.guiNatives, '');
	}

	writeOutput('./docs/api/engine_api.j', types, globals, natives);
	console.log('✅ engine_api.j generated');

	writeOutput('./docs/api/engine_api_gui.j', guiTypes, guiGlobals, guiNatives);
	console.log('✅ engine_api_gui.j generated');
}

main();
