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
$photoDir = Join-Path $root 'fotos'
$inventoryPath = Join-Path $root 'cofre-uli\02 - Identidade Visual\Inventario-Fotografico-Acervo-Uli-2026-08-12.md'
$shortlistPath = Join-Path $root 'cofre-uli\02 - Identidade Visual\Shortlist-F1-Fotografias-Uli-2026-08-12.md'
$expectedIds = @(7, 15, 16, 80, 81, 82, 87, 91, 93, 98)

Assert-Condition (Test-Path -LiteralPath $photoDir -PathType Container) 'A pasta fotos não existe.'
Assert-Condition (Test-Path -LiteralPath $inventoryPath -PathType Leaf) 'O inventário não existe.'
Assert-Condition (Test-Path -LiteralPath $shortlistPath -PathType Leaf) 'A shortlist não existe.'

$inventory = Get-Content -LiteralPath $inventoryPath -Raw -Encoding UTF8
$shortlist = Get-Content -LiteralPath $shortlistPath -Raw -Encoding UTF8
$shortlistRows = @([regex]::Matches($shortlist, '(?m)^\| \d{3} \|'))
Assert-Condition ($shortlistRows.Count -eq 10) "Esperadas 10 linhas na shortlist; encontradas $($shortlistRows.Count)."

$actualIds = @([regex]::Matches($shortlist, '(?m)^\| (\d{3}) \|') | ForEach-Object { [int]$_.Groups[1].Value } | Sort-Object)
Assert-Condition (($actualIds -join ',') -eq (($expectedIds | Sort-Object) -join ',')) 'Os IDs da shortlist não correspondem ao conjunto determinado.'

foreach ($id in $expectedIds) {
    $idText = '{0:000}' -f $id
    $inventoryRow = [regex]::Match($inventory, "(?m)^\| $idText \|.*$")
    Assert-Condition $inventoryRow.Success "ID ausente no inventário: $idText."
    Assert-Condition ($inventoryRow.Value.Contains('| `shortlist-f1` | `confirmada` |')) "ID não marcado como shortlist-f1 e confirmado: $idText."

    $filenameMatch = [regex]::Match($inventoryRow.Value, '`(uli-[^`]+\.jpeg)`')
    Assert-Condition $filenameMatch.Success "Arquivo ausente no registro do ID: $idText."
    $photoPath = Join-Path $photoDir $filenameMatch.Groups[1].Value
    Assert-Condition (Test-Path -LiteralPath $photoPath -PathType Leaf) "Foto da shortlist ausente: $($filenameMatch.Groups[1].Value)."
}

Assert-Condition ($shortlist.Contains('**4 principais**') -and $shortlist.Contains('**2 de autoridade**') -and $shortlist.Contains('**4 de apoio**')) 'A distribuição da shortlist não está registrada.'
Assert-Condition ($shortlist.Contains('autorizacao: confirmada')) 'A shortlist não registra autorização confirmada.'

Write-Output 'PASS: 10 fotos na shortlist, IDs F1 válidos, arquivos presentes e status sincronizado.'
