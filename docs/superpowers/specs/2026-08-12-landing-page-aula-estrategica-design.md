# Landing page — Aula Estratégica Entre Potencial e Resultado

## Status e escopo

Design aprovado em 2026-08-12 para a primeira landing page demonstrativa da Uli Zarzana.

A página será um protótipo estático de inscrição para uma aula gratuita. Ela não venderá diretamente a mentoria, não transmitirá dados, não armazenará informações e não dependerá de banco de dados, CRM ou integração externa. O refinamento do selo institucional e a validação final de sua legibilidade permanecem fora deste ciclo.

## Decisão estratégica

A arquitetura escolhida é uma landing page de captação para aula gratuita porque:

- o plano do projeto já estabelece aula gratuita, entrada em grupo de WhatsApp e apresentação posterior da mentoria;
- as tentativas anteriores tiveram promessa ampla e pouca tradução comercial da dor;
- a transformação profunda da mentoria não deve ser prometida integralmente na porta de entrada;
- a aula oferece um resultado inicial específico: identificar o bloqueio central e definir o próximo movimento;
- carreira e liderança permanecem como território principal, sem excluir empresários experientes.

Foram descartadas a venda direta da mentoria e a página meramente institucional.

## Objetivo e oferta

- **Objetivo primário:** simular a inscrição na aula gratuita.
- **Nome:** Aula Estratégica — Entre Potencial e Resultado.
- **Promessa:** Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.
- **Resultado imediato:** diagnóstico do bloqueio central e clareza sobre o próximo movimento profissional ou empresarial.
- **Público:** profissionais, líderes e empresários experientes.
- **Fluxo conceitual:** landing page → grupo de WhatsApp → aula ao vivo → apresentação da mentoria.
- **Natureza da versão:** demonstração visual e funcional local, sem captação real.

## Referência estrutural

A página toma como matriz a estrutura da landing page “Aula Zero — Como aumentar sua visibilidade no corporativo”, fornecida pelo usuário. Devem ser preservados:

- o ritmo de uma primeira dobra escura com fotografia, promessa e formulário;
- a alternância entre seções claras e escuras;
- a sequência hero → qualificação → conteúdo → prova → autoridade → CTA final;
- a disposição em duas colunas na primeira dobra;
- os dois cartões sobrepostos de “é para quem” e “não é para quem”;
- a grade com quatro cartões fotográficos;
- a faixa horizontal de relatos;
- o bloco biográfico com fotografia e indicadores;
- o encerramento com repetição do CTA.

A identidade, a redação, as fotografias e os elementos de interface devem ser próprios da Uli. Não serão copiados logotipo, textos, cores, imagens, ornamentos ou ativos da referência.

## Sistema visual

- **Direção:** A1 — Autoridade Clássica.
- **Tipografia:** B1 — Assinatura Executiva.
- **Composição:** T1 — Editorial Equilibrada.
- **Fotografia:** F1 — Retrato Editorial.
- **Cores:** marrom profundo `#332A26`, marfim `#F7F0E7`, champagne `#CDAE85` e terracota `#B46F52`.
- **Fontes:** Libre Baskerville em títulos e Source Sans 3 em interface e texto corrido.
- **Assinatura:** wordmark tipográfico “Uli Zarzana”. O monograma ou selo provisório não será usado como marca final.
- **Fotografias:** somente derivados F1 já aprovados e disponíveis em `web/assets/fotografia/`.

O desenho será editorial, executivo e sóbrio. Champagne e terracota serão usados como acentos, nunca como texto pequeno sobre fundo marfim. Não será adicionada uma quinta cor funcional.

## Arquitetura da página

### 1. Cabeçalho e hero

O cabeçalho ficará sobre o fundo escuro e conterá:

- assinatura “Uli Zarzana”;
- links de âncora “Para quem”, “Conteúdo” e “Sobre a Uli”;
- botão “Reservar minha vaga”.

O hero terá duas colunas no desktop:

- à esquerda, fotografia F1 em escala ampla, identificação da aula, headline, subheadline, contador e informações do evento;
- à direita, formulário de inscrição demonstrativo.

No mobile, os conteúdos serão empilhados nesta ordem: identificação, headline, explicação, informações do evento, formulário e contador. A fotografia continuará presente como fundo protegido por sobreposição escura, sem comprometer a leitura.

Conteúdo aprovado:

> **Aula Estratégica — Entre Potencial e Resultado**

> **Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.**

> Em duas horas, você compreenderá por que capacidade e entrega nem sempre se convertem em reconhecimento — e sairá com clareza sobre o próximo movimento para sua carreira, liderança ou negócio.

Informações demonstrativas:

- 24 de setembro de 2026;
- 19h30;
- gratuita;
- on-line;
- ao vivo;
- duas horas de duração.

A página exibirá, junto às informações do evento, o aviso: “Página demonstrativa — data e inscrições ilustrativas”.

O contador será calculado no navegador até `2026-09-24T19:30:00-03:00`. Depois do prazo, exibirá “Evento demonstrativo encerrado”, sem reiniciar ou fabricar nova data.

### 2. Formulário demonstrativo

Título:

> Reserve sua vaga na Aula Estratégica

Campos visíveis:

- nome completo;
- e-mail;
- telefone;
- cargo ou momento profissional;
- faixa de renda mensal.

Opções de cargo ou momento profissional:

- Analista ou especialista;
- Consultor ou profissional autônomo;
- Supervisor ou coordenador;
- Gerente;
- Diretor, VP ou C-level;
- Empresário ou fundador;
- Em transição ou recolocação.

Opções de faixa de renda mensal:

- Até R$ 5 mil;
- De R$ 5 mil a R$ 10 mil;
- De R$ 10 mil a R$ 15 mil;
- De R$ 15 mil a R$ 20 mil;
- De R$ 20 mil a R$ 30 mil;
- De R$ 30 mil a R$ 50 mil;
- Acima de R$ 50 mil.

CTA:

> **Quero identificar meu próximo movimento**

O formulário não possuirá `action`, requisição HTTP, integração, persistência, analytics ou armazenamento. O JavaScript impedirá o envio, limpará os campos e mostrará uma confirmação local:

> **Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.**

O aviso de demonstração deverá permanecer visível antes e depois da interação. O link “Política de privacidade” abrirá um diálogo local informando que a página não coleta nem transmite dados.

### 3. Qualificação

Rótulo:

> SOBRE A AULA

Título:

> **Esta aula é para você se...**

Cartão “É para quem”:

- Você já possui experiência e entrega resultados, mas seu crescimento ainda não acompanha sua capacidade.
- Suas responsabilidades aumentaram, mas reconhecimento, influência ou retorno não evoluíram na mesma proporção.
- Você não consegue identificar se o bloqueio está no posicionamento, nas decisões, na comunicação ou na execução.
- Você lidera uma carreira, uma equipe ou um negócio e precisa definir o próximo movimento com clareza.

Cartão “Não é para quem”:

- Procura motivação passageira ou uma fórmula automática de promoção e crescimento.
- Espera resultado sem rever decisões, comportamentos e formas de atuação.
- Busca recomendações sobre investimentos ou enriquecimento rápido.
- Ainda não possui experiência suficiente para aplicar uma discussão sobre posicionamento, liderança e influência.

Os cartões serão sobrepostos em larguras amplas e empilhados no mobile, usando marrom profundo e uma variação controlada do mesmo sistema cromático.

### 4. Conteúdo da aula

Rótulo:

> O QUE VOCÊ VAI COMPREENDER

Título:

> **Uma aula para transformar percepção difusa em direção concreta**

Quatro cartões fotográficos:

1. **Diagnóstico — O bloqueio que você ainda não nomeou**
   - Diferencie falta de capacidade de problemas de percepção, direção, comunicação ou execução.
2. **Posicionamento — Como experiência se transforma em valor percebido**
   - Torne sua contribuição visível sem depender de autopromoção vazia.
3. **Direção — O próximo movimento que faz sentido agora**
   - Identifique o que precisa mudar primeiro em sua carreira, liderança ou negócio.
4. **Execução — Uma decisão traduzida em ação**
   - Saia da aula com um movimento concreto para começar a reduzir a distância entre potencial e resultado.

Cada cartão usará uma fotografia F1 diferente, degradê derivado da paleta, etiqueta curta, título dominante e texto de apoio. A composição deve manter rosto, gesto e contexto visual legíveis.

### 5. Prova de reputação

Rótulo:

> PERCEPÇÕES DA AUDIÊNCIA

Título:

> **O que a audiência já reconhece na Uli**

A seção não usará depoimentos de transformação nem atribuirá resultados à mentoria. Ela exibirá quatro percepções anônimas provenientes da pesquisa de audiência:

- “Referência em liderança e em executar as ideias.”
- “Liderança e autoconfiança.”
- “Constância e propósito.”
- “Admiro a profissional que é e a forma como conduz o time.”

Legenda obrigatória:

> Percepções registradas na pesquisa de audiência. Identidades preservadas.

Os relatos serão apresentados em faixa horizontal responsiva. No desktop, os quatro ficarão visíveis; no mobile, haverá rolagem horizontal com controles acessíveis. Não serão mostrados nomes, avatares, perfis ou números fictícios.

### 6. Autoridade

Rótulo:

> SOBRE A ULI

Título:

> **Uli Zarzana**

Biografia:

> Executiva de estratégia comercial, fundadora da UZM Assessoria Empresarial e mentora de profissionais e empresários. Possui mais de dez anos de experiência em vendas e mais de oito anos em liderança, com progressão até posições de diretoria.

> No Grupo Fictor, avançou de Executiva Comercial a Diretora Comercial e liderou uma estrutura de 178 profissionais, apoiada por 22 líderes formados. Sua experiência reúne estratégia, crescimento, posicionamento, liderança e execução — fundamentos aplicados hoje ao desenvolvimento de pessoas que precisam reduzir a distância entre capacidade e resultado.

Indicadores verificáveis no currículo-base:

- 10+ anos em vendas;
- 8+ anos em liderança;
- 178 profissionais na estrutura;
- 22 líderes formados.

A seção terá fundo marrom profundo, fotografia editorial à esquerda e conteúdo à direita no desktop. No mobile, fotografia, biografia e indicadores serão empilhados.

### 7. Fechamento e rodapé

Rótulo:

> O PRÓXIMO MOVIMENTO

Headline:

> **Seu próximo resultado começa quando você identifica o que realmente precisa mudar.**

Texto:

> A Aula Estratégica Entre Potencial e Resultado foi construída para transformar uma sensação difusa de estagnação em diagnóstico, direção e um próximo movimento concreto.

CTA:

> **Quero identificar meu próximo movimento**

O CTA levará ao formulário por âncora e moverá o foco para o primeiro campo. O rodapé conterá a assinatura tipográfica, link do Instagram, link para o diálogo de privacidade, aviso de demonstração e direitos autorais.

## Comportamentos e acessibilidade

- navegação por âncoras com deslocamento suave respeitando `prefers-reduced-motion`;
- foco visível em links, botões, campos e controles;
- rótulos reais associados aos campos;
- mensagens de validação e confirmação anunciadas por região `aria-live`;
- diálogo de privacidade com foco controlado, fechamento por botão e tecla Escape;
- controles do carrossel com nomes acessíveis;
- nenhuma informação transmitida ou armazenada;
- imagens com texto alternativo contextual;
- layout sem overflow horizontal em 320 px;
- contraste compatível com as regras aprovadas da paleta.

## Arquitetura técnica

Arquivos previstos:

- `web/index.html`: estrutura semântica, conteúdo e metadados;
- `web/assets/landing-page.css`: layout responsivo e componentes exclusivos da landing;
- `web/assets/landing-page.js`: contador, formulário demonstrativo, diálogo e controles da faixa de relatos;
- `web/assets/design-tokens.css`: fonte de verdade já existente para cores e tipografia;
- `web/assets/fotografia/`: derivados F1 já aprovados.

A landing será independente das páginas `/identidade-visual/` e `/brandbook/`, mas compartilhará os tokens e os ativos aprovados. Não haverá framework, etapa de build ou dependência JavaScript externa.

## Publicação

Após implementação e validação:

- `web/index.html` será publicado como `public_html/index.html`;
- `web/assets/` será sincronizado para `public_html/assets/` sem apagar arquivos fora do escopo;
- `/identidade-visual/` e `/brandbook/` serão preservados;
- a raiz pública `https://ulizarzana.com/` será verificada separadamente da validação local e do push Git.

## Critérios de aceitação

- a sequência e a hierarquia das seções correspondem à matriz estrutural da referência;
- todo o texto corresponde à copy aprovada neste documento;
- a identidade visual usa apenas A1, B1, T1 e F1;
- o selo provisório não aparece como marca final;
- data, horário e contador são claramente demonstrativos;
- o formulário simula uma experiência real sem requisição, persistência ou armazenamento;
- as listas de cargo e renda exibem todas as opções aprovadas;
- a prova social é apresentada como percepção de audiência, sem promessa de transformação;
- os quatro indicadores da seção de autoridade correspondem ao currículo-base;
- a página funciona em desktop e mobile, inclusive em 320 px;
- links, campos, diálogo, contador, carrossel e CTA por âncora são utilizáveis por teclado;
- a raiz do domínio é publicada sem remover `/identidade-visual/` ou `/brandbook/`;
- validação local, Git, FTP e estado público são comprovados separadamente.
