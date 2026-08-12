# Seleção Editorial F1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement the plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Selecionar e registrar os ativos fotográficos F1 oficiais a partir das 42 candidatas autorizadas do acervo Uli.

**Architecture:** A seleção será registrada no cofre Obsidian como uma camada sobre o inventário técnico existente. Os JPEGs brutos permanecem privados e inalterados; a shortlist referencia os nomes rastreáveis e define a função de cada ativo.

**Tech Stack:** JPEG, Python/Pillow para inspeção, Obsidian Markdown, PowerShell para validação e Git.

## Global Constraints

- Não alterar o conteúdo visual dos JPEGs.
- Não publicar fotos brutas via FTP.
- Usar somente as 42 imagens classificadas como `triagem-f1`.
- Priorizar faixa A e usar faixa B apenas quando houver justificativa funcional.
- Registrar `principal`, `autoridade` ou `apoio` para cada selecionada.
- Manter pendente a publicação até aprovação dos derivados e aplicações.

---

### Task 1: Revisar visualmente as candidatas

**Files:**
- Read: `fotos/uli-*.jpeg`
- Read: `cofre-uli/02 - Identidade Visual/Inventario-Fotografico-Acervo-Uli-2026-08-12.md`
- Create temporary: `.inventory-work-20260812/f1-contact-sheet-*.jpg`

**Interfaces:**
- Consumes: inventário com status `triagem-f1` e JPEGs locais.
- Produces: evidência visual comparável para a decisão editorial.

- [x] Isolar as 42 candidatas F1.
- [x] Revisar composição, expressão, iluminação, recorte e duplicidade.

### Task 2: Registrar a shortlist no cofre

**Files:**
- Create: `cofre-uli/02 - Identidade Visual/Shortlist-F1-Fotografias-Uli-2026-08-12.md`
- Modify: `cofre-uli/02 - Identidade Visual/Inventario-Fotografico-Acervo-Uli-2026-08-12.md`
- Modify: `cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md`

**Interfaces:**
- Consumes: decisão visual da Task 1.
- Produces: shortlist categorizada, rastreável e separada de publicação.

- [x] Registrar cada selecionada com função, aplicação e justificativa.
- [x] Atualizar o inventário com status `shortlist-f1` apenas nos IDs selecionados.
- [x] Marcar a etapa de shortlist como concluída e manter derivados/mockups pendentes.

### Task 3: Validar e versionar

**Files:**
- Create: `tests/validate-photo-shortlist.ps1`

**Interfaces:**
- Consumes: inventário e shortlist Obsidian.
- Produces: validação de IDs, categorias, nomes, camadas e consistência entre documentos.

- [x] Validar que todos os IDs selecionados existem e são F1.
- [x] Validar que cada selecionada tem uma única camada permitida.
- [x] Executar todos os testes e `git diff --check`.
- [ ] Commitar e fazer push somente dos arquivos intencionais.
