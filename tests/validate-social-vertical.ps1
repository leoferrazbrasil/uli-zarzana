$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$css = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'web/assets/application-mockups.css')
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$classes = @('mockup-instagram__cover-grid','mockup-instagram__cover','mockup-instagram__cover--career','mockup-instagram__cover--leadership','mockup-instagram__cover--authority','mockup-instagram__cover--ascension')
foreach ($className in $classes) {
  if ($css -notmatch [regex]::Escape(".$className")) { throw "Classe CSS de capa ausente: .$className" }
}
if ($css -notmatch 'aspect-ratio:\s*9\s*/\s*16') { throw 'Proporção 9:16 ausente.' }
foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'id="mockups"') { throw "Mockup de aplicações ausente: $page" }
  if ($html -match 'id="social-vertical"') { throw "Seção social vertical autônoma ainda está publicada: $page" }
  foreach ($className in $classes) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Classe de capa ausente em $page`: $className" }
  }
  if ($html -notmatch 'mockup-instagram__cover-grid') { throw "Capas sociais não estão dentro do mockup do Instagram: $page" }
  if ($html -match '(?i)font-family\s*:\s*[^;]*(script|hand|cursive)') { throw "Fonte manuscrita proibida em $page" }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Acervo privado referenciado em $page" }
}
Write-Host 'Social vertical validation passed.'
