# Capas sociais para Instagram Implementation Plan

> **For agentic workers:** Execute inline, mantendo os estados local, Git, FTP e público separados.

**Goal:** Incorporar quatro capas sociais legíveis ao mockup existente de Instagram e retirar as seções públicas autônomas criadas por engano.

**Architecture:** O mockup existente de Instagram terá uma grade 2×2 de capas verticais 9:16 com fotografia F1, contexto, título, destaque e assinatura. As seções públicas autônomas de conteúdo social vertical e padrão de capas serão removidas; a regra permanece documentada no próprio mockup.

**Tech Stack:** HTML5, CSS3, PowerShell, FTP e Git.

## Global Constraints

- Produção de referência: 1080 × 1920 px, proporção 9:16.
- Tipografia: Libre Baskerville 700 e Source Sans 3.
- Cores: tokens A1 existentes.
- Fotos: apenas derivados F1 autorizados.
- O monograma continua provisório.

### Task 1: Criar teste red

- [x] Atualizar `tests/validate-social-covers.ps1` para exigir as capas dentro de `#mockups` e proibir as seções autônomas.
- [x] Confirmar falha inicial por ausência das classes do novo mockup.

### Task 2: Implementar o padrão

- [x] Criar classes `mockup-instagram__cover-grid` e `mockup-instagram__cover` no CSS compartilhado.
- [x] Inserir quatro capas independentes dentro do mockup Instagram nas duas páginas.
- [x] Remover as seções públicas `social-vertical` e `social-covers` sem apagar o histórico documental.
- [x] Eliminar a regra posicional que poderia ocultar o mockup após a remoção das seções.

### Task 3: Validar e publicar

- [x] Executar todos os testes e revisão visual local.
- [x] Atualizar o cofre Obsidian.
- [x] Publicar HTML/CSS e os derivados F1 via FTP.
- [x] Verificar as URLs públicas, incluindo quebra de cache do CSS.
- [x] Commitar e fazer push na `main`.
