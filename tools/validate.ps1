$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$bundle = Join-Path $repo 'bundle'

$xmlFiles = Get-ChildItem -Path $bundle -Filter '*.xml' -File
if (-not $xmlFiles) { throw 'No XML files found in bundle.' }

foreach ($file in $xmlFiles) {
    try {
        [xml](Get-Content -Raw -LiteralPath $file.FullName) | Out-Null
        Write-Host "XML OK  $($file.Name)"
    }
    catch {
        throw "XML parse failed: $($file.Name): $($_.Exception.Message)"
    }
}

$required = @(
    'SquareSoft_UI_Installer.xml',
    'SquareSoft_Automapper.xml',
    'SquareSoft_CanonicalMap_seed.sqlite',
    'SquareSoft_Core_Triggers.xml',
    'Autobuff_Tracker.xml',
    'Chakra_Cooldown.xml',
    'SquareSoft_Chat_Router.xml',
    'SquareSoft_Plugin_Controller.xml',
    'UI_Layout_Controller.xml',
    'UI_Theme_Controller.xml'
)
foreach ($name in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $bundle $name))) {
        throw "Required bundle file missing: $name"
    }
}

Write-Host "Validation passed: $($xmlFiles.Count) XML files parsed and required files are present."
