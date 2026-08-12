$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$css = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'web/assets/application-mockups.css')
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$classes = @('instagram-cover-grid','instagram-cover-card','instagram-cover-card--career','instagram-cover-card--leadership','instagram-cover-card--authority','instagram-cover-card--ascension')
foreach ($className in $classes) {
  if ($css -notmatch [regex]::Escape(".$className")) { throw "Classe de capa ausente: .$className" }
}
if ($css -notmatch 'aspect-ratio:\s*9\s*/\s*16') { throw 'A proporção 9:16 não está definida.' }
if ($css -match 'main\s*>\s*\.section:nth-of-type\(7\)') { throw 'Regra posicional pode ocultar o mockup de aplicações.' }
foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'id="mockups"') { throw "Mockup de aplicações ausente: $page" }
  if ($html -match 'id="social-covers"' -or $html -match 'id="social-vertical"') { throw "Seção social autônoma ainda está publicada em $page" }
  if ($html -notmatch 'application-mockup-section--instagram') { throw "Seção Instagram independente ausente em $page" }
  if ($html -notmatch '1080' -or $html -notmatch '1920') { throw "Dimensão de produção ausente no mockup: $page" }
  foreach ($className in $classes) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Classe ausente em $page`: $className" }
  }
  if ($html -notmatch 'instagram-cover-grid') { throw "Capas não estão na seção própria do Instagram: $page" }
  if ($html -match '(?i)(visualizações|views|mil visualizações)') { throw "Métrica fictícia presente em $page" }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Acervo privado referenciado em $page" }
}
Write-Host 'Social covers validation passed.'
