# Derivados oficiais e mockups F1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement the plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Criar derivados web autorizados da shortlist F1 e publicar o padrão de cards editoriais nas páginas de identidade visual e brandbook.

**Architecture:** Os JPEGs brutos permanecem na pasta privada `fotos/`. Derivados 4:5 e 16:9 serão criados em `web/assets/fotografia/`; as páginas estáticas reutilizarão esses arquivos com CSS de gradiente, tipografia e etiquetas. O cofre registrará os ativos e os estados local, Git, FTP e público separadamente.

**Tech Stack:** Python/Pillow para recorte e redimensionamento, HTML5, CSS3, PowerShell, Obsidian Markdown, Git e FTP passivo.

## Global Constraints

- Usar somente os IDs 015, 080, 082 e 087 nesta família pública.
- Não alterar os JPEGs originais.
- Não publicar fotos brutas ou arquivos privados.
- Manter o monograma final fora da aplicação; o marcador UZ é provisório.
- Aplicar a paleta `#332A26`, `#F7F0E7`, `#CDAE85` e `#B46F52`.
- Publicar via FTP somente os arquivos aprovados e verificar as URLs públicas.

---

### Task 1: Gerar derivados fotográficos

**Files:**
- Create: `web/assets/fotografia/uli-f1-015-hero-1600x900.jpg`
- Create: `web/assets/fotografia/uli-f1-015-presenca-720x900.jpg`
- Create: `web/assets/fotografia/uli-f1-080-autoridade-720x900.jpg`
- Create: `web/assets/fotografia/uli-f1-082-lideranca-720x900.jpg`
- Create: `web/assets/fotografia/uli-f1-087-ascensao-720x900.jpg`

**Interfaces:**
- Consumes: `fotos/uli-015-retrato-editorial.jpeg`, `fotos/uli-080-palestra-apresentacao.jpeg`, `fotos/uli-082-corporativa-documental.jpeg`, `fotos/uli-087-equipe-corporativa.jpeg`.
- Produces: JPGs web derivados, sem modificar as fontes.

- [x] Gerar recortes 4:5 e 16:9 com dimensões exatas.
- [x] Validar abertura, dimensões e peso dos arquivos.

### Task 2: Aplicar cards nas páginas públicas

**Files:**
- Modify: `web/identidade-visual/index.html`
- Modify: `web/brandbook/index.html`
- Modify: `.gitignore`

**Interfaces:**
- Consumes: derivados da Task 1 e tokens existentes.
- Produces: mockups estáticos publicados nas duas páginas.

- [x] Adicionar a família de cards verticais com imagem, gradiente, etiqueta, ícone e texto.
- [x] Atualizar o brandbook com a seleção F1 registrada.
- [x] Liberar no Git apenas os derivados autorizados.

### Task 3: Documentar no cofre e validar

**Files:**
- Create: `cofre-uli/02 - Identidade Visual/Aplicações Fotográficas F1 - Derivados e Mockups 2026-08-12.md`
- Create: `tests/validate-photo-derivatives.ps1`

**Interfaces:**
- Consumes: ativos e referências das Tasks 1 e 2.
- Produces: registro Obsidian, teste local e evidência de publicação.

- [x] Registrar fontes, derivados, aplicações e limites de uso.
- [x] Validar referências HTML, dimensões e ausência de fotos brutas nas páginas.
- [ ] Executar todos os testes e `git diff --check`.

### Task 4: Publicar e verificar estados externos

**Files:**
- Deploy: `web/assets/design-tokens.css`, `web/assets/fotografia/*.jpg`, `web/identidade-visual/index.html`, `web/brandbook/index.html`

- [x] Publicar somente os arquivos aprovados via FTP — 9 arquivos enviados; fotos brutas não foram publicadas.
- [x] Verificar HTTP 200 e referências dos derivados em `https://ulizarzana.com/identidade-visual/`.
- [x] Verificar HTTP 200 e referências dos derivados em `https://ulizarzana.com/brandbook/`.
- [x] Commitar e fazer push na `main`.
