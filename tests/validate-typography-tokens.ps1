$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$tokensPath = Join-Path $root 'web\assets\design-tokens.css'

function Assert-Contains([string]$content, [string]$expected) {
  if (-not $content.Contains($expected)) {
    throw "Token ausente: $expected"
  }
}

if (-not (Test-Path -LiteralPath $tokensPath)) {
  throw "Arquivo ausente: $tokensPath"
}

$css = Get-Content -Raw -Encoding UTF8 -LiteralPath $tokensPath
$required = @(
  '--font-family-serif: "Libre Baskerville", Georgia, serif;',
  '--font-family-sans: "Source Sans 3", "Segoe UI", Arial, sans-serif;',
  '--font-signature: var(--font-family-serif);',
  '--font-heading: var(--font-family-serif);',
  '--font-body: var(--font-family-sans);',
  '--weight-regular: 400;',
  '--weight-medium: 500;',
  '--weight-semibold: 600;',
  '--weight-bold: 700;',
  '--tracking-signature: -0.035em;',
  '--tracking-heading: -0.025em;',
  '--tracking-label: 0.16em;',
  '--leading-signature: 1;',
  '--leading-body: 1.6;',
  '--type-body: 1rem;',
  '--type-label: 0.75rem;'
)

foreach ($token in $required) {
  Assert-Contains $css $token
}

$colorTokens = @(
  '--color-ink: #332A26;',
  '--color-paper: #F7F0E7;',
  '--color-accent-champagne: #CDAE85;',
  '--color-accent-terracotta: #B46F52;'
)

foreach ($token in $colorTokens) {
  Assert-Contains $css $token
}

Write-Host 'Typography and color token validation passed.'
