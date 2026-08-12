# Capas sociais para Instagram Implementation Plan

> **For agentic workers:** Execute inline, mantendo os estados local, Git, FTP e público separados.

**Goal:** Criar um padrão de aplicabilidade de capas independentes para Instagram e conteúdo social.

**Architecture:** A nova seção de capas sociais reutilizará a folha `application-mockups.css`, mas terá componentes próprios sem moldura de galeria. A antiga galeria técnica será ocultada na apresentação pública para evitar ambiguidade de escopo.

**Tech Stack:** HTML5, CSS3, PowerShell, FTP e Git.

## Global Constraints

- Produção de referência: 1080 × 1920 px, proporção 9:16.
- Tipografia: Libre Baskerville 700 e Source Sans 3.
- Cores: tokens A1 existentes.
- Fotos: apenas derivados F1 autorizados.
- O monograma continua provisório.

### Task 1: Criar teste red

- [ ] Criar `tests/validate-social-covers.ps1`.
- [ ] Confirmar falha por ausência da nova seção.

### Task 2: Implementar o padrão

- [x] Criar classes `social-cover-grid` e `social-cover` no CSS compartilhado.
- [x] Inserir quatro capas independentes nas duas páginas.
- [x] Ocultar a galeria técnica anterior sem removê-la do histórico de implementação.

### Task 3: Validar e publicar

- [x] Executar todos os testes e revisão responsiva.
- [x] Atualizar o cofre Obsidian.
- [x] Publicar HTML/CSS via FTP.
- [x] Verificar as URLs públicas, incluindo quebra de cache do CSS.
- [ ] Commitar e fazer push na `main`.
