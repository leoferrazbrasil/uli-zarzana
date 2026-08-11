# Paleta técnica definitiva Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Normalizar a paleta A1 da Uli Zarzana em quatro tokens canônicos, aplicar regras técnicas nas páginas e publicar a decisão aprovada.

**Architecture:** O arquivo `web/assets/design-tokens.css` será a fonte de tokens para as páginas estáticas. Um teste PowerShell verificará os valores canônicos, os pares de contraste documentados e a ausência de cores concorrentes nas duas páginas. O cofre Obsidian registrará a decisão estratégica e técnica sem dados pessoais.

**Tech Stack:** HTML estático, CSS custom properties, PowerShell, Obsidian Markdown, Git, FTP.

## Global Constraints

- Usar somente `#332A26`, `#F7F0E7`, `#CDAE85` e `#B46F52` como cores canônicas da identidade.
- Não introduzir uma quinta cor funcional.
- Texto normal deve usar marrom sobre marfim ou marfim sobre marrom.
- Champagne não pode ser texto pequeno sobre marfim.
- Terracota não pode ser texto normal sobre marfim.
- Não alterar os arquivos não relacionados já modificados no worktree.
- Após a implementação, atualizar `cofre-uli`, publicar via FTP, verificar as URLs públicas e fazer commit/push na `main`.

---

### Task 1: Criar o contrato automatizado da paleta

**Files:**
- Create: `tests/validate-color-palette.ps1`
- Test: `tests/validate-color-palette.ps1`

**Interfaces:**
- Consumes: `web/assets/design-tokens.css`, `web/identidade-visual/index.html`, `web/brandbook/index.html`.
- Produces: validação textual dos quatro tokens, regras de uso e pares permitidos/proibidos.

- [ ] **Step 1: Escrever o teste que deve falhar antes dos tokens existirem**

O teste deve exigir os quatro tokens e os textos de regra nas duas páginas. Deve rejeitar qualquer hex adicional encontrado no CSS de tokens ou nas páginas, exceto os quatro valores canônicos.

- [ ] **Step 2: Executar o teste para confirmar a falha correta**

Run: `powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-color-palette.ps1`

Expected: FAIL porque os tokens de cor ainda não existem no arquivo CSS.

### Task 2: Implementar os tokens e as regras visíveis

**Files:**
- Modify: `web/assets/design-tokens.css`
- Modify: `web/identidade-visual/index.html`
- Modify: `web/brandbook/index.html`

**Interfaces:**
- Consumes: contrato da Task 1.
- Produces: tokens `--color-ink`, `--color-paper`, `--color-accent-champagne` e `--color-accent-terracotta`, mais regras técnicas visíveis nas páginas.

- [ ] **Step 1: Adicionar os quatro tokens canônicos ao CSS**

Inserir os tokens primitivos e semânticos no `:root`, mantendo os tokens tipográficos existentes.

- [ ] **Step 2: Substituir cores concorrentes nas páginas**

Atualizar as referências de cor para os tokens canônicos e remover hexadecimais exploratórios que não pertençam à paleta oficial.

- [ ] **Step 3: Registrar as regras de combinação nas duas páginas**

Exibir a função de cada cor, os pares de alto contraste e as restrições de champagne e terracota para texto normal.

- [ ] **Step 4: Executar o teste para confirmar a implementação**

Run: `powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-color-palette.ps1`

Expected: `Color palette validation passed.`

### Task 3: Registrar no cofre Obsidian

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md`
- Create: `cofre-uli/02 - Identidade Visual/Paleta Técnica Definitiva - A1.md`

**Interfaces:**
- Consumes: especificação aprovada e resultado do teste da Task 2.
- Produces: registro Obsidian com a decisão, evidências, valores técnicos, regras e status de implementação/publicação.

- [ ] **Step 1: Atualizar o status da paleta na direção visual**

Marcar a validação da paleta como concluída e apontar para a nova nota usando wikilink.

- [ ] **Step 2: Criar a nota técnica com frontmatter e callouts**

Registrar a decisão determinística, a matriz de evidências, os valores HEX/RGB/CMYK, o contraste e as regras de uso, sem nomes, contatos ou credenciais das pesquisas.

- [ ] **Step 3: Verificar a nota como Markdown UTF-8**

Run: `Get-Content -Raw -Encoding UTF8 'cofre-uli/02 - Identidade Visual/Paleta Técnica Definitiva - A1.md'`

Expected: frontmatter válido, wikilink para a direção visual e callout de decisão aprovado.

### Task 4: Validar, publicar e versionar

**Files:**
- No additional source files beyond Tasks 1–3.

**Interfaces:**
- Consumes: implementação local, nota Obsidian e teste verde.
- Produces: publicação FTP verificada, commit na `main` e push para `origin/main`.

- [ ] **Step 1: Executar todos os testes de identidade e brandbook**

Run: `Get-ChildItem tests/validate-*.ps1 | ForEach-Object { powershell -NoProfile -ExecutionPolicy Bypass -File $_.FullName }`

Expected: todos os scripts terminam com exit code 0.

- [ ] **Step 2: Servir as páginas localmente e verificar HTTP 200**

Run: `python -m http.server 4173 --directory web` em processo temporário, depois consultar `/identidade-visual/`, `/brandbook/` e `/assets/design-tokens.css`.

Expected: HTTP 200 e conteúdo contendo os quatro tokens.

- [ ] **Step 3: Publicar somente os arquivos aprovados via FTP**

Enviar `web/assets/design-tokens.css`, `web/identidade-visual/index.html` e `web/brandbook/index.html` para os caminhos equivalentes na raiz pública FTP já verificada, sem registrar a senha em arquivos.

- [ ] **Step 4: Verificar as URLs públicas**

Consultar `https://ulizarzana.com/identidade-visual/`, `https://ulizarzana.com/brandbook/` e `https://ulizarzana.com/assets/design-tokens.css` e confirmar HTTP 200, tokens canônicos e regras visíveis.

- [ ] **Step 5: Conferir o diff e fazer commit/push somente dos arquivos da tarefa**

Run: `git diff --check`; depois `git add docs/superpowers/specs/2026-08-11-paleta-tecnica-definitiva-design.md docs/superpowers/plans/2026-08-11-paleta-tecnica-definitiva.md tests/validate-color-palette.ps1 web/assets/design-tokens.css web/identidade-visual/index.html web/brandbook/index.html "cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md" "cofre-uli/02 - Identidade Visual/Paleta Técnica Definitiva - A1.md"`; commitar e fazer push na `main`.

Expected: arquivos da tarefa versionados; alterações não relacionadas permanecem fora do commit.
