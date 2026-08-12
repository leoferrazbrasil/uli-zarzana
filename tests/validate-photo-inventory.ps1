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
$allowedCategories = @(
    'ambiente-lifestyle',
    'bastidores-trabalho',
    'corporativa-documental',
    'equipe-corporativa',
    'equipe-lifestyle',
    'esporte-lifestyle',
    'evento-corporativo',
    'gastronomia-ambiente',
    'leitura-bem-estar',
    'lifestyle-pessoal',
    'palestra-apresentacao',
    'retrato-corporativo',
    'retrato-editorial',
    'viagem-lifestyle'
)

Assert-Condition (Test-Path -LiteralPath $photoDir -PathType Container) 'A pasta fotos não existe.'
Assert-Condition (Test-Path -LiteralPath $inventoryPath -PathType Leaf) 'O inventário Obsidian não existe.'

$files = @(Get-ChildItem -LiteralPath $photoDir -File -Filter '*.jpeg' | Sort-Object Name)
Assert-Condition ($files.Count -eq 108) "Esperados 108 JPEGs; encontrados $($files.Count)."

$ids = [System.Collections.Generic.List[int]]::new()
$filenames = [System.Collections.Generic.List[string]]::new()

foreach ($file in $files) {
    Assert-Condition ($file.Length -gt 0) "Arquivo vazio: $($file.Name)."

    if ($file.Name -notmatch '^uli-(\d{3})-([a-z0-9-]+)\.jpeg$') {
        throw "FAIL: nomenclatura inválida: $($file.Name)."
    }

    $id = [int]$Matches[1]
    $category = $Matches[2]
    Assert-Condition ($allowedCategories -contains $category) "Categoria inválida em $($file.Name): $category."
    $ids.Add($id)
    $filenames.Add($file.Name)
}

Assert-Condition (($ids | Sort-Object -Unique).Count -eq 108) 'Há IDs duplicados no acervo.'
Assert-Condition (($ids | Sort-Object) -join ',' -eq ((1..108) -join ',')) 'Os IDs não cobrem exatamente 001 a 108.'

$inventory = Get-Content -LiteralPath $inventoryPath -Raw -Encoding UTF8
$inventoryRows = @([regex]::Matches($inventory, '(?m)^\| \d{3} \|'))
Assert-Condition ($inventoryRows.Count -eq 108) "O inventário deve conter 108 registros; encontrados $($inventoryRows.Count)."
Assert-Condition ($inventory.Contains("autorizacao: confirmada")) 'O inventário não registra a autorização confirmada no frontmatter.'
$authorizedRows = @([regex]::Matches($inventory, '(?m)^\| \d{3} \|.*confirmada.*$'))
Assert-Condition ($authorizedRows.Count -eq 108) "Esperadas 108 autorizações confirmadas; encontradas $($authorizedRows.Count)."

foreach ($filename in $filenames) {
    Assert-Condition $inventory.Contains(('`' + $filename + '`')) "Arquivo ausente no inventário: $filename."
}

Write-Output 'PASS: 108 photos, IDs 001-108, valid categories, confirmed authorization, and synchronized inventory.'
