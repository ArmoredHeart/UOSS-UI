param(
    [Parameter(Mandatory=$true)]
    [string]$Version
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
& (Join-Path $PSScriptRoot 'validate.ps1')

$outDir = Join-Path $repo 'releases'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$out = Join-Path $outDir ("SquareSoft_UI_Installer_{0}.zip" -f $Version)
if (Test-Path $out) { Remove-Item $out -Force }
Compress-Archive -Path (Join-Path $repo 'bundle\*') -DestinationPath $out -CompressionLevel Optimal
Write-Host "Built $out"
