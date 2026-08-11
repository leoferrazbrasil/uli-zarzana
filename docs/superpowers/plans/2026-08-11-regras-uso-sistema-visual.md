# Regras de uso do sistema visual Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publicar e registrar um manual operacional v1 para uso consistente da identidade visual A1/T1/B1/F1, mantendo o selo institucional fora do escopo.

**Architecture:** A especificação define as regras canônicas. O brandbook público será a documentação completa; a página de identidade visual exibirá um resumo operacional; o cofre Obsidian manterá a fonte estratégica interna. Um teste PowerShell verificará a presença das regras e a proteção contra a interpretação do monograma como logo final.

**Tech Stack:** Markdown/Obsidian, HTML estático, CSS existente com custom properties, PowerShell, Git e FTP.

## Global Constraints

- Não alterar nem refinar o selo institucional nesta etapa.
- Usar as cores e fontes já aprovadas por tokens.
- Não criar cores, gradientes ou sombras coloridas novas.
- Manter o monograma como conceito em desenvolvimento, sem regras finais de logo.
- Atualizar o cofre `cofre-uli`, publicar via FTP e fazer commit/push na `main`.
- Deixar fora do commit os arquivos não relacionados já modificados no worktree.

---

### Task 1: Criar o contrato automatizado das regras

**Files:**
- Create: `tests/validate-visual-rules.ps1`

**Interfaces:**
- Consumes: `web/identidade-visual/index.html`, `web/brandbook/index.html`, `cofre-uli/02 - Identidade Visual/Regras de Uso do Sistema Visual - A1 B1 F1.md`.
- Produces: validação textual das regras canônicas e do limite do monograma.

- [ ] **Step 1: Escrever o teste que deve falhar**

Exigir os marcadores das seções de cor, tipografia, composição, fotografia, aplicações e limite do monograma nas páginas e na nota do cofre.

- [ ] **Step 2: Executar o teste para confirmar a falha correta**

Run: `powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-visual-rules.ps1`

Expected: FAIL porque as seções ainda não foram adicionadas.

### Task 2: Atualizar a identidade visual pública

**Files:**
- Modify: `web/identidade-visual/index.html`

**Interfaces:**
- Consumes: especificação aprovada e tokens existentes.
- Produces: seção pública resumida `#regras` com cor, tipografia, fotografia, composição e limite do monograma.

- [ ] **Step 1: Adicionar navegação para regras**

Adicionar o link `Regras de uso` ao menu existente.

- [ ] **Step 2: Adicionar a seção operacional**

Criar uma seção editorial com cartões ou lista curta, sem transformar a página em dashboard, incluindo a frase de que o monograma continua provisório.

- [ ] **Step 3: Ajustar responsividade da seção**

Reutilizar a grade responsiva existente e manter leitura em uma coluna em telas pequenas.

### Task 3: Consolidar o brandbook e o cofre

**Files:**
- Modify: `web/brandbook/index.html`
- Create: `cofre-uli/02 - Identidade Visual/Regras de Uso do Sistema Visual - A1 B1 F1.md`
- Modify: `cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md`
- Modify: `README.md`

**Interfaces:**
- Consumes: seção pública da Task 2 e a especificação.
- Produces: documentação completa no brandbook, nota Obsidian com wikilinks e roadmap atualizado.

- [ ] **Step 1: Inserir a seção completa no brandbook**

Documentar cor, tipografia, composição, fotografia, aplicações prioritárias e limite do monograma; renumerar as seções seguintes.

- [ ] **Step 2: Criar a nota Obsidian**

Usar frontmatter, callout de decisão e wikilinks para a direção visual e paleta técnica. Não reproduzir dados pessoais das pesquisas.

- [ ] **Step 3: Atualizar a direção visual e o README**

Marcar a documentação operacional como concluída e manter pendentes apenas as regras finais do monograma e o brandbook técnico completo.

- [ ] **Step 4: Executar o teste para confirmar a implementação**

Run: `powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-visual-rules.ps1`

Expected: `Visual rules validation passed.`

### Task 4: Validar, publicar e versionar

**Files:**
- No additional source files beyond Tasks 1–3.

**Interfaces:**
- Consumes: páginas, cofre e testes verdes.
- Produces: FTP atualizado, URLs públicas verificadas, commit/push na `main`.

- [ ] **Step 1: Executar todos os testes existentes**

Run: `Get-ChildItem tests/validate-*.ps1 | ForEach-Object { powershell -NoProfile -ExecutionPolicy Bypass -File $_.FullName }`

Expected: todos os scripts terminam com exit code 0.

- [ ] **Step 2: Verificar HTTP local**

Servir `web` localmente e consultar as páginas e tokens; esperar HTTP 200 e marcadores das regras.

- [ ] **Step 3: Publicar via FTP**

Enviar `web/identidade-visual/index.html`, `web/brandbook/index.html` e `web/assets/design-tokens.css` para a raiz pública já verificada.

- [ ] **Step 4: Verificar produção**

Consultar as três URLs públicas e confirmar HTTP 200, seção `Regras de uso`, tokens canônicos e limite explícito do monograma.

- [ ] **Step 5: Commitar e fazer push apenas dos arquivos desta tarefa**

Usar `git diff --check`, adicionar somente os caminhos aprovados e fazer commit/push na `main`; não incluir os artefatos não relacionados do monograma.
