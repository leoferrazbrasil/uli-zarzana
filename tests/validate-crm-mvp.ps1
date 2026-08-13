$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$htmlPath = Join-Path $root 'web\crm\index.html'
$cssPath = Join-Path $root 'web\crm\assets\crm.css'
$tokensPath = Join-Path $root 'web\assets\design-tokens.css'
$jsPath = Join-Path $root 'web\crm\assets\crm-app.js'

function Assert-Contains([string]$value, [string]$needle, [string]$message) {
  if (-not $value.Contains($needle)) { throw "$message`: $needle" }
}

foreach ($path in @($htmlPath, $cssPath, $jsPath)) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Arquivo ausente: $path" }
}

$html = [IO.File]::ReadAllText($htmlPath, [Text.Encoding]::UTF8)
$css = [IO.File]::ReadAllText($cssPath, [Text.Encoding]::UTF8)
$tokens = [IO.File]::ReadAllText($tokensPath, [Text.Encoding]::UTF8)
$js = [IO.File]::ReadAllText($jsPath, [Text.Encoding]::UTF8)

$accentA = [char]0x00E3
$accentC = [char]0x00E7
$accentI = [char]0x00ED
$accentO = [char]0x00F3
$accentTilde = [char]0x00F5
foreach ($required in @(
  ('Vis' + $accentA + 'o Geral'), 'Pipeline', 'Leads', 'Tarefas', 'Ofertas', ('Relat' + $accentO + 'rios'), ('Configura' + $accentC + $accentTilde + 'es'),
  'Novos leads hoje', ('Leads em qualifica' + $accentC + $accentA + 'o'), 'Ofertas apresentadas hoje',
  'Ganhos hoje', 'Perdidos hoje', 'Tarefas pendentes hoje',
  'Novo', 'Qualificando', 'Oferta', 'Ganho', 'Perdido',
  'Administradora', 'Comercial', 'Supabase', ('dados fict' + $accentI + 'cios')
)) { Assert-Contains ($html + $js) $required 'Regra obrigatória ausente' }

foreach ($required in @(
  'design-tokens.css', '--color-ink', '--color-paper', '--color-accent-champagne', '--color-accent-terracotta',
  'var(--font-family-serif)', 'var(--font-family-sans)', 'position: fixed', 'grid-template-columns',
  '@media (max-width: 900px)', '@media (max-width: 640px)'
)) { Assert-Contains ($css + $tokens) $required 'Regra visual ou responsiva ausente' }

foreach ($forbidden in @('fetch(', 'XMLHttpRequest', 'supabase-js', 'localStorage', 'sessionStorage', 'document.cookie')) {
  if (($html + $css + $js).Contains($forbidden)) { throw "Integração ou persistência não autorizada no protótipo: $forbidden" }
}

Write-Output 'CRM MVP validation passed.'
