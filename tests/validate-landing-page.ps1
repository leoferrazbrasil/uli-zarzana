$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$htmlPath = Join-Path $root 'web/index.html'
$cssPath = Join-Path $root 'web/assets/landing-page.css'
$jsPath = Join-Path $root 'web/assets/landing-page.js'

function Read-Utf8([string]$path) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Arquivo ausente: $path" }
  return [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($path))
}

function Assert-Contains([string]$content, [string]$expected, [string]$label) {
  if (-not $content.Contains($expected)) { throw "$label ausente: $expected" }
}

$html = Read-Utf8 $htmlPath
$css = Read-Utf8 $cssPath
$js = Read-Utf8 $jsPath

foreach ($id in @('topo','formulario','para-quem','conteudo','depoimentos','sobre-uli','cta-final','privacy-dialog')) {
  Assert-Contains $html "id=`"$id`"" 'ID obrigatório'
}

foreach ($copy in @(
  'Aula Estratégica — Entre Potencial e Resultado',
  'Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.',
  'Quero identificar meu próximo movimento',
  'Página demonstrativa — data e inscrições ilustrativas',
  'O que a audiência já reconhece na Uli',
  '10+ anos em vendas',
  '8+ anos em liderança',
  '178 profissionais na estrutura',
  '22 líderes formados'
)) {
  Assert-Contains $html $copy 'Copy obrigatória'
}

foreach ($name in @('name','email','phone','role','income')) {
  Assert-Contains $html "name=`"$name`"" 'Campo obrigatório'
}

$formMatch = [regex]::Match($html, '(?s)<form\b[^>]*id="lead-form"[^>]*>.*?</form>')
if (-not $formMatch.Success) { throw 'Formulário demonstrativo ausente.' }
if ($formMatch.Value -match '\saction\s*=') { throw 'Formulário não pode possuir action.' }

foreach ($selectName in @('role','income')) {
  $select = [regex]::Match($html, "(?s)<select\b[^>]*name=`"$selectName`"[^>]*>(.*?)</select>")
  if (-not $select.Success) { throw "Select ausente: $selectName" }
  $realOptions = [regex]::Matches($select.Groups[1].Value, '<option\b[^>]*value="[^"]+"')
  if ($realOptions.Count -ne 7) { throw "Select $selectName deve possuir sete opções reais; encontrado: $($realOptions.Count)." }
}

foreach ($modifier in @('diagnosis','positioning','direction','execution')) {
  Assert-Contains $html "content-card--$modifier" 'Card de conteúdo'
}

if ([regex]::Matches($html, 'class="audience-quote"').Count -ne 4) {
  throw 'A página deve possuir quatro percepções da audiência.'
}

foreach ($asset in @(
  'assets/design-tokens.css',
  'uli-f1-015-hero-1600x900.jpg',
  'uli-f1-015-presenca-720x900.jpg',
  'uli-f1-080-autoridade-720x900.jpg',
  'uli-f1-082-lideranca-720x900.jpg',
  'uli-f1-087-ascensao-720x900.jpg'
)) {
  Assert-Contains ($html + $css) $asset 'Ativo obrigatório'
}

Assert-Contains $css '@media (max-width: 720px)' 'Breakpoint mobile'
Assert-Contains $css '@media (prefers-reduced-motion: reduce)' 'Preferência de movimento reduzido'
Assert-Contains $js '2026-09-24T19:30:00-03:00' 'Data demonstrativa'
Assert-Contains $js 'Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.' 'Confirmação demonstrativa'

foreach ($forbidden in @('fetch(', 'XMLHttpRequest', 'sendBeacon', 'localStorage', 'sessionStorage', 'FormData')) {
  if ($js.Contains($forbidden)) { throw "Integração ou persistência proibida: $forbidden" }
}

Write-Host 'Landing page validation passed.'
