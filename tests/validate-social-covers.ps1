$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$css = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'web/assets/application-mockups.css')
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$classes = @('social-cover-grid','social-cover','social-cover--career','social-cover--leadership','social-cover--authority','social-cover--ascension')
foreach ($className in $classes) {
  if ($css -notmatch [regex]::Escape(".$className")) { throw "Classe de capa ausente: .$className" }
}
if ($css -notmatch 'aspect-ratio:\s*9\s*/\s*16') { throw 'A proporção 9:16 não está definida.' }
if ($css -notmatch '#aplicacoes-f1' -or $css -notmatch '#social-vertical') { throw 'Aplicações sociais legadas não estão ocultas.' }
foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'id="social-covers"') { throw "Seção de capas ausente: $page" }
  if ($html -notmatch '1080' -or $html -notmatch '1920') { throw "Dimensão de produção ausente: $page" }
  foreach ($className in $classes) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Classe ausente em $page`: $className" }
  }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Acervo privado referenciado em $page" }
}
Write-Host 'Social covers validation passed.'
