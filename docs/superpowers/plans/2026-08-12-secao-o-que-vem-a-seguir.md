# Seção “O que vem a seguir” no final — Plano de implementação

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reposicionar a seção de próximos passos como último bloco de conteúdo nas duas páginas públicas.

**Architecture:** O JavaScript compartilhado identifica a seção pelo texto exato do título e usa `appendChild` no `<main>`. O teste estrutural garante que a lógica exista; a verificação com navegador confirma a ordem final do DOM.

**Tech Stack:** HTML estático, JavaScript vanilla, PowerShell, Chrome headless, Obsidian Markdown, Git e FTP.

## Global Constraints

- Preservar integralmente o conteúdo e o estilo das seções.
- Alterar somente a ordem efetiva do DOM.
- Atualizar as duas páginas: identidade visual e brandbook.
- Preservar alterações não relacionadas no diretório.
- Fechar separadamente validação local, cofre, Git, FTP e público.

### Task 1: Criar o contrato de ordem

**Files:**
- Create: `tests/validate-page-order.ps1`

- [x] Escrever teste estrutural que exija os títulos e a operação `appendChild` no script compartilhado.
- [x] Executar o teste e confirmar falha antes da implementação.

### Task 2: Reposicionar as seções

**Files:**
- Modify: `web/assets/application-mockups.js`

- [x] Localizar o `<main>` e as seções pelos títulos.
- [x] Anexar cada seção ao final do `<main>` quando existir.
- [x] Executar o teste estrutural.

### Task 3: Verificar e entregar

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Mockups de Aplicação do Sistema Visual - A1 B1 T1 F1 2026-08-12.md`
- Publish: `web/identidade-visual/index.html`
- Publish: `web/brandbook/index.html`
- Publish: `web/assets/application-mockups.js`

- [x] Verificar a ordem final no DOM em desktop e mobile nas duas páginas.
- [x] Atualizar o cofre com a decisão e evidências.
- [ ] Publicar via FTP e verificar HTTP 200 e ordem pública.
- [ ] Fazer commit/push somente dos arquivos da tarefa.
