#requires -version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-RegString {
	param([string]$Path, [string]$Name)
	try {
		($v = (Get-ItemProperty -LiteralPath $Path -Name $Name -ErrorAction Stop).$Name) | Out-Null
		if ([string]::IsNullOrWhiteSpace($v) -or $v -eq '-') { return $null }
		return [System.IO.Path]::GetFullPath($v.Trim())
	} catch { return $null }
}

$candidates = @()
$candidates += @{ Src='HKCU:\Software\Grimoire'; Name='War3InstallPath'; Val=(Get-RegString 'HKCU:\Software\Grimoire' 'War3InstallPath') }
$candidates += @{ Src='HKCU:\Software\Blizzard Entertainment\Warcraft III'; Name='InstallPath';   Val=(Get-RegString 'HKCU:\Software\Blizzard Entertainment\Warcraft III' 'InstallPath') }
$candidates += @{ Src='HKCU:\Software\Blizzard Entertainment\Warcraft III'; Name='InstallPathX';  Val=(Get-RegString 'HKCU:\Software\Blizzard Entertainment\Warcraft III' 'InstallPathX') }
$candidates += @{ Src='HKCU:\Software\WOW6432Node\Blizzard Entertainment\Warcraft III'; Name='InstallPath';  Val=(Get-RegString 'HKCU:\Software\WOW6432Node\Blizzard Entertainment\Warcraft III' 'InstallPath') }
$candidates += @{ Src='HKCU:\Software\WOW6432Node\Blizzard Entertainment\Warcraft III'; Name='InstallPathX'; Val=(Get-RegString 'HKCU:\Software\WOW6432Node\Blizzard Entertainment\Warcraft III' 'InstallPathX') }
$candidates += @{ Src='HKLM:\Software\Blizzard Entertainment\Warcraft III'; Name='InstallPath';   Val=(Get-RegString 'HKLM:\Software\Blizzard Entertainment\Warcraft III' 'InstallPath') }
$candidates += @{ Src='HKLM:\Software\Blizzard Entertainment\Warcraft III'; Name='InstallPathX';  Val=(Get-RegString 'HKLM:\Software\Blizzard Entertainment\Warcraft III' 'InstallPathX') }

$selected = $null
foreach ($c in $candidates) {
	if ($c.Val -and (Test-Path -LiteralPath $c.Val)) { $selected = $c.Val; break }
}
if (-not $selected) {
	throw "Не найден валидный путь Warcraft III в реестре."
}
$uiBase   = $selected
$uiTarget = Join-Path $uiBase 'UI'
Write-Host ("Selected base: {0}" -f $uiBase)
Write-Host ("Target UI:     {0}" -f $uiTarget)

$scriptDir = Split-Path -Parent $PSCommandPath
$looksLikeCodeRoot = (Test-Path (Join-Path $scriptDir 'package.json')) -and (Test-Path (Join-Path $scriptDir 'api'))
if ($looksLikeCodeRoot) {
	$codeDir     = $scriptDir
	$projectRoot = Split-Path -Parent $scriptDir
} else {
	$projectRoot = $scriptDir
	$codeDir     = Join-Path $projectRoot 'mars-addon-code'
}
$guiDir     = Join-Path $projectRoot 'mars-addon-gui'
$engineSrc  = Join-Path $codeDir 'docs\api\engine_api_gui.j'
$engineDst  = Join-Path $guiDir 'engine_api_gui.j'
$uiBuildSrc = Join-Path $guiDir 'dist\UI'

function Run { param([string]$Cmd,[string[]]$CmdArgs)
	Write-Host ("-> {0} {1}" -f $Cmd, ($CmdArgs -join ' '))
	& $Cmd @CmdArgs
	if ($LASTEXITCODE -ne 0) { throw ("Команда завершилась с кодом {0}: {1} {2}" -f $LASTEXITCODE, $Cmd, ($CmdArgs -join ' ')) }
}
function Invoke-In { param([string]$Path,[scriptblock]$Body)
	Write-Host ("-> cd {0}" -f $Path)
	Push-Location -LiteralPath $Path
	try { & $Body } finally { Pop-Location }
}

foreach ($p in @($codeDir, $guiDir)) {
	if (!(Test-Path -LiteralPath $p)) { throw ("Не найдена папка: {0}" -f $p) }
}

Invoke-In -Path $codeDir -Body { Run -Cmd 'npm' -CmdArgs @('run','generate','./main.vj') }

Write-Host ("-> Copy {0} -> {1}" -f $engineSrc, $engineDst)
if (!(Test-Path -LiteralPath $engineSrc)) { throw ("Файл не найден: {0}" -f $engineSrc) }
Copy-Item -LiteralPath $engineSrc -Destination $engineDst -Force

Invoke-In -Path $guiDir -Body { Run -Cmd 'npm' -CmdArgs @('run','build','./engine_api_gui.j') }

if (Test-Path -LiteralPath $uiTarget) {
	$timestamp	= Get-Date -Format 'yyyyMMdd_HHmmss'
	$backupDir	= Join-Path $uiBase 'backup'
	$uiBackup	= Join-Path $backupDir ("UI_{0}" -f $timestamp)

	Write-Host ("-> Backup old UI: {0} -> {1}" -f $uiTarget, $uiBackup)
	New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
	Move-Item -LiteralPath $uiTarget -Destination $uiBackup -Force
}
if (!(Test-Path -LiteralPath $uiBuildSrc)) { throw ("Не найден собранный UI: {0}" -f $uiBuildSrc) }

Write-Host ("-> Copy new UI: {0} -> {1}" -f $uiBuildSrc, $uiTarget)
New-Item -ItemType Directory -Force -Path $uiTarget | Out-Null
Copy-Item -Path (Join-Path $uiBuildSrc '*') -Destination $uiTarget -Recurse -Force

Write-Host 'DONE.'
