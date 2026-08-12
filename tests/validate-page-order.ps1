$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$script = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'web/assets/application-mockups.js')
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)

if ($script -notmatch 'appendChild') { throw 'O script compartilhado não reposiciona seções no final do main.' }
if ($script -notmatch 'O que vem a seguir') { throw 'O título da seção de identidade visual não está coberto.' }
if ($script -notmatch 'Pr.ximas defini..es') { throw 'A seção equivalente do brandbook não está coberta.' }

foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'application-mockups\.js') { throw "Script compartilhado ausente: $page" }
  if ($html -notmatch 'O que vem a seguir|Pr.ximas defini..es') { throw "Seção de próximos passos ausente: $page" }
}

Write-Host 'Page order contract passed.'
