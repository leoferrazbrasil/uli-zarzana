---
title: Landing Page - Aula Estratégica Entre Potencial e Resultado
date: 2026-08-12
status: implementado-publicado
tipo: decisao-estrategica
tags:
  - uli-zarzana
  - landing-page
  - aula-estrategica
  - captacao
  - copy
aliases:
  - Landing da Aula Estratégica
  - Entre Potencial e Resultado - Landing Page
---

# Landing page — Aula Estratégica Entre Potencial e Resultado

> [!success] Decisão aprovada
> A primeira landing page da Uli será uma demonstração estática de inscrição para uma aula gratuita. Ela será instalada na raiz de `ulizarzana.com`, sem captação, transmissão ou armazenamento de dados.

## Evidências diretas

- O plano da mentoria prevê uma aula gratuita ao vivo como porta de entrada, seguida de grupo de WhatsApp e apresentação da mentoria.
- A análise dos lançamentos anteriores registra convite fraco, tradução comercial insuficiente da dor e promessa pouco específica.
- `Alunos.xlsx` contém 11 participantes ou interessados em aulas gratuitas; somente duas compras foram confirmadas pelo responsável pelo projeto.
- A pesquisa da audiência registra reconhecimento recorrente em liderança, execução, posicionamento, autoconfiança e constância.
- O currículo-base comprova mais de dez anos em vendas, mais de oito anos em liderança, progressão até diretoria, estrutura com 178 profissionais e 22 líderes formados.
- O público aprovado inclui profissionais, líderes e empresários experientes.

## Inferência estratégica

A venda direta da mentoria repetiria o erro de apresentar uma transformação profunda cedo demais. A porta de entrada deve entregar um avanço menor, específico e verificável: identificar o bloqueio central e definir o próximo movimento.

Por isso, a oferta determinada é:

> **Aula Estratégica — Entre Potencial e Resultado**

Promessa:

> **Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.**

Resultado imediato:

> Diagnóstico do bloqueio central e clareza sobre o próximo movimento para carreira, liderança ou negócio.

## Requisitos técnicos

- Página estática em HTML, CSS e JavaScript, sem framework ou build.
- Instalação na raiz do domínio, preservando `/identidade-visual/` e `/brandbook/`.
- Formulário visualmente completo, mas sem `action`, requisição, banco, CRM ou persistência.
- Confirmação local após a interação e descarte imediato dos valores digitados.
- Data demonstrativa: 24 de setembro de 2026, às 19h30.
- Aviso visível de que data e inscrições são ilustrativas.
- Contador encerrado de forma definitiva após a data demonstrativa.
- Sistema visual [[Paleta Técnica Definitiva - A1|A1]], B1, T1 e F1.
- Uso do wordmark tipográfico; o selo institucional continua provisório.

## Estrutura aprovada

1. Cabeçalho e hero com promessa, fotografia, contador e formulário.
2. Qualificação em cartões “É para quem” e “Não é para quem”.
3. Quatro conteúdos: diagnóstico, posicionamento, direção e execução.
4. Prova de reputação com percepções anônimas da audiência.
5. Autoridade da Uli com biografia e indicadores do currículo-base.
6. CTA final e rodapé com aviso de demonstração e privacidade.

## Copy central

Headline:

> **Identifique o bloqueio que impede sua experiência de se transformar em autoridade, influência e crescimento.**

Subheadline:

> Em duas horas, você compreenderá por que capacidade e entrega nem sempre se convertem em reconhecimento — e sairá com clareza sobre o próximo movimento para sua carreira, liderança ou negócio.

CTA:

> **Quero identificar meu próximo movimento**

## Limites

- A página não comprova validação do produto nem substitui pesquisa comercial futura.
- Percepções da audiência não serão tratadas como depoimentos de transformação.
- Nenhum resultado, escassez, número de vagas ou dado de evento será apresentado como real.
- A página não conclui o selo institucional nem suas regras de redução.
- A referência externa determina a arquitetura, não a identidade visual ou a redação.

## Relações

- [[Briefing Estratégico - Personalidade e Percepção da Marca]]
- [[Regras de Uso do Sistema Visual - A1 B1 F1]]
- [[Aplicações Fotográficas F1 - Derivados e Mockups 2026-08-12]]
- [[Mockups de Aplicação do Sistema Visual - A1 B1 T1 F1 2026-08-12]]

## Fonte técnica detalhada

A especificação integral está versionada em `docs/superpowers/specs/2026-08-12-landing-page-aula-estrategica-design.md`.

## Implementação e publicação

> [!success] Entrega verificada em 2026-08-12
> A landing page foi implementada na raiz do domínio e validada como demonstração estática. O formulário simula a conclusão da inscrição no próprio navegador, limpa os campos e não transmite nem armazena os valores digitados.

### Estado local

- Entrada principal: `web/index.html`.
- Sistema visual: `web/assets/design-tokens.css` e `web/assets/landing-page.css`.
- Interações demonstrativas: `web/assets/landing-page.js`.
- Cinco derivados fotográficos oficiais utilizados na composição.
- Contrato estático: `tests/validate-landing-page.ps1`.
- Testes de comportamento: `tests/landing-page.test.mjs`.
- Validação responsiva concluída em desktop, tablet e mobile, sem estouro horizontal.

### Estado Git

- Implementação e ajustes finais versionados na branch `main`.
- Commit de fechamento visual: `5b61754`.
- Repositório remoto sincronizado em `https://github.com/leoferrazbrasil/uli-zarzana`.

### Estado de hospedagem

- Nove arquivos publicados por FTP na raiz pública e em `assets/`.
- Os diretórios `identidade-visual/` e `brandbook/` foram preservados.
- Nenhuma credencial foi registrada neste cofre ou no repositório.

### Estado público verificado

- Landing page: `https://ulizarzana.com/` — HTTP 200.
- Identidade visual: `https://ulizarzana.com/identidade-visual/` — HTTP 200.
- Brandbook: `https://ulizarzana.com/brandbook/` — HTTP 200.
- CSS, JavaScript e fotografia principal: HTTP 200.
- Formulário demonstrativo testado publicamente, com confirmação local, limpeza dos campos e console sem erros.
