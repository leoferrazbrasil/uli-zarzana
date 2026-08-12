---
title: Mockups de Aplicação do Sistema Visual - A1 B1 T1 F1 2026-08-12
date: 2026-08-12
status: publicado-e-verificado
tipo: mockups-aplicacao
tags:
  - uli-zarzana
  - marca
  - identidade-visual
  - mockups
  - aplicacoes
aliases:
  - Mockups do Sistema Visual
---

# Mockups de aplicação do sistema visual — A1 + B1 + T1 + F1

## Decisão determinística

O sistema visual aprovado foi reorganizado em quatro seções horizontais independentes: Instagram, site, apresentação executiva e material da mentoria. A implementação é estática, compartilhada pelas páginas públicas de identidade visual e brandbook, e não depende do selo institucional final.

## Contextos

| Contexto | Função | Ativo fotográfico |
| --- | --- | --- |
| Instagram | Publicação editorial e quatro capas sociais de demonstração | `uli-f1-015-presenca-720x900.jpg`, `uli-f1-082-lideranca-720x900.jpg`, `uli-f1-080-autoridade-720x900.jpg`, `uli-f1-087-ascensao-720x900.jpg` |
| Site | Hero institucional | `uli-f1-015-hero-1600x900.jpg` |
| Apresentação | Capa e slide de conteúdo 16:9 | `uli-f1-080-autoridade-720x900.jpg` |
| Material da mentoria | Capa de módulo, aula ou apoio | `uli-f1-087-ascensao-720x900.jpg` |

## Regras aplicadas

- A1 sustenta os fundos e a hierarquia de contraste.
- B1 usa Libre Baskerville em títulos e Source Sans 3 em textos funcionais.
- T1 mantém composição editorial, respiro e uma ideia principal por peça.
- F1 usa somente derivados autorizados; os originais permanecem privados.
- O monograma aparece apenas como referência nominal/temporária; o selo institucional não foi liberado como logo final.

## Estados da entrega

- Local: quatro seções horizontais renderizadas nas duas páginas estáticas; a seção Instagram contém quatro cards de capas com cópia curta e degradê cromático; a Apresentação contém o método determinístico em cinco etapas; o Material da mentoria contém as cinco dimensões e a conclusão editorial responsiva.
- Git: implementação no commit `d442db7`, enviada para `main` em `https://github.com/leoferrazbrasil/uli-zarzana`.
- FTP: atualização incremental de 4 arquivos na raiz pública efetiva: 1 CSS, 1 JavaScript compartilhado e os dois HTML. Uma árvore redundante criada durante a identificação da raiz foi verificada, removida integralmente e não afetou os diretórios públicos legítimos. O conjunto público permanece sem fotos brutas ou credenciais.
- Público: as duas páginas, o CSS e o JavaScript retornaram HTTP 200 com a versão `20260812-instagram-feed-v3`; a renderização pública confirmou quatro cards, três linhas visuais por capa, ausência de overflow e leitura responsiva em desktop e mobile.

## Próximo avanço

Consolidar o brandbook técnico final com as regras, tokens, derivados e mockups; manter a finalização do selo institucional como frente futura separada.

## Padrão de capas sociais na seção Instagram

- Formato determinado: 9:16, com referência de produção 1080 × 1920 px para Reels, Stories e conteúdos sociais.
- Estrutura: imagem em tela cheia, degradê cromático da paleta A1, contexto curto, headline editorial, subtítulo curto e destaque em champagne/terracota, sem rodapé ou informação técnica dentro da peça.
- Variações demonstradas: carreira, liderança, autoridade e ascensão.
- A fonte manuscrita dos exemplos foi substituída pela tipografia B1 aprovada.
- Regra editorial final: cada capa possui exatamente três linhas visuais — contexto, palavra-chave dominante e complemento — sem alterar foto, ordem, enquadramento ou proporção dos cards.
- Escala: a palavra-chave usa Libre Baskerville 700 entre 34 e 42 px; contexto e complemento usam Source Sans 3 entre 15 e 18 px.
- Posições determinadas pela fotografia: carreira no centro inferior; liderança no topo central; autoridade no topo; ascensão no topo central.
- Degradê: cada capa recebeu proteção individual em marrom profundo `#332A26` e espresso, concentrada atrás do texto; champagne e terracota permanecem acentos da paleta técnica.
- Redação final: `capacidade que vira / autoridade. / para o próximo passo`; `decisões maiores pedem / presença. / na liderança`; `o que você construiu / percebido. / com consistência`; `o próximo passo pede / direção. / sem perder identidade`.
- Remoções: não aparecem nome da expert, indicação `capa`, formato `9:16`, métricas, ícones ou interface técnica dentro das peças. A referência de produção permanece apenas na legenda externa da seção.
- Verificação local: quatro cards na seção própria do Instagram; cada bloco confirmou `1 + 1 + 1` linha visual, ausência de overflow e ausência de rodapé em `1440 × 1000` e `390 × 844`.

## Correção de escopo — capas sociais

- A aplicação social oficial permanece denominada **Padrão de aplicabilidade de capas para Instagram e conteúdo social**.
- A conclusão determinística é separar os quatro contextos em seções horizontais e usar o Instagram como uma seção de quatro cards de capas semelhantes aos Cards editoriais F1, porque os anexos eram referência de padrão visual e não uma nova seção educativa.
- As seções públicas autônomas `social-vertical` e `social-covers` permanecem removidas; o histórico documental permanece preservado.
- O indicador de visualização dos exemplos não foi reproduzido como métrica de marca.

## Conteúdo determinístico da apresentação

- A área inferior livre da capa de apresentação foi preenchida com o método central registrado no briefing estratégico: `identidade → clareza → decisão → execução → resultado`.
- Cada etapa recebeu uma função curta e operacional: reconhecer capacidade e contexto; reposicionar a atuação; escolher o próximo movimento; transformar intenção em ação consistente; converter capacidade em reconhecimento.
- A conclusão do bloco retoma o posicionamento aprovado para profissionais e empresários experientes: transformar capacidade em autoridade, influência e crescimento sustentável.
- A escolha é determinada pela base de conhecimento e não cria uma nova promessa: o conteúdo traduz a transformação central da mentoria em uma aplicação editorial de leitura imediata.
- No desktop, as cinco etapas ocupam a faixa horizontal e a conclusão ancora o bloco no rodapé da área escura. No mobile, as etapas passam para duas colunas e a conclusão permanece empilhada, preservando contraste, respiro e legibilidade.

## Conteúdo determinístico do material da mentoria

- A área escura anteriormente vazia foi preenchida mantendo a mensagem principal `Entre potencial e resultado.` e corrigindo o contraste do título e do texto de apoio.
- O conteúdo complementar usa as cinco dimensões já registradas no briefing: **SER** (identidade e posicionamento), **PENSAR** (julgamento e direção), **FALAR** (comunicação e influência), **AGIR** (evidências e execução) e **RECEBER** (reconhecimento, oportunidades e retorno).
- A aplicação foi escolhida para o contexto de módulos, aulas e materiais de apoio: apresenta a arquitetura da mentoria de forma editorial, concreta e aplicável a profissionais e empresários experientes.
- No desktop, as cinco dimensões formam uma faixa horizontal e a frase `Da trajetória à próxima posição.` ancora o painel. No mobile, a estrutura passa para duas colunas, com a quinta dimensão e a conclusão em sequência vertical.

## Evidência pública

- [Identidade visual](https://ulizarzana.com/identidade-visual/?v=20260812-instagram-feed-v3)
- [Brandbook](https://ulizarzana.com/brandbook/?v=20260812-instagram-feed-v3)
- [CSS dos mockups](https://ulizarzana.com/assets/application-mockups.css?v=20260812-instagram-feed-v3)
- [JavaScript dos mockups](https://ulizarzana.com/assets/application-mockups.js?v=20260812-instagram-feed-v3)
