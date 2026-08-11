$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$tokensPath = Join-Path $root 'web\assets\design-tokens.css'
$identityPath = Join-Path $root 'web\identidade-visual\index.html'
$brandbookPath = Join-Path $root 'web\brandbook\index.html'

function Assert-Contains([string]$content, [string]$expected) {
  if (-not $content.Contains($expected)) {
    throw "Contrato de paleta ausente: $expected"
  }
}

function Assert-NotContains([string]$content, [string]$forbidden) {
  if ($content.Contains($forbidden)) {
    throw "Cor concorrente ou regra obsoleta presente: $forbidden"
  }
}

foreach ($path in @($tokensPath, $identityPath, $brandbookPath)) {
  if (-not (Test-Path -LiteralPath $path)) {
    throw "Arquivo ausente: $path"
  }
}

$css = Get-Content -Raw -Encoding UTF8 -LiteralPath $tokensPath
$identity = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($identityPath))
$brandbook = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($brandbookPath))

$tokens = @(
  '--color-ink: #332A26;',
  '--color-paper: #F7F0E7;',
  '--color-accent-champagne: #CDAE85;',
  '--color-accent-terracotta: #B46F52;'
)

foreach ($token in $tokens) {
  Assert-Contains $css $token
}

$requiredText = @(
  'Paleta',
  'Texto normal',
  'Champagne',
  'Terracota',
  '12.38:1',
  '6.66:1',
  '1.86:1'
)

foreach ($value in $requiredText) {
  Assert-Contains ($identity + $brandbook) $value
}

$allowedHex = @('#332A26', '#F7F0E7', '#CDAE85', '#B46F52')
$all = $css + $identity + $brandbook
$hexes = [regex]::Matches($all, '#[0-9A-Fa-f]{6}') | ForEach-Object { $_.Value.ToUpperInvariant() } | Sort-Object -Unique
foreach ($hex in $hexes) {
  if ($allowedHex -notcontains $hex) {
    throw "Hexadecimal fora da paleta canÃ´nica: $hex"
  }
}

foreach ($obsolete in @('#302722', '#75685F', '#E6D8C9', '#FFFDF9', '#EADCCF', '#F1DFCA', '#E0C5A0')) {
  Assert-NotContains $all $obsolete
  Assert-NotContains $all $obsolete.ToLowerInvariant()
}

Write-Host 'Color palette validation passed.'
