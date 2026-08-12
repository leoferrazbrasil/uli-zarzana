$ErrorActionPreference = 'Stop'

function Assert-Condition {
    param(
        [bool]$Condition,
        [string]$Message
    )

    if (-not $Condition) {
        throw "FAIL: $Message"
    }
}

$root = Split-Path -Parent $PSScriptRoot
$derivativeDir = Join-Path $root 'web\assets\fotografia'
$identityPath = Join-Path $root 'web\identidade-visual\index.html'
$brandbookPath = Join-Path $root 'web\brandbook\index.html'
$expected = @{
    'uli-f1-015-hero-1600x900.jpg' = '1600x900'
    'uli-f1-015-presenca-720x900.jpg' = '720x900'
    'uli-f1-080-autoridade-720x900.jpg' = '720x900'
    'uli-f1-082-lideranca-720x900.jpg' = '720x900'
    'uli-f1-087-ascensao-720x900.jpg' = '720x900'
}

Assert-Condition (Test-Path -LiteralPath $derivativeDir -PathType Container) 'A pasta de derivados não existe.'
Assert-Condition (Test-Path -LiteralPath $identityPath -PathType Leaf) 'A página de identidade visual não existe.'
Assert-Condition (Test-Path -LiteralPath $brandbookPath -PathType Leaf) 'A página de brandbook não existe.'

foreach ($item in $expected.GetEnumerator()) {
    $path = Join-Path $derivativeDir $item.Key
    Assert-Condition (Test-Path -LiteralPath $path -PathType Leaf) "Derivado ausente: $($item.Key)."
    Assert-Condition ((Get-Item -LiteralPath $path).Length -gt 0) "Derivado vazio: $($item.Key)."
}

Add-Type -AssemblyName System.Drawing
foreach ($item in $expected.GetEnumerator()) {
    $path = Join-Path $derivativeDir $item.Key
    $image = [System.Drawing.Image]::FromFile($path)
    try {
        $actual = "$($image.Width)x$($image.Height)"
        Assert-Condition ($actual -eq $item.Value) "Dimensão inválida em $($item.Key): $actual; esperado $($item.Value)."
    } finally {
        $image.Dispose()
    }
}

$identity = Get-Content -LiteralPath $identityPath -Raw -Encoding UTF8
$brandbook = Get-Content -LiteralPath $brandbookPath -Raw -Encoding UTF8
Assert-Condition ($identity.Contains('id="aplicacoes-f1"')) 'A identidade visual não contém a seção F1.'
Assert-Condition ($identity.Contains('photo-cards.css')) 'A identidade visual não carrega o CSS dos cards.'
Assert-Condition ($brandbook.Contains('h2>7.') -and $brandbook.Contains('photo-card-grid')) 'O brandbook não contém a seção F1.'
Assert-Condition ($brandbook.Contains('photo-cards.css')) 'O brandbook não carrega o CSS dos cards.'
foreach ($filename in $expected.Keys) {
    if ($filename -ne 'uli-f1-015-hero-1600x900.jpg') {
        Assert-Condition ($identity.Contains($filename)) "Derivado não referenciado na identidade visual: $filename."
        Assert-Condition ($brandbook.Contains($filename)) "Derivado não referenciado no brandbook: $filename."
    }
}
Assert-Condition ($identity.Contains('uli-f1-015-hero-1600x900.jpg')) 'Hero não referenciado na identidade visual.'
Assert-Condition (-not $identity.Contains('fotos/uli-')) 'A identidade visual referencia fonte privada bruta.'
Assert-Condition (-not $brandbook.Contains('fotos/uli-')) 'O brandbook referencia fonte privada bruta.'

Write-Output 'PASS: 5 derivados web, dimensões, referências HTML e privacidade validadas.'
