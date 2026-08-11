$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$identityPath = Join-Path $root 'web\identidade-visual\index.html'
$brandbookPath = Join-Path $root 'web\brandbook\index.html'
$vaultPath = Join-Path $root 'cofre-uli\02 - Identidade Visual\Regras de Uso do Sistema Visual - A1 B1 F1.md'

function Read-Utf8([string]$path) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Arquivo ausente: $path" }
  return [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($path))
}

function Assert-Contains([string]$content, [string]$expected) {
  if (-not $content.Contains($expected)) {
    throw "Regra visual ausente: $expected"
  }
}

$identity = Read-Utf8 $identityPath
$brandbook = Read-Utf8 $brandbookPath
$vault = Read-Utf8 $vaultPath

foreach ($value in @('Regras de uso', 'Paleta', 'Tipografia', 'Compos', 'Fotografia', 'Aplica', 'Monograma')) {
  Assert-Contains ($identity + $brandbook + $vault) $value
}

foreach ($value in @('id="regras"', 'Monograma continua', 'A1', 'B1', 'F1')) {
  Assert-Contains $identity $value
}

foreach ($value in @('Regras de Uso do Sistema Visual', 'publicar o estudo como logotipo final', 'tamanho')) {
  Assert-Contains $vault $value
}

if ($identity.Contains('paleta e dos contrastes')) {
  throw 'A identidade visual ainda apresenta a paleta como pendente.'
}

Write-Host 'Visual rules validation passed.'
