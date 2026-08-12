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

- Local: quatro seções horizontais renderizadas nas duas páginas estáticas; a seção Instagram contém quatro cards de capas semelhantes aos Cards editoriais F1.
- Git: commit `69bd1db` enviado para `main` em `https://github.com/leoferrazbrasil/uli-zarzana`.
- FTP: 8 arquivos publicados na raiz FTP correspondente a `public_html`: 2 HTML, 1 CSS e 5 derivados F1.
- Público: as duas páginas, o CSS e os cinco derivados retornaram HTTP 200 com a versão `20260812-mockups-sections-v1`; a estrutura pública contém quatro seções e quatro cards Instagram, sem a grade antiga ou seções sociais autônomas.

## Próximo avanço

Consolidar o brandbook técnico final com as regras, tokens, derivados e mockups; manter a finalização do selo institucional como frente futura separada.

## Padrão de capas sociais na seção Instagram

- Formato determinado: 9:16, com referência de produção 1080 × 1920 px para Reels, Stories e conteúdos sociais.
- Estrutura: imagem em tela cheia, gradiente inferior, contexto curto, título editorial, destaque em champagne/terracota e rodapé discreto.
- Variações demonstradas: carreira, liderança, autoridade e ascensão.
- A fonte manuscrita dos exemplos foi substituída pela tipografia B1 aprovada.
- Verificação local: quatro cards na seção própria do Instagram, proporção responsiva, leitura visual e ausência de overflow confirmadas.

## Correção de escopo — capas sociais

- A aplicação social oficial permanece denominada **Padrão de aplicabilidade de capas para Instagram e conteúdo social**.
- A conclusão determinística é separar os quatro contextos em seções horizontais e usar o Instagram como uma seção de quatro cards de capas semelhantes aos Cards editoriais F1, porque os anexos eram referência de padrão visual e não uma nova seção educativa.
- As seções públicas autônomas `social-vertical` e `social-covers` permanecem removidas; o histórico documental permanece preservado.
- O indicador de visualização dos exemplos não foi reproduzido como métrica de marca.

## Evidência pública

- [Identidade visual](https://ulizarzana.com/identidade-visual/?v=20260812-mockups-sections-v1)
- [Brandbook](https://ulizarzana.com/brandbook/?v=20260812-mockups-sections-v1)
- [CSS dos mockups](https://ulizarzana.com/assets/application-mockups.css?v=20260812-mockups-sections-v1)
