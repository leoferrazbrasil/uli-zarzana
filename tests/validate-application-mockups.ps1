$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pages = @(
  Join-Path $root 'web/identidade-visual/index.html'
  Join-Path $root 'web/brandbook/index.html'
)
$css = Join-Path $root 'web/assets/application-mockups.css'
$requiredClasses = @(
  'application-mockup-section',
  'application-mockup-section--instagram',
  'application-mockup-section--site',
  'application-mockup-section--presentation',
  'application-mockup-section--mentoria',
  'instagram-cover-grid',
  'instagram-cover-card',
  'instagram-cover-card--career',
  'instagram-cover-card--leadership',
  'instagram-cover-card--authority',
  'instagram-cover-card--ascension'
)
$script = Join-Path $root 'web/assets/application-mockups.js'
$requiredAssets = @(
  'uli-f1-015-hero-1600x900.jpg',
  'uli-f1-015-presenca-720x900.jpg',
  'uli-f1-080-autoridade-720x900.jpg',
  'uli-f1-087-ascensao-720x900.jpg'
)

if (-not (Test-Path -LiteralPath $css)) { throw "CSS compartilhado ausente: $css" }
if (-not (Test-Path -LiteralPath $script)) { throw "Script compartilhado ausente: $script" }
$cssText = Get-Content -Raw -Encoding UTF8 $css
$scriptText = Get-Content -Raw -Encoding UTF8 $script
foreach ($className in $requiredClasses) {
  if ($cssText -notmatch [regex]::Escape(".$className")) { throw "Classe CSS ausente: .$className" }
}
if ($cssText -notmatch '@media') { throw 'CSS compartilhado não possui regra responsiva.' }
if ($scriptText -notmatch 'presentation-method') { throw 'Bloco metodológico da apresentação ausente no script compartilhado.' }
if ([regex]::Matches($scriptText, 'class="presentation-method__step"').Count -ne 5) { throw 'O bloco metodológico não possui cinco etapas.' }
if ($scriptText -notmatch 'presentation-method__closing') { throw 'Conclusão do bloco metodológico ausente.' }
foreach ($stepName in @('Ident', 'Clare', 'Decis', 'Execu', 'Result')) {
  if ($scriptText -notmatch [regex]::Escape(">$stepName")) { throw "Etapa ausente no método determinístico: $stepName" }
}
if ($scriptText -notmatch 'mentoria-framework') { throw 'Estrutura das dimensões da mentoria ausente no script compartilhado.' }
if ([regex]::Matches($scriptText, 'class="mentoria-framework__dimension"').Count -ne 5) { throw 'A estrutura da mentoria não possui cinco dimensões.' }
foreach ($dimension in @('SER', 'PENSAR', 'FALAR', 'AGIR', 'RECEBER')) {
  if ($scriptText -notmatch [regex]::Escape(">$dimension<")) { throw "Dimensão ausente na estrutura da mentoria: $dimension" }
}

foreach ($page in $pages) {
  $html = Get-Content -Raw -Encoding UTF8 $page
  if ($html -notmatch 'application-mockups\.css') { throw "CSS compartilhado não carregado: $page" }
  if ($html -notmatch 'id="mockups"') { throw "Seção de mockups ausente: $page" }
  if ($html -match 'application-mockups-grid') { throw "Grade antiga de duas colunas ainda existe: $page" }
  if ([regex]::Matches($html, 'class="application-mockup-section application-mockup-section--').Count -ne 4) { throw "Os quatro contextos não estão separados em seções: $page" }
  if ([regex]::Matches($html, 'class="instagram-cover-card instagram-cover-card--').Count -ne 4) { throw "O Instagram não possui quatro cards de capa: $page" }
  if ($html -notmatch 'application-mockups\.js') { throw "Script compartilhado não carregado: $page" }
  if ($html -match 'mockup-instagram__bar|mockup-instagram__avatar|mockup-instagram__follow') { throw "Chrome falso de perfil ainda existe: $page" }
  foreach ($className in $requiredClasses) {
    if ($html -notmatch [regex]::Escape($className)) { throw "Contexto ausente em $page`: $className" }
  }
  foreach ($asset in $requiredAssets) {
    if ($html -notmatch [regex]::Escape($asset)) { throw "Derivado ausente em $page`: $asset" }
  }
  if ($html -match '(?i)(visualizações|views|mil visualizações)') { throw "Métrica fictícia presente em $page" }
  if ($html -match '(?i)(\.\./)+fotos/') { throw "Página referencia acervo privado: $page" }
}

Write-Host 'Application mockups validation passed.'
