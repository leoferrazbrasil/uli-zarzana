# Mockups de aplicações do sistema visual Implementation Plan

> **For agentic workers:** Execute este plano inline nesta sessão, mantendo a separação entre estado local, Git, FTP e URLs públicas.

**Goal:** Criar e publicar quatro mockups estáticos do sistema visual aprovado em Instagram, site, apresentação e material da mentoria.

**Architecture:** As duas páginas públicas reutilizarão `web/assets/application-mockups.css`. Cada mockup será um componente HTML sem JavaScript, alimentado pelos tokens A1/B1 e derivados fotográficos F1 já publicados.

**Tech Stack:** HTML5, CSS3, PowerShell para validação, FTP, Git.

## Global Constraints

- A paleta canônica permanece A1: `#332A26`, `#F7F0E7`, `#CDAE85`, `#B46F52`.
- A tipografia permanece B1: Libre Baskerville 700 para títulos e Source Sans 3 para textos funcionais.
- Fotos brutas permanecem privadas; somente derivados autorizados podem ser usados.
- O monograma/selo institucional continua provisório e não será tratado como logo final.
- A publicação FTP deve enviar somente HTML, CSS e derivados já aprovados.

### Task 1: Criar contrato de validação

**Files:**
- Create: `tests/validate-application-mockups.ps1`

- [x] Especificar os quatro identificadores de contexto, o CSS compartilhado, os derivados F1 e a proteção contra referências à pasta privada.
- [x] Executar o teste antes da implementação e confirmar falha por ausência dos mockups.

### Task 2: Implementar a folha compartilhada

**Files:**
- Create: `web/assets/application-mockups.css`

- [x] Criar grade responsiva de quatro cards.
- [x] Definir molduras para Instagram, site, apresentação e mentoria usando apenas tokens existentes.
- [x] Adicionar regras para telas abaixo de 720px.

### Task 3: Inserir os mockups nas páginas

**Files:**
- Modify: `web/identidade-visual/index.html`
- Modify: `web/brandbook/index.html`

- [x] Carregar o CSS compartilhado.
- [x] Inserir os quatro contextos com textos e derivados F1 autorizados.
- [x] Atualizar a sequência de próximos passos para refletir a etapa concluída.

### Task 4: Validar, registrar e publicar

**Files:**
- Modify: `cofre-uli/02 - Identidade Visual/Direção Visual Preliminar - A1 T1 M2 F1.md`
- Modify: `README.md`

- [x] Executar todos os testes, o novo teste e `git diff --check`.
- [x] Verificar servidor local nas duas rotas e nos recursos CSS/JPG.
- [x] Publicar via FTP apenas os HTML, CSS e derivados aprovados.
- [x] Verificar HTTP 200 e presença dos quatro contextos nas URLs públicas.
- [x] Atualizar o cofre com estado local, Git, FTP e público separadamente.
- [x] Commitar e fazer push na `main`.
