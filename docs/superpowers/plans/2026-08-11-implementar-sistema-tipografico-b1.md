# Sistema Tipográfico B1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implementar B1 — Assinatura Executiva nas apresentações estáticas da identidade visual e do brandbook, com tokens tipográficos reutilizáveis e validação automatizada.

**Architecture:** Um arquivo CSS compartilhado em `web/assets/` será a fonte técnica da tipografia. As duas páginas HTML carregarão apenas os pesos aprovados das fontes e consumirão os tokens sem duplicar famílias, pesos ou escalas. Testes PowerShell independentes validarão tokens, aplicação em cada página e ausência dos estilos provisórios Georgia/Arial como famílias primárias.

**Tech Stack:** HTML5 estático, CSS custom properties, Google Fonts, PowerShell 7, Git.

## Global Constraints

- Assinatura principal: `Uli Zarzana`, em caixa mista.
- Serifada principal: Libre Baskerville.
- Sans-serif funcional: Source Sans 3.
- Pesos permitidos: Libre Baskerville 700; Source Sans 3 400, 500 e 600.
- Assinatura: peso 700, altura de linha 1 e espaçamento `-0.035em`.
- Títulos: peso 700, altura de linha entre `1.05` e `1.15` e espaçamento `-0.025em`.
- Texto corrido: mínimo de `16px`, altura de linha entre `1.5` e `1.65`.
- Etiquetas em caixa alta: somente trechos curtos, peso 600 e espaçamento entre `0.14em` e `0.18em`.
- Contraste mínimo: `4.5:1` para texto normal e `3:1` para texto grande.
- Fallback serifado: `"Libre Baskerville", Georgia, serif`.
- Fallback sans-serif: `"Source Sans 3", "Segoe UI", Arial, sans-serif`.
- Carregar somente os pesos utilizados e usar `display=swap`.
- Não alterar o selo institucional, os SVGs do monograma ou a paleta nesta implementação.
- Não incluir credenciais, fontes binárias, pesquisas, documentos pessoais ou fotografias brutas no Git.
- Não publicar por FTP neste plano; Git, hospedagem e página pública são estados separados.
- Preservar todas as alterações preexistentes fora dos arquivos explicitamente listados em cada tarefa.

---

## File Map

- Create: `web/assets/design-tokens.css` — fonte única dos tokens tipográficos primitivos, semânticos e de componente.
- Create: `tests/validate-typography-tokens.ps1` — contrato automatizado do arquivo de tokens.
- Modify: `web/identidade-visual/index.html` — aplicação visual da assinatura B1 e da hierarquia aprovada.
- Create: `tests/validate-identity-typography.ps1` — contrato da página de identidade visual.
- Modify: `web/brandbook/index.html` — documentação pública da tipografia aprovada e aplicação do mesmo sistema.
- Create: `tests/validate-brandbook-typography.ps1` — contrato da página do brandbook.
- Modify: `README.md` — atualização do estado do projeto e da sequência de trabalho.

### Task 1: Criar a fonte única de tokens tipográficos

**Files:**
- Create: `tests/validate-typography-tokens.ps1`
- Create: `web/assets/design-tokens.css`

**Interfaces:**
- Consumes: especificação `docs/superpowers/specs/2026-08-11-sistema-tipografico-b1-assinatura-executiva-design.md`.
- Produces: variáveis CSS `--font-*`, `--weight-*`, `--tracking-*`, `--leading-*` e `--type-*` consumidas pelas duas páginas.

- [ ] **Step 1: Escrever o teste de contrato dos tokens**

```powershell
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

if ($css -match '#[0-9a-fA-F]{3,8}') {
  throw 'Tokens de cor não pertencem à implementação tipográfica.'
}

Write-Host 'Typography token validation passed.'
```

- [ ] **Step 2: Executar o teste e confirmar a falha inicial**

Run: `pwsh -NoProfile -File tests/validate-typography-tokens.ps1`

Expected: FAIL com `Arquivo ausente: ...web\assets\design-tokens.css`.

- [ ] **Step 3: Criar os tokens tipográficos em três camadas**

```css
:root {
  /* Primitive */
  --font-family-serif: "Libre Baskerville", Georgia, serif;
  --font-family-sans: "Source Sans 3", "Segoe UI", Arial, sans-serif;
  --weight-regular: 400;
  --weight-medium: 500;
  --weight-semibold: 600;
  --weight-bold: 700;
  --tracking-signature: -0.035em;
  --tracking-heading: -0.025em;
  --tracking-label: 0.16em;
  --leading-signature: 1;
  --leading-display: 1.05;
  --leading-heading: 1.15;
  --leading-body: 1.6;
  --leading-label: 1.2;
  --type-body: 1rem;
  --type-label: 0.75rem;

  /* Semantic */
  --font-signature: var(--font-family-serif);
  --font-heading: var(--font-family-serif);
  --font-body: var(--font-family-sans);
  --font-interface: var(--font-family-sans);

  /* Component */
  --type-signature-size: clamp(1.875rem, 4vw, 3rem);
  --type-display-size: clamp(2.375rem, 6vw, 4rem);
  --type-h1-size: clamp(2.125rem, 5vw, 3.25rem);
  --type-h2-size: clamp(1.75rem, 4vw, 2.5rem);
  --type-h3-size: clamp(1.375rem, 3vw, 1.75rem);
  --type-body-large-size: clamp(1.125rem, 2vw, 1.25rem);
}
```

- [ ] **Step 4: Executar o teste e confirmar a aprovação**

Run: `pwsh -NoProfile -File tests/validate-typography-tokens.ps1`

Expected: `Typography token validation passed.` e exit code 0.

- [ ] **Step 5: Versionar somente tokens e teste**

```powershell
git add -- web/assets/design-tokens.css tests/validate-typography-tokens.ps1
git diff --cached --check
git commit -m "feat: add B1 typography tokens"
```

### Task 2: Aplicar B1 à apresentação da identidade visual

**Files:**
- Create: `tests/validate-identity-typography.ps1`
- Modify: `web/identidade-visual/index.html`

**Interfaces:**
- Consumes: `../assets/design-tokens.css` e as famílias carregadas no documento.
- Produces: cabeçalho nominal B1, títulos Libre Baskerville 700, textos Source Sans 3 e conteúdo atualizado de T1.

- [ ] **Step 1: Escrever o teste da página de identidade visual**

```powershell
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pagePath = Join-Path $root 'web\identidade-visual\index.html'
$html = Get-Content -Raw -Encoding UTF8 -LiteralPath $pagePath

$required = @(
  'family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap',
  'href="../assets/design-tokens.css"',
  'class="brand-name">Uli Zarzana</strong>',
  'B1 · Assinatura Executiva',
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
```

- [ ] **Step 2: Executar o teste e confirmar a falha inicial**

Run: `pwsh -NoProfile -File tests/validate-identity-typography.ps1`

Expected: FAIL com o primeiro contrato B1 ainda ausente.

- [ ] **Step 3: Carregar fontes e tokens no `<head>`**

Adicionar imediatamente antes de `<style>`:

```html
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/design-tokens.css">
```

- [ ] **Step 4: Substituir as famílias provisórias pelos tokens**

Aplicar estes contratos no CSS existente, preservando cores, espaçamentos e layout:

```css
body{font-family:var(--font-body);font-size:var(--type-body);line-height:var(--leading-body)}
.brand-name{font-family:var(--font-signature);font-size:18px;font-weight:var(--weight-bold);line-height:var(--leading-signature);letter-spacing:var(--tracking-signature)}
.mark,.floating,.round{font-family:var(--font-heading);font-weight:var(--weight-bold)}
.hero h1,.section h2,.card h3,.social blockquote,.doc h3{font-family:var(--font-heading);font-weight:var(--weight-bold);letter-spacing:var(--tracking-heading)}
.eyebrow,.code,.mock-label,.brand small,.copyright{font-family:var(--font-interface);font-weight:var(--weight-semibold);letter-spacing:var(--tracking-label)}
```

Remover de declarações locais todos os usos de `Georgia,serif`, `Arial,sans-serif` e os pesos serifados `400`. Manter os fallbacks apenas no arquivo de tokens.

- [ ] **Step 5: Marcar a assinatura no cabeçalho e atualizar T1**

Substituir o conteúdo correspondente por:

```html
<strong class="brand-name">Uli Zarzana</strong>
```

```html
<article class="card"><div class="code">T1 · tipografia</div><h3>B1 · Assinatura Executiva</h3><p>Libre Baskerville 700 na assinatura e nos títulos; Source Sans 3 nos textos e elementos funcionais.</p></article>
```

Na lista “O que vem a seguir”, substituir `seleção de famílias tipográficas e pesos;` por `validação responsiva e de acessibilidade do sistema tipográfico B1;`.

- [ ] **Step 6: Executar os testes da tarefa**

Run:

```powershell
pwsh -NoProfile -File tests/validate-typography-tokens.ps1
pwsh -NoProfile -File tests/validate-identity-typography.ps1
```

Expected: os dois scripts exibem `validation passed.` e retornam exit code 0.

- [ ] **Step 7: Versionar somente a apresentação e seu teste**

```powershell
git add -- web/identidade-visual/index.html tests/validate-identity-typography.ps1
git diff --cached --check
git commit -m "feat: apply B1 typography to visual identity"
```

### Task 3: Aplicar e documentar B1 no brandbook preliminar

**Files:**
- Create: `tests/validate-brandbook-typography.ps1`
- Modify: `web/brandbook/index.html`

**Interfaces:**
- Consumes: `../assets/design-tokens.css`, o mesmo carregamento de fontes e os papéis tipográficos da Task 2.
- Produces: brandbook coerente com a decisão B1, sem textos que indiquem famílias pendentes.

- [ ] **Step 1: Escrever o teste da página do brandbook**

```powershell
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pagePath = Join-Path $root 'web\brandbook\index.html'
$html = Get-Content -Raw -Encoding UTF8 -LiteralPath $pagePath

$required = @(
  'family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap',
  'href="../assets/design-tokens.css"',
  'B1 · Assinatura Executiva',
  'Libre Baskerville 700',
  'Source Sans 3',
  'Família e tratamento aprovados',
  'font-family:var(--font-body)',
  'font-family:var(--font-heading)',
  'font-family:var(--font-signature)'
)

foreach ($value in $required) {
  if (-not $html.Contains($value)) { throw "Contrato ausente: $value" }
}

$forbidden = @('família pendente', 'Selecionar famílias tipográficas')
foreach ($value in $forbidden) {
  if ($html.Contains($value)) { throw "Estado obsoleto presente: $value" }
}

if ($html -match 'font(?:-family)?:[^;}]*\b(?:Georgia|Arial)\b') {
  throw 'O brandbook ainda possui Georgia ou Arial como família primária local.'
}

Write-Host 'Brandbook typography validation passed.'
```

- [ ] **Step 2: Executar o teste e confirmar a falha inicial**

Run: `pwsh -NoProfile -File tests/validate-brandbook-typography.ps1`

Expected: FAIL porque o brandbook ainda declara famílias pendentes.

- [ ] **Step 3: Carregar fontes e tokens no `<head>`**

Adicionar imediatamente antes de `<style>`:

```html
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&amp;family=Source+Sans+3:wght@400;500;600&amp;display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/design-tokens.css">
```

- [ ] **Step 4: Aplicar os mesmos papéis tipográficos da identidade visual**

```css
body{font-family:var(--font-body);font-size:var(--type-body);line-height:var(--leading-body)}
.brand{font-family:var(--font-signature);font-weight:var(--weight-bold);line-height:var(--leading-signature);letter-spacing:var(--tracking-signature)}
h1,h2,h3{font-family:var(--font-heading);font-weight:var(--weight-bold);letter-spacing:var(--tracking-heading)}
.eyebrow,.approved,.table th{font-family:var(--font-interface);font-weight:var(--weight-semibold);letter-spacing:var(--tracking-label)}
```

Remover as famílias locais Georgia/Arial e preservar os fallbacks exclusivamente em `design-tokens.css`.

- [ ] **Step 5: Atualizar a decisão T1 e a tabela de uso**

No painel T1, usar:

```html
<article class="panel"><h3>B1 · Assinatura Executiva</h3><p>Uli Zarzana em Libre Baskerville 700, com títulos editoriais na mesma família e textos funcionais em Source Sans 3.</p></article>
```

Na tabela, substituir as duas linhas tipográficas por:

```html
<tr><td>Libre Baskerville 700</td><td>Assinatura nominal, títulos e mensagens de posicionamento</td><td>Família e tratamento aprovados</td></tr><tr><td>Source Sans 3</td><td>Textos, legendas, informações e interface</td><td>Família e pesos 400, 500 e 600 aprovados</td></tr>
```

Atualizar a data editorial para `11 agosto 2026` e substituir `Selecionar famílias tipográficas e validar licenças.` por `Validar o sistema tipográfico B1 em conteúdos e formatos reais.`.

- [ ] **Step 6: Executar os testes da tarefa**

Run:

```powershell
pwsh -NoProfile -File tests/validate-typography-tokens.ps1
pwsh -NoProfile -File tests/validate-brandbook-typography.ps1
```

Expected: os dois scripts exibem `validation passed.` e retornam exit code 0.

- [ ] **Step 7: Versionar somente o brandbook e seu teste**

```powershell
git add -- web/brandbook/index.html tests/validate-brandbook-typography.ps1
git diff --cached --check
git commit -m "docs: document B1 typography in brandbook"
```

### Task 4: Atualizar o estado do projeto e validar o conjunto

**Files:**
- Modify: `README.md`

**Interfaces:**
- Consumes: resultados dos três testes e as páginas finais das Tasks 2 e 3.
- Produces: estado documental coerente, verificação HTTP local e checkpoint de revisão visual.

- [ ] **Step 1: Atualizar o estado tipográfico no README**

Adicionar após a lista A1/T1/M2/F1:

```markdown
O sistema tipográfico foi aprovado como **B — Clássica Executiva**, no tratamento **B1 — Assinatura Executiva**:

- **Libre Baskerville 700:** assinatura nominal e títulos editoriais.
- **Source Sans 3 400/500/600:** textos, legendas e elementos funcionais.
```

Substituir o item `seleção e licenciamento das fontes definitivas;` da sequência por `validação do sistema tipográfico B1 em aplicações reais;`.

- [ ] **Step 2: Executar toda a validação automatizada**

Run:

```powershell
$tests = @(
  'tests/validate-typography-tokens.ps1',
  'tests/validate-identity-typography.ps1',
  'tests/validate-brandbook-typography.ps1'
)
foreach ($test in $tests) {
  pwsh -NoProfile -File $test
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
```

Expected: três mensagens `validation passed.` e exit code 0.

- [ ] **Step 3: Verificar as duas rotas por HTTP local**

Run:

```powershell
$server = Start-Process -FilePath python -ArgumentList '-m','http.server','8087','--directory','web' -WindowStyle Hidden -PassThru
try {
  Start-Sleep -Seconds 2
  $identity = Invoke-WebRequest -UseBasicParsing -Uri 'http://localhost:8087/identidade-visual/'
  $brandbook = Invoke-WebRequest -UseBasicParsing -Uri 'http://localhost:8087/brandbook/'
  if ($identity.StatusCode -ne 200 -or $brandbook.StatusCode -ne 200) {
    throw 'Uma das rotas não retornou HTTP 200.'
  }
  Write-Host 'Local HTTP validation passed.'
}
finally {
  Stop-Process -Id $server.Id -ErrorAction SilentlyContinue
}
```

Expected: `Local HTTP validation passed.` e exit code 0.

- [ ] **Step 4: Realizar revisão visual responsiva**

Iniciar novamente o servidor para a revisão visual:

```powershell
$visualServer = Start-Process -FilePath python -ArgumentList '-m','http.server','8087','--directory','web' -WindowStyle Hidden -PassThru
Start-Sleep -Seconds 2
```

Abrir `http://localhost:8087/identidade-visual/` e `http://localhost:8087/brandbook/`. Verificar em `1440 × 900` e `390 × 844`:

- assinatura `Uli Zarzana` imediatamente legível;
- títulos sem cortes ou colisões;
- textos corridos com no mínimo 16 px;
- etiquetas em caixa alta somente em linhas curtas;
- ausência de mudança de layout desproporcional durante o carregamento;
- contraste mínimo de `4.5:1` para texto normal e `3:1` para texto grande nos fundos marfim e marrom profundo.

Expected: nenhuma quebra visual impeditiva. Registrar capturas de desktop e mobile para revisão humana antes da publicação. Ao concluir a inspeção, encerrar o servidor:

```powershell
Stop-Process -Id $visualServer.Id -ErrorAction SilentlyContinue
```

- [ ] **Step 5: Versionar documentação e concluir a implementação local**

```powershell
git add -- README.md
git diff --cached --check
git commit -m "docs: update B1 typography project status"
git status --short
```

Expected: o commit contém apenas `README.md`; alterações preexistentes e a migração `cofre`/`cofre-uli` continuam fora do índice.

- [ ] **Step 6: Enviar os commits para a main e confirmar sincronização**

```powershell
git push origin main
$local = (git rev-parse HEAD).Trim()
$remote = (git ls-remote origin refs/heads/main).Split("`t")[0]
if ($local -ne $remote) { throw 'main local e origin/main não estão sincronizadas.' }
Write-Host 'Git main sync passed.'
```

Expected: `Git main sync passed.`.

## Publication Gate

A publicação na Hostinger não faz parte deste plano. Depois da aprovação visual local, criar uma execução separada que:

1. envie somente `web/assets/design-tokens.css`, `web/identidade-visual/index.html` e `web/brandbook/index.html` aos subdiretórios públicos correspondentes;
2. não altere a raiz do domínio;
3. verifique separadamente HTTP 200, carregamento das fontes e conteúdo B1 nas duas URLs públicas;
4. registre Git, FTP e página pública como três estados independentes.
