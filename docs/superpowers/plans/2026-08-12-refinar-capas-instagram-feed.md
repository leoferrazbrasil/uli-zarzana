# Refinar capas Instagram para aplicação real no feed — Plano de implementação

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transformar os quatro mockups Instagram existentes em capas visualmente equivalentes a peças reais de feed, com tipografia dominante, posicionamento individual por fotografia, degradê A1 e nenhuma informação técnica interna.

**Architecture:** Manter a grade, as imagens e a estrutura HTML existentes. A cópia e as variações de posicionamento permanecem controladas pelo JavaScript compartilhado; escala, alinhamento e degradês ficam no CSS compartilhado. O contrato PowerShell valida conteúdo, remoções e seletores antes da inspeção visual responsiva.

**Tech Stack:** HTML5 estático, CSS3, JavaScript sem dependências, PowerShell, Playwright/Chrome para renderização, Obsidian Markdown, Git e FTP.

## Global Constraints

- Manter as quatro fotografias, sua ordem, seus enquadramentos, a proporção 9:16 e a distribuição da grade.
- Usar Libre Baskerville 700 na headline e Source Sans 3 no contexto e subtítulo.
- Usar headline entre 34 e 42 px e textos auxiliares entre 15 e 18 px na prévia dos cards.
- Limitar cada capa a contexto, headline e subtítulo, totalizando no máximo três linhas visuais.
- Posicionar o bloco individualmente em `central inferior`, `superior central`, `superior` e `superior central`, nessa ordem.
- Usar somente marrom profundo `#332A26` e espresso do sistema nos degradês; champagne e terracota permanecem acentos tipográficos.
- Remover integralmente o rodapé interno `Uli Zarzana · capa · 9:16`.
- Não inserir métricas, ícones, moldura de perfil ou informações técnicas dentro das capas.
- Preservar trabalhos paralelos não relacionados no diretório.
- Fechar separadamente validação local, cofre, Git `main`, FTP e verificação pública.

---

### Task 1: Reforçar o contrato das capas reais

**Files:**
- Modify: `tests/validate-application-mockups.ps1`

**Interfaces:**
- Consumes: classes `.instagram-cover-card`, `.instagram-cover-card__content`, `.instagram-cover-card__footer` e o array `instagramCoverCopy`.
- Produces: contrato que exige quatro posições individuais, escala mínima e ausência de rodapé técnico.

- [x] **Step 1: Escrever as asserções que devem falhar**

Exigir no CSS os modificadores `instagram-cover-card--career`, `--leadership`, `--authority` e `--ascension` associados a `inset-block-start` ou `justify-content`; exigir headline mínima de `34px`; rejeitar `.instagram-cover-card__footer` renderizado e os textos `Uli Zarzana`, `capa` e `9:16` dentro do script de cópia.

- [x] **Step 2: Executar o teste e confirmar a falha**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-application-mockups.ps1`

Expected: FAIL indicando escala insuficiente, ausência de posicionamento individual ou rodapé técnico ainda presente.

- [x] **Step 3: Manter o teste focado no resultado observável**

O teste deve verificar seletores e conteúdo final, sem acoplar-se a uma coordenada exata que impeça refinamento visual posterior.

### Task 2: Implementar cópia, escala, posições e degradês

**Files:**
- Modify: `web/assets/application-mockups.js`
- Modify: `web/assets/application-mockups.css`

**Interfaces:**
- Consumes: quatro cards existentes na ordem carreira, liderança, autoridade e ascensão.
- Produces: quatro capas com headline dominante, contexto e subtítulo curtos, classes de posição por fotografia e degradê A1.

- [x] **Step 1: Remover a interface técnica interna**

Ocultar ou retirar o conteúdo de `.instagram-cover-card__footer` sem alterar a legenda externa da seção.

- [x] **Step 2: Ajustar a escala editorial**

Definir headline responsiva com base mínima de `34px`, limite de `42px`, line-height entre `.92` e `1`; contexto e subtítulo entre `15px` e `18px`, mantendo B1.

- [x] **Step 3: Aplicar posição por fotografia**

Usar os modificadores já existentes para posicionar os blocos: carreira no centro inferior; liderança no topo central; autoridade no topo; ascensão no topo central. Preservar rostos, microfone, gesto e grupo.

- [x] **Step 4: Individualizar o degradê**

Definir `::after` por modificador, concentrando marrom profundo ou espresso atrás do respectivo bloco textual e mantendo transição transparente sobre a fotografia.

- [x] **Step 5: Executar o contrato**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-application-mockups.ps1`

Expected: `Application mockups validation passed.`

### Task 3: Verificar responsividade e qualidade visual

**Files:**
- Verify: `web/identidade-visual/index.html`
- Verify: `web/brandbook/index.html`
- Verify: `web/assets/application-mockups.css`
- Verify: `web/assets/application-mockups.js`

**Interfaces:**
- Consumes: páginas estáticas e ativos compartilhados atualizados.
- Produces: evidência visual desktop e mobile sem overflow, sobreposição crítica ou aparência técnica.

- [x] **Step 1: Executar todos os validadores**

Run: `Get-ChildItem tests/validate-*.ps1 | Sort-Object Name | ForEach-Object { & $_.FullName }`

Expected: todos os validadores passam.

- [x] **Step 2: Renderizar desktop**

Abrir a página local em viewport `1440 × 1000`, navegar até `.application-mockup-section--instagram` e capturar screenshot. Confirmar quatro colunas, headline dominante e posições individualizadas.

- [x] **Step 3: Renderizar mobile**

Abrir a página local em viewport `390 × 844` e confirmar uma coluna, leitura imediata, ausência de overflow e nenhum rodapé técnico.

- [x] **Step 4: Refinar apenas se a inspeção reprovar algum critério**

Alterar somente CSS/cópia das capas Instagram; não tocar fotografias, grade geral, apresentação, site ou material da mentoria.

### Task 4: Registrar, publicar e versionar

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Mockups de Aplicação do Sistema Visual - A1 B1 T1 F1 2026-08-12.md`
- Publish: `web/identidade-visual/index.html`
- Publish: `web/brandbook/index.html`
- Publish: `web/assets/application-mockups.css`
- Publish: `web/assets/application-mockups.js`

**Interfaces:**
- Consumes: implementação e evidência visual aprovadas localmente.
- Produces: decisão durável no cofre, publicação pública e histórico Git na `main`.

- [x] **Step 1: Atualizar o cofre**

Registrar escala, posições, degradês, remoção do rodapé técnico e validações desktop/mobile usando Obsidian Markdown.

- [ ] **Step 2: Publicar via FTP**

Enviar somente os dois HTML já públicos, o CSS e o JavaScript compartilhados aos caminhos equivalentes em `public_html`, sem persistir credenciais.

- [ ] **Step 3: Verificar publicamente**

Confirmar HTTP 200 para as duas páginas, CSS e JavaScript; renderizar a seção pública e confirmar quatro capas, ausência de rodapé técnico e escala dominante.

- [ ] **Step 4: Versionar somente os arquivos da tarefa**

Stage explícito dos arquivos deste plano, `git diff --cached --check`, commit de implementação, push para `origin/main`; atualizar o cofre com commit e versão pública e criar commit documental final.

- [ ] **Step 5: Confirmar estado final**

Executar novamente todos os validadores, `git status --short` e `git log -2 --oneline --decorate`; relatar separadamente local, cofre, Git, FTP e público.
