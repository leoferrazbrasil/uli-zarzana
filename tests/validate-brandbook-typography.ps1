$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pagePath = Join-Path $root 'web\brandbook\index.html'
$html = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($pagePath))
$middleDot = [char]0x00B7
$iAcute = [char]0x00ED
$aAcute = [char]0x00E1
$familyWord = "Fam${iAcute}lia"

$required = @(
  'family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap',
  'href="../assets/design-tokens.css"',
  "B1 $middleDot Assinatura Executiva",
  'Libre Baskerville 700',
  'Source Sans 3',
  "$familyWord e tratamento aprovados",
  'font-family:var(--font-body)',
  'font-family:var(--font-heading)',
  'font-family:var(--font-signature)'
)

foreach ($value in $required) {
  if (-not $html.Contains($value)) { throw "Contrato ausente: $value" }
}

$forbidden = @("fam${iAcute}lia pendente", "Selecionar fam${iAcute}lias tipogr${aAcute}ficas")
foreach ($value in $forbidden) {
  if ($html.Contains($value)) { throw "Estado obsoleto presente: $value" }
}

if ($html -match 'font(?:-family)?:[^;}]*\b(?:Georgia|Arial)\b') {
  throw 'O brandbook ainda possui Georgia ou Arial como família primária local.'
}

Write-Host 'Brandbook typography validation passed.'
