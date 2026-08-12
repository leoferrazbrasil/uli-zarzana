$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$css = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'web/assets/application-mockups.css')
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$classes = @('social-vertical-grid','social-vertical-card','social-vertical-card--career','social-vertical-card--leadership','social-vertical-card--authority','social-vertical-card--ascension')
foreach ($className in $classes) {
  if ($css -notmatch [regex]::Escape(".$className")) { throw "Classe CSS social ausente: .$className" }
}
if ($css -notmatch 'aspect-ratio:\s*9\s*/\s*16') { throw 'Proporção 9:16 ausente.' }
foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'social-vertical-grid') { throw "Grid social ausente: $page" }
  foreach ($className in $classes) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Classe social ausente em $page`: $className" }
  }
  if ($html -match '(?i)font-family\s*:\s*[^;]*(script|hand|cursive)') { throw "Fonte manuscrita proibida em $page" }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Acervo privado referenciado em $page" }
}
Write-Host 'Social vertical validation passed.'
