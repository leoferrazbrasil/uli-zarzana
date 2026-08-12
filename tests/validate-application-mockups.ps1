$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$css = Join-Path $root 'web/assets/application-mockups.css'
$requiredClasses = @(
  'application-mockups-grid',
  'application-mockup--instagram',
  'application-mockup--site',
  'application-mockup--presentation',
  'application-mockup--mentoria'
)
$requiredAssets = @(
  'uli-f1-015-hero-1600x900.jpg',
  'uli-f1-015-presenca-720x900.jpg',
  'uli-f1-080-autoridade-720x900.jpg',
  'uli-f1-087-ascensao-720x900.jpg'
)

if (-not (Test-Path -LiteralPath $css)) { throw "CSS compartilhado ausente: $css" }
$cssText = Get-Content -Raw -Encoding UTF8 $css
foreach ($className in $requiredClasses) {
  if ($cssText -notmatch [regex]::Escape(".$className")) { throw "Classe CSS ausente: .$className" }
}
if ($cssText -notmatch '@media') { throw 'CSS compartilhado não possui regra responsiva.' }

foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'application-mockups\.css') { throw "CSS compartilhado não carregado: $page" }
  if ($html -notmatch 'id="mockups"') { throw "Seção de mockups ausente: $page" }
  foreach ($className in $requiredClasses) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Contexto ausente em $page`: $className" }
  }
  foreach ($asset in $requiredAssets) {
    if ($html -notmatch [regex]::Escape($asset)) { throw "Derivado ausente em $page`: $asset" }
  }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Página referencia acervo privado: $page" }
}

Write-Host 'Application mockups validation passed.'
