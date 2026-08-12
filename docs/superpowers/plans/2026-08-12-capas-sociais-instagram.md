# Mockups de aplicação em seções independentes — Implementation Plan

> **For agentic workers:** Execute inline, mantendo os estados local, Git, FTP e público separados. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reorganizar os mockups em quatro seções horizontais independentes e transformar o contexto Instagram em quatro cards de capas sociais no padrão visual dos Cards editoriais F1.

**Architecture:** O bloco atual `application-mockups-grid` será substituído por quatro seções `application-mockup-section`, cada uma com um único contexto e uma aplicação ampla. A seção Instagram usará uma grade própria de quatro cards verticais 9:16, reutilizando os derivados F1 e a gramática de capas aprovada; site, apresentação e material da mentoria permanecerão aplicações únicas em largura total.

**Tech Stack:** HTML5, CSS3, PowerShell, FTP e Git.

## Global Constraints

- Os quatro contextos devem aparecer em linhas/seções separadas: Instagram, Site, Apresentação e Material da mentoria.
- O Instagram deve usar quatro cards semelhantes à seção Cards editoriais F1, com capas independentes e proporção 9:16.
- A capa social usa imagem em tela cheia, gradiente inferior, contexto, título editorial, destaque em champagne/terracota e assinatura discreta.
- Tipografia: Libre Baskerville 700 e Source Sans 3.
- Fotos: somente derivados F1 autorizados; nenhum caminho para o acervo privado.
- Não reproduzir métricas fictícias nem a moldura grande de perfil do Instagram.
- O selo institucional permanece provisório.
- Publicar os HTML, CSS e derivados JPG via FTP após a implementação.

---

### Task 1: Atualizar o contrato estrutural

**Files:**
- Modify: `tests/validate-application-mockups.ps1`
- Modify: `tests/validate-social-covers.ps1`
- Modify: `tests/validate-social-vertical.ps1`

- [x] Exigir quatro `application-mockup-section` e quatro aplicações independentes em cada página.
- [x] Exigir quatro `instagram-cover-card` no contexto Instagram e proibir a grade antiga `application-mockups-grid`.
- [x] Exigir a ausência de `social-vertical` e `social-covers` como seções públicas.
- [x] Executar os testes e confirmar a falha antes da implementação.

### Task 2: Reestruturar o HTML

**Files:**
- Modify: `web/identidade-visual/index.html`
- Modify: `web/brandbook/index.html`

- [x] Substituir o container de duas colunas por quatro seções horizontais independentes.
- [x] Criar no Instagram quatro cards com os derivados `uli-f1-015-presenca`, `uli-f1-082-lideranca`, `uli-f1-080-autoridade` e `uli-f1-087-ascensao`.
- [x] Manter site, apresentação e material da mentoria como uma aplicação única por seção.
- [x] Remover o chrome falso de perfil, as métricas e qualquer seção social autônoma.

### Task 3: Reestruturar o CSS

**Files:**
- Modify: `web/assets/application-mockups.css`

- [x] Criar layout vertical de seções com `application-mockup-section`.
- [x] Criar os cards `instagram-cover-card` no padrão visual dos Cards editoriais F1.
- [x] Garantir 9:16, texto protegido, leitura e responsividade em desktop e telas estreitas.
- [x] Remover regras posicionais que possam ocultar uma seção por ordem no DOM.

### Task 4: Validar, registrar e publicar

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Mockups de Aplicação do Sistema Visual - A1 B1 T1 F1 2026-08-12.md`
- Modify: `docs/superpowers/specs/2026-08-12-capas-sociais-instagram-design.md`

- [x] Executar todos os validadores e revisar visualmente as duas páginas.
- [x] Registrar no cofre a decisão de separar os quatro contextos e o padrão Instagram em quatro cards F1.
- [x] Commitar e fazer push na `main`.
- [x] Publicar os HTML, CSS e derivados F1 via FTP.
- [x] Verificar as duas páginas públicas, o CSS e os derivados com HTTP 200 e conteúdo atualizado.
