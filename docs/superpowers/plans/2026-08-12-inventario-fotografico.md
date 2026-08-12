# Inventário fotográfico Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Estruturar e classificar o acervo de 108 fotos da Uli, preservando rastreabilidade e separando triagem F1 de acervo contextual.

**Architecture:** A pasta `fotos/` permanece como acervo bruto privado. Os nomes serão descritivos e manterão o ID original. O cofre Obsidian conterá o inventário completo e os critérios; um teste PowerShell verificará contagem, padrão de nomes, dimensões e categorias permitidas.

**Tech Stack:** JPEG, PowerShell, Python/Pillow para metadados de leitura, Obsidian Markdown, Git.

## Global Constraints

- Não alterar o conteúdo visual dos JPEGs.
- Não publicar fotos brutas via FTP.
- Não inferir autorização.
- Manter o identificador original em cada novo nome.
- Não incluir as fotos brutas ignoradas pelo Git no commit.

---

### Task 1: Classificar e renomear o acervo

**Files:**
- Modify: `fotos/*.jpeg` — renomeação autorizada de 108 arquivos.
- Create: `cofre-uli/02 - Identidade Visual/Inventario-Fotografico-Acervo-Uli-2026-08-12.md`

**Interfaces:**
- Consumes: 108 JPEGs originais e inspeção visual por contact sheets.
- Produces: nomes `uli-###-categoria.jpeg` e tabela completa no cofre.

- [x] Preflight confirmou 108/108 arquivos, sem colisões.
- [x] Renomear preservando o ID original.
- [x] Gerar inventário Markdown com metadados técnicos e status.

### Task 2: Validar o inventário

**Files:**
- Create: `tests/validate-photo-inventory.ps1`

**Interfaces:**
- Consumes: nomes renomeados e nota Obsidian.
- Produces: contagem, padrão, categorias e integridade verificáveis.

- [x] Verificar 108 arquivos JPEG.
- [x] Verificar IDs de 001 a 108 sem repetição.
- [x] Verificar categorias exclusivamente controladas.
- [x] Verificar dimensões existentes e faixa técnica registrada.

### Task 3: Atualizar a direção visual e versionar

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md`

- [x] Registrar que o acervo bruto foi estruturado.
- [x] Manter pendente a autorização e a seleção dos ativos oficiais F1.
- [ ] Executar testes e `git diff --check`.
- [ ] Commitar e fazer push na `main` somente da documentação e teste.
