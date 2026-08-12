# Landing Page Aula Estratégica Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Criar, validar, versionar e publicar na raiz de `ulizarzana.com` a landing page estática demonstrativa da Aula Estratégica Entre Potencial e Resultado.

**Architecture:** A página será composta por HTML semântico em `web/index.html`, estilos responsivos isolados em `web/assets/landing-page.css` e JavaScript progressivamente aprimorado em `web/assets/landing-page.js`. Ela reutilizará os tokens e derivados F1 existentes, não terá framework, build, backend, requisição de rede ou persistência, e preservará as páginas já publicadas em `/identidade-visual/` e `/brandbook/`.

**Tech Stack:** HTML5, CSS3, JavaScript ES2020 compatível com navegador, PowerShell para contratos estáticos, Node.js `node:test` para funções puras, servidor HTTP local e FTP da Hostinger.

## Global Constraints

- A especificação normativa é `docs/superpowers/specs/2026-08-12-landing-page-aula-estrategica-design.md`.
- Usar somente A1, B1, T1 e F1, com `web/assets/design-tokens.css` como fonte de verdade.
- Não usar o monograma ou selo provisório como marca final; usar a assinatura tipográfica “Uli Zarzana”.
- Não copiar marca, textos, imagens, cores ou ornamentos da página de referência.
- Manter a sequência hero → qualificação → conteúdo → prova de reputação → autoridade → CTA final.
- Exibir “Página demonstrativa — data e inscrições ilustrativas” junto aos dados do evento.
- O formulário não pode transmitir, armazenar ou persistir nenhum valor.
- Não adicionar framework, pacote, etapa de build, analytics, CRM ou banco de dados.
- Não modificar nem remover `/identidade-visual/` e `/brandbook/`.
- Preservar todas as alterações não relacionadas já existentes na árvore de trabalho.
- As credenciais FTP devem existir somente em memória durante a publicação e nunca aparecer em arquivo, commit, saída ou documentação.
- Validar localmente, Git, FTP e estado público como estados separados.

---

## File Map

- Create: `web/index.html` — conteúdo semântico e componentes da landing.
- Create: `web/assets/landing-page.css` — layout, responsividade, estados e acessibilidade visual.
- Create: `web/assets/landing-page.js` — contador, formulário demonstrativo, diálogo e faixa de relatos.
- Create: `tests/validate-landing-page.ps1` — contrato estrutural, de copy, privacidade e ausência de integrações.
- Create: `tests/landing-page.test.mjs` — testes das funções puras de data e confirmação.
- Modify: `README.md` — adicionar a raiz pública ao inventário de páginas.
- Modify: `cofre-uli/01 - Estratégia/Landing Page - Aula Estratégica Entre Potencial e Resultado.md` — registrar implementação, commit, FTP e verificação pública.
- Reuse unchanged: `web/assets/design-tokens.css`.
- Reuse unchanged: `web/assets/fotografia/uli-f1-015-hero-1600x900.jpg`.
- Reuse unchanged: `web/assets/fotografia/uli-f1-015-presenca-720x900.jpg`.
- Reuse unchanged: `web/assets/fotografia/uli-f1-080-autoridade-720x900.jpg`.
- Reuse unchanged: `web/assets/fotografia/uli-f1-082-lideranca-720x900.jpg`.
- Reuse unchanged: `web/assets/fotografia/uli-f1-087-ascensao-720x900.jpg`.

---

### Task 1: Fixar o contrato executável da landing

**Files:**
- Create: `tests/validate-landing-page.ps1`
- Create: `tests/landing-page.test.mjs`
- Test: `tests/validate-landing-page.ps1`
- Test: `tests/landing-page.test.mjs`

**Interfaces:**
- Consumes: especificação aprovada e caminhos definidos no File Map.
- Produces: contrato PowerShell e contrato Node para as tarefas seguintes.

- [ ] **Step 1: Criar o contrato PowerShell inicialmente falho**

O arquivo deve carregar `web/index.html`, `web/assets/landing-page.css` e `web/assets/landing-page.js` como UTF-8 e verificar:

```powershell
$requiredIds = @('topo','formulario','para-quem','conteudo','depoimentos','sobre-uli','cta-final','privacy-dialog')
$requiredCopy = @(
  'Aula Estratégica — Entre Potencial e Resultado',
  'Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.',
  'Quero identificar meu próximo movimento',
  'Página demonstrativa — data e inscrições ilustrativas',
  'O que a audiência já reconhece na Uli',
  '10+ anos em vendas',
  '8+ anos em liderança',
  '178 profissionais na estrutura',
  '22 líderes formados'
)
$forbiddenNetwork = @('fetch(', 'XMLHttpRequest', 'sendBeacon', 'localStorage', 'sessionStorage')
```

O contrato também deve exigir:

- cinco campos com `name="name"`, `name="email"`, `name="phone"`, `name="role"` e `name="income"`;
- sete opções reais em cada um dos dois `select`;
- `form id="lead-form"` sem atributo `action`;
- as quatro classes `content-card--diagnosis`, `--positioning`, `--direction` e `--execution`;
- quatro elementos `audience-quote`;
- referências aos cinco JPG F1 e a `design-tokens.css`;
- `@media (max-width: 720px)` e `@media (prefers-reduced-motion: reduce)` no CSS;
- mensagem de confirmação e data ISO demonstrativa no JavaScript;
- ausência dos cinco marcadores de rede ou persistência.

- [ ] **Step 2: Criar o teste Node inicialmente falho**

```js
import test from 'node:test';
import assert from 'node:assert/strict';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const {
  DEMO_EVENT_DATE,
  getCountdownParts,
  getDemoConfirmation,
} = require('../web/assets/landing-page.js');

test('usa a data demonstrativa aprovada', () => {
  assert.equal(DEMO_EVENT_DATE, '2026-09-24T19:30:00-03:00');
});

test('calcula dias, horas, minutos e segundos restantes', () => {
  const result = getCountdownParts(
    new Date('2026-09-24T19:30:00-03:00'),
    new Date('2026-09-23T18:29:30-03:00'),
  );
  assert.deepEqual(result, { expired: false, days: 1, hours: 1, minutes: 0, seconds: 30 });
});

test('encerra o contador sem reiniciar a data', () => {
  const result = getCountdownParts(
    new Date('2026-09-24T19:30:00-03:00'),
    new Date('2026-09-24T19:30:01-03:00'),
  );
  assert.deepEqual(result, { expired: true, days: 0, hours: 0, minutes: 0, seconds: 0 });
});

test('confirma explicitamente que nenhum dado foi armazenado', () => {
  assert.equal(
    getDemoConfirmation(),
    'Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.',
  );
});
```

- [ ] **Step 3: Executar ambos e confirmar falha pela ausência da implementação**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-landing-page.ps1
& 'C:\Users\leona\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe' --test tests/landing-page.test.mjs
```

Expected: o PowerShell falha porque `web/index.html` não existe e o Node falha com `MODULE_NOT_FOUND` para `web/assets/landing-page.js`.

- [ ] **Step 4: Versionar somente os contratos falhos**

```powershell
git add -- tests/validate-landing-page.ps1 tests/landing-page.test.mjs
git commit -m "test: definir contrato da landing estrategica"
```

---

### Task 2: Construir a estrutura semântica e a copy

**Files:**
- Create: `web/index.html`
- Test: `tests/validate-landing-page.ps1`

**Interfaces:**
- Consumes: IDs, classes, textos e arquivos exigidos pelo contrato da Task 1.
- Produces: DOM usado por `landing-page.css` e `landing-page.js`.

- [ ] **Step 1: Criar o documento HTML semântico**

O `<head>` deve conter:

```html
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aula Estratégica Entre Potencial e Resultado | Uli Zarzana</title>
<meta name="description" content="Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.">
<link rel="stylesheet" href="assets/design-tokens.css">
<link rel="stylesheet" href="assets/landing-page.css">
<script src="assets/landing-page.js" defer></script>
```

O `<body>` deve conter, nesta ordem, um `header#topo`; um `main` com `section.hero[aria-labelledby="hero-title"]`, `section#para-quem[aria-labelledby="audience-title"]`, `section#conteudo[aria-labelledby="content-title"]`, `section#depoimentos[aria-labelledby="proof-title"]`, `section#sobre-uli[aria-labelledby="about-title"]` e `section#cta-final[aria-labelledby="closing-title"]`; depois `footer` e `dialog#privacy-dialog`.

- [ ] **Step 2: Inserir integralmente a copy aprovada**

Usar exatamente os textos das seções 1 a 7 da especificação, incluindo os quatro critérios positivos, quatro negativos, quatro conteúdos, quatro percepções anônimas, biografia, quatro indicadores e CTA final. Nenhum texto pode usar “próximo nível” como promessa principal, afirmar venda, prometer promoção ou excluir empresários.

- [ ] **Step 3: Construir o formulário sem envio**

```html
<form id="lead-form" novalidate>
  <label for="lead-name">Nome completo</label>
  <input id="lead-name" name="name" type="text" autocomplete="name" required>
  <label for="lead-email">E-mail</label>
  <input id="lead-email" name="email" type="email" autocomplete="email" required>
  <label for="lead-phone">Telefone</label>
  <input id="lead-phone" name="phone" type="tel" autocomplete="tel" inputmode="tel" required>
  <label for="lead-role">Cargo ou momento profissional</label>
  <select id="lead-role" name="role" required>
    <option value="">Selecione uma opção</option>
    <option value="analista-especialista">Analista ou especialista</option>
    <option value="consultor-autonomo">Consultor ou profissional autônomo</option>
    <option value="supervisor-coordenador">Supervisor ou coordenador</option>
    <option value="gerente">Gerente</option>
    <option value="diretor-executivo">Diretor, VP ou C-level</option>
    <option value="empresario-fundador">Empresário ou fundador</option>
    <option value="transicao-recolocacao">Em transição ou recolocação</option>
  </select>
  <label for="lead-income">Faixa de renda mensal</label>
  <select id="lead-income" name="income" required>
    <option value="">Selecione uma opção</option>
    <option value="ate-5">Até R$ 5 mil</option>
    <option value="5-10">De R$ 5 mil a R$ 10 mil</option>
    <option value="10-15">De R$ 10 mil a R$ 15 mil</option>
    <option value="15-20">De R$ 15 mil a R$ 20 mil</option>
    <option value="20-30">De R$ 20 mil a R$ 30 mil</option>
    <option value="30-50">De R$ 30 mil a R$ 50 mil</option>
    <option value="acima-50">Acima de R$ 50 mil</option>
  </select>
  <button type="submit">Quero identificar meu próximo movimento</button>
  <p class="demo-notice">Página demonstrativa — data e inscrições ilustrativas.</p>
  <p id="form-status" role="status" aria-live="polite"></p>
</form>
```

Cada `select` terá uma opção inicial vazia e exatamente as sete opções aprovadas na especificação.

- [ ] **Step 4: Executar o contrato estrutural e observar que apenas CSS/JS continuam falhando**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-landing-page.ps1
```

Expected: falha indicando ausência de `landing-page.css` ou `landing-page.js`, sem falha de copy ou estrutura do HTML.

- [ ] **Step 5: Versionar HTML e contrato**

```powershell
git add -- web/index.html tests/validate-landing-page.ps1
git commit -m "feat: estruturar landing da aula estrategica"
```

---

### Task 3: Implementar o sistema visual responsivo

**Files:**
- Create: `web/assets/landing-page.css`
- Test: `tests/validate-landing-page.ps1`

**Interfaces:**
- Consumes: DOM da Task 2 e tokens existentes em `design-tokens.css`.
- Produces: hero, cartões, faixa de reputação, autoridade, rodapé e estados responsivos.

- [ ] **Step 1: Definir a fundação visual e os componentes**

O CSS deve começar com tokens locais derivados apenas da paleta aprovada:

```css
:root {
  --landing-bg: #f7f0e7;
  --landing-ink: #332a26;
  --landing-accent: #cdae85;
  --landing-warm: #b46f52;
  --landing-max: 1180px;
  --landing-radius: 22px;
  --landing-shadow: 0 24px 70px rgb(51 42 38 / 14%);
}
```

Implementar:

- cabeçalho transparente sobre o hero;
- hero escuro com grade `minmax(0, 1.08fr) minmax(360px, .92fr)`;
- fotografia de `uli-f1-015-hero-1600x900.jpg` com sobreposição marrom;
- formulário em painel editorial com bordas de baixo contraste;
- contador em quatro colunas;
- dois cartões de qualificação sobrepostos no desktop;
- quatro cartões fotográficos em grade;
- faixa de relatos em quatro colunas no desktop e rolagem horizontal no mobile;
- autoridade em duas colunas com fotografia e indicadores;
- CTA final centralizado;
- diálogo nativo estilizado e backdrop;
- foco visível com outline de champagne e offset suficiente.

- [ ] **Step 2: Aplicar os cinco derivados F1**

Mapeamento:

- hero: `uli-f1-015-hero-1600x900.jpg`;
- diagnóstico: `uli-f1-015-presenca-720x900.jpg`;
- posicionamento: `uli-f1-080-autoridade-720x900.jpg`;
- direção: `uli-f1-082-lideranca-720x900.jpg`;
- execução: `uli-f1-087-ascensao-720x900.jpg`;
- seção sobre a Uli: reutilizar `uli-f1-080-autoridade-720x900.jpg` com enquadramento próprio.

Cada cartão deve ter pseudo-elemento com `linear-gradient()` usando opacidades entre `rgb(51 42 38 / 0.18)` e `rgb(51 42 38 / 0.94)`, sem cor funcional adicional.

- [ ] **Step 3: Implementar os breakpoints e redução de movimento**

```css
@media (max-width: 960px) {
  .hero__grid, .about__grid { grid-template-columns: 1fr; }
  .content-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}
@media (max-width: 720px) {
  .site-nav__links { display: none; }
  .content-grid { grid-template-columns: 1fr; }
  .audience-cards { grid-template-columns: 1fr; }
  .audience-quotes { grid-auto-columns: minmax(82%, 1fr); overflow-x: auto; }
}
@media (max-width: 360px) {
  .section-shell { padding-inline: 16px; }
  .hero h1 { font-size: clamp(2rem, 12vw, 2.65rem); }
  .countdown { gap: 8px; }
}
@media (prefers-reduced-motion: reduce) {
  html { scroll-behavior: auto; }
  *, *::before, *::after { scroll-behavior: auto !important; transition-duration: .01ms !important; }
}
```

- [ ] **Step 4: Executar o contrato e confirmar que a falha restante é apenas JavaScript**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-landing-page.ps1
```

Expected: falha pela ausência de `landing-page.js`, sem falhas de CSS ou HTML.

- [ ] **Step 5: Versionar os estilos**

```powershell
git add -- web/assets/landing-page.css
git commit -m "feat: aplicar sistema visual na landing"
```

---

### Task 4: Implementar os comportamentos demonstrativos

**Files:**
- Create: `web/assets/landing-page.js`
- Test: `tests/landing-page.test.mjs`
- Test: `tests/validate-landing-page.ps1`

**Interfaces:**
- Consumes: IDs `lead-form`, `form-status`, `privacy-dialog`, `testimonials-track` e os elementos `[data-countdown]`.
- Produces: `DEMO_EVENT_DATE`, `getCountdownParts(targetDate, now)`, `getDemoConfirmation()` e inicializadores de interface.

- [ ] **Step 1: Implementar as funções puras exportáveis**

```js
const DEMO_EVENT_DATE = '2026-09-24T19:30:00-03:00';

function getCountdownParts(targetDate, now = new Date()) {
  const remaining = Math.max(0, targetDate.getTime() - now.getTime());
  const expired = remaining === 0;
  const totalSeconds = Math.floor(remaining / 1000);
  return {
    expired,
    days: Math.floor(totalSeconds / 86400),
    hours: Math.floor((totalSeconds % 86400) / 3600),
    minutes: Math.floor((totalSeconds % 3600) / 60),
    seconds: totalSeconds % 60,
  };
}

function getDemoConfirmation() {
  return 'Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.';
}
```

Exportar em Node com:

```js
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { DEMO_EVENT_DATE, getCountdownParts, getDemoConfirmation };
}
```

- [ ] **Step 2: Implementar o contador sem data móvel**

`renderCountdown()` deve atualizar os quatro elementos com `data-countdown="days|hours|minutes|seconds"` a cada segundo. Quando `expired` for verdadeiro, deve limpar o intervalo, zerar os valores e exibir “Evento demonstrativo encerrado” em `[data-countdown-status]`.

- [ ] **Step 3: Implementar a simulação do formulário**

`initDemoForm()` deve:

- ouvir `submit`;
- executar `event.preventDefault()`;
- usar `form.reportValidity()` para os campos obrigatórios;
- nunca criar `FormData`, `fetch`, XHR ou persistência;
- executar `form.reset()` depois de uma submissão válida;
- escrever `getDemoConfirmation()` em `#form-status`;
- mover o foco para `#form-status` usando `tabindex="-1"`.

- [ ] **Step 4: Implementar diálogo, âncoras e faixa de relatos**

- `initPrivacyDialog()` abre o `<dialog>` pelos elementos `[data-open-privacy]`, fecha pelos elementos `[data-close-privacy]` e restaura o foco ao acionador.
- `initAnchorFocus()` leva CTAs com `[data-focus-form]` até `#formulario` e foca `#lead-name`.
- `initTestimonialScroller()` move `#testimonials-track` em 80% da largura visível pelos botões `[data-scroll="previous|next"]`.
- todos os inicializadores devem ser chamados somente quando `document` existir.

- [ ] **Step 5: Executar os contratos completos**

Run:

```powershell
& 'C:\Users\leona\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe' --test tests/landing-page.test.mjs
powershell -NoProfile -ExecutionPolicy Bypass -File tests/validate-landing-page.ps1
```

Expected: quatro testes Node aprovados e `Landing page validation passed.`.

- [ ] **Step 6: Versionar o comportamento**

```powershell
git add -- web/assets/landing-page.js tests/landing-page.test.mjs tests/validate-landing-page.ps1
git commit -m "feat: simular interacoes da landing"
```

---

### Task 5: Validar integração, aparência e regressões

**Files:**
- Review: `web/index.html`
- Review: `web/assets/landing-page.css`
- Review: `web/assets/landing-page.js`
- Test: all tracked `tests/validate-*.ps1`
- Test: `tests/landing-page.test.mjs`

**Interfaces:**
- Consumes: landing completa das Tasks 2–4.
- Produces: versão local revisada em desktop e mobile, sem regressão nas páginas existentes.

- [ ] **Step 1: Executar todos os validadores rastreados e o teste Node**

Evitar o arquivo não rastreado `tests/validate-monogram-uz.ps1`, que pertence ao trabalho antigo do selo:

```powershell
$trackedTests = git ls-files 'tests/validate-*.ps1'
foreach ($test in $trackedTests) {
  powershell -NoProfile -ExecutionPolicy Bypass -File $test
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
& 'C:\Users\leona\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe' --test tests/landing-page.test.mjs
```

Expected: todos os scripts rastreados e quatro testes Node aprovados.

- [ ] **Step 2: Servir o diretório `web` localmente**

```powershell
& 'C:\Users\leona\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -m http.server 8088 --directory web
```

Verificar HTTP 200 em:

```powershell
Invoke-WebRequest -UseBasicParsing 'http://127.0.0.1:8088/'
Invoke-WebRequest -UseBasicParsing 'http://127.0.0.1:8088/identidade-visual/'
Invoke-WebRequest -UseBasicParsing 'http://127.0.0.1:8088/brandbook/'
```

- [ ] **Step 3: Fazer inspeção visual em quatro larguras**

Usar o navegador integrado em `http://127.0.0.1:8088/` e inspecionar 1440×1000, 768×1024, 375×812 e 320×568. Confirmar:

- headline e formulário visíveis na primeira dobra do desktop;
- leitura do texto sobre fotografia;
- nenhuma colisão entre cabeçalho, hero e formulário;
- cartões em 4, 2 e 1 colunas conforme largura;
- faixa de relatos rolável no mobile;
- nenhum overflow horizontal em 320 px;
- foco visível e ordem de tabulação coerente;
- confirmação do formulário sem navegação ou requisição;
- diálogo de privacidade abrindo e fechando;
- contador renderizado sem `NaN`;
- imagens sem distorção e rostos preservados.

- [ ] **Step 4: Corrigir somente defeitos observados e repetir validações**

Após qualquer ajuste, repetir os comandos das Steps 1–3. Não alterar copy, paleta ou arquitetura aprovadas para “polir” a página.

- [ ] **Step 5: Verificar o escopo Git antes do commit**

```powershell
git diff --check -- web/index.html web/assets/landing-page.css web/assets/landing-page.js tests/validate-landing-page.ps1 tests/landing-page.test.mjs
git status --short
```

Somente arquivos da landing podem ser incluídos. As alterações antigas do selo e os diretórios não rastreados existentes devem permanecer fora do stage.

- [ ] **Step 6: Versionar os ajustes de integração, se existirem**

```powershell
git add -- web/index.html web/assets/landing-page.css web/assets/landing-page.js tests/validate-landing-page.ps1 tests/landing-page.test.mjs
git commit -m "fix: validar landing em desktop e mobile"
```

Se não houver ajustes depois dos commits anteriores, não criar commit vazio.

---

### Task 6: Documentar, publicar e verificar o estado público

**Files:**
- Modify: `README.md`
- Modify: `cofre-uli/01 - Estratégia/Landing Page - Aula Estratégica Entre Potencial e Resultado.md`
- Publish: `web/index.html` → `public_html/index.html`
- Publish: `web/assets/landing-page.css` → `public_html/assets/landing-page.css`
- Publish: `web/assets/landing-page.js` → `public_html/assets/landing-page.js`
- Ensure published: `web/assets/design-tokens.css` and five JPG files in matching `public_html/assets/` paths.

**Interfaces:**
- Consumes: landing local validada e credencial FTP transitória fornecida pelo usuário.
- Produces: documentação, commit na `main`, arquivos FTP e confirmação pública independente.

- [ ] **Step 1: Atualizar o README**

Adicionar à lista de páginas:

```markdown
- [Landing da Aula Estratégica](https://ulizarzana.com/)
```

- [ ] **Step 2: Executar a validação final antes do Git**

```powershell
$trackedTests = git ls-files 'tests/validate-*.ps1'
foreach ($test in $trackedTests) {
  powershell -NoProfile -ExecutionPolicy Bypass -File $test
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
& 'C:\Users\leona\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe' --test tests/landing-page.test.mjs
git diff --check
```

- [ ] **Step 3: Commitar arquivos explícitos e enviar a `main`**

```powershell
git add -- README.md web/index.html web/assets/landing-page.css web/assets/landing-page.js tests/validate-landing-page.ps1 tests/landing-page.test.mjs docs/superpowers/plans/2026-08-12-landing-page-aula-estrategica.md
git diff --cached --check
git commit -m "feat: publicar landing da aula estrategica"
git push origin main
```

- [ ] **Step 4: Publicar via FTP sem persistir a credencial**

Usar a credencial já fornecida pelo usuário somente em memória durante o comando de publicação. Confirmar primeiro que o destino é `public_html` e enviar apenas:

```text
public_html/index.html
public_html/assets/design-tokens.css
public_html/assets/landing-page.css
public_html/assets/landing-page.js
public_html/assets/fotografia/uli-f1-015-hero-1600x900.jpg
public_html/assets/fotografia/uli-f1-015-presenca-720x900.jpg
public_html/assets/fotografia/uli-f1-080-autoridade-720x900.jpg
public_html/assets/fotografia/uli-f1-082-lideranca-720x900.jpg
public_html/assets/fotografia/uli-f1-087-ascensao-720x900.jpg
```

Não excluir, mover ou sobrescrever os diretórios `public_html/identidade-visual/` e `public_html/brandbook/`. Não registrar a senha em script, nota, histórico Git ou saída.

- [ ] **Step 5: Verificar o site público separadamente**

```powershell
$stamp=[DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
$root=Invoke-WebRequest -UseBasicParsing "https://ulizarzana.com/?v=$stamp"
$identity=Invoke-WebRequest -UseBasicParsing "https://ulizarzana.com/identidade-visual/?v=$stamp"
$brandbook=Invoke-WebRequest -UseBasicParsing "https://ulizarzana.com/brandbook/?v=$stamp"
$css=Invoke-WebRequest -UseBasicParsing "https://ulizarzana.com/assets/landing-page.css?v=$stamp"
$js=Invoke-WebRequest -UseBasicParsing "https://ulizarzana.com/assets/landing-page.js?v=$stamp"
if ($root.StatusCode -ne 200 -or $root.Content -notmatch 'Aula Estratégica') { throw 'Raiz pública inválida' }
if ($identity.StatusCode -ne 200) { throw 'Identidade visual indisponível' }
if ($brandbook.StatusCode -ne 200) { throw 'Brandbook indisponível' }
if ($css.StatusCode -ne 200 -or $js.StatusCode -ne 200) { throw 'Assets da landing indisponíveis' }
```

Fazer uma última inspeção visual pública em desktop e mobile e repetir a simulação do formulário. Confirmar que não há requisições de envio e que a mensagem local aparece.

- [ ] **Step 6: Registrar a implementação e a publicação no Obsidian**

Somente depois da verificação pública, alterar `status: design-aprovado` para `status: publicado` e acrescentar uma seção `## Implementação e publicação` contendo:

- arquivos implementados;
- resultado dos testes;
- hash do commit de implementação;
- caminhos FTP publicados;
- URLs verificadas;
- distinção explícita entre validação local, Git, FTP e estado público;
- nenhum segredo ou credencial.

Versionar o registro final:

```powershell
git add -- 'cofre-uli/01 - Estratégia/Landing Page - Aula Estratégica Entre Potencial e Resultado.md'
git commit -m "docs: registrar publicacao da landing estrategica"
git push origin main
```

Não criar esse commit se a nota já contiver todos os dados verificáveis.
