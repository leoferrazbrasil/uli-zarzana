$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pagePath = Join-Path $root 'web\identidade-visual\index.html'
$html = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($pagePath))
$middleDot = [char]0x00B7

$required = @(
  'family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap',
  'href="../assets/design-tokens.css"',
  'class="brand-name">Uli Zarzana</strong>',
  "B1 $middleDot Assinatura Executiva",
  'Libre Baskerville',
  'Source Sans 3',
  'font-family:var(--font-body)',
  'font-family:var(--font-heading)',
  'font-family:var(--font-signature)'
)

foreach ($value in $required) {
  if (-not $html.Contains($value)) { throw "Contrato ausente: $value" }
}

if ($html -match 'font(?:-family)?:[^;}]*\b(?:Georgia|Arial)\b') {
  throw 'A página ainda possui Georgia ou Arial como família primária local.'
}

Write-Host 'Identity typography validation passed.'
