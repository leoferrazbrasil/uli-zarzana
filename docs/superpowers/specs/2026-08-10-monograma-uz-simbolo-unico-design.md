---
title: Design do Monograma UZ como Símbolo Único
date: 2026-08-10
status: aprovado-para-implementacao
approval: approved
tipo: especificacao-visual
tags:
  - uli-zarzana
  - identidade-visual
  - monograma
  - svg
---

# Design do Monograma UZ como Símbolo Único

## Objetivo

Criar o símbolo principal da marca Uli Zarzana como uma única construção vetorial na qual o círculo institucional se transforma nas letras **U** e **Z**. O resultado deve preservar a atmosfera **A1 — Autoridade Clássica**, a integração autoral **M2 — Monograma UZ** e a legibilidade mínima necessária para aplicações como favicon.

## Arquitetura aprovada

A solução será um **anel interrompido que se transforma no UZ**.

O círculo não será uma moldura independente. Seus segmentos deverão conduzir as formas internas:

- o arco superior participa da barra superior do Z;
- a diagonal do Z conduz visualmente ao setor inferior;
- o setor inferior se transforma na curva do U;
- a subida do U retorna ao anel, encerrando a assinatura;
- as transições devem parecer intencionais e contínuas, sem pontas decorativas soltas.

## Construção vetorial

- Um único elemento gráfico para círculo e monograma.
- Obrigatoriamente um único elemento SVG `<path>` com contorno fechado para toda a geometria visível do símbolo.
- Fundo transparente.
- Geometria contínua e escalável, sem estética pixel art.
- Sem gradientes, sombras, texturas ou filtros.
- Terminais expostos devem ser evitados.
- Junções devem manter espessura e ritmo óptico coerentes.
- O símbolo deve funcionar em uma única cor.

## Leitura das iniciais

A unidade do símbolo não pode eliminar a identificação das letras:

- o **U** deve ser percebido pela curva inferior e pela subida estrutural;
- o **Z** deve ser percebido pela barra superior, diagonal e base;
- as letras devem ser reconhecidas após a percepção inicial do símbolo como uma assinatura única;
- não depender de duas cores para diferenciar U e Z.

## Proporções de referência

- Canvas técnico: `viewBox="0 0 16 16"`.
- Diâmetro óptico máximo: aproximadamente 14,4 unidades.
- Margem externa mínima: aproximadamente 0,8 unidade.
- Espessura visual inicial: entre 1,2 e 1,5 unidade, ajustada opticamente.
- Ocupação interna: entre 65% e 72% do diâmetro útil.
- Transições entre anel e letras: no máximo duas, para evitar aparência de grade ou gaiola.

Esses valores orientam a primeira construção e podem receber correções ópticas após o teste visual.

## Testes obrigatórios

O mesmo SVG deverá ser verificado em:

- 16 × 16 px;
- 24 × 24 px;
- 32 × 32 px;
- 64 × 64 px;
- aplicação ampliada;
- versão escura sobre fundo claro;
- versão clara sobre fundo escuro;
- monocromia, sem diferenciação por cor.

A avaliação deve observar:

1. percepção de um único símbolo;
2. leitura posterior de U e Z;
3. ausência de terminais desalinhados;
4. equilíbrio entre massa, respiro e círculo;
5. ausência de perda estrutural em 16 px.

## Entregáveis da implementação

- SVG principal escuro.
- SVG reverso claro.
- Quadro comparativo nos tamanhos obrigatórios.
- Registro do candidato no cofre após aprovação visual.
- Atualização da identidade visual e do brandbook somente depois da aprovação do vetor.

## Fora do escopo desta etapa

- seleção final de tipografia;
- validação técnica completa da paleta;
- regras finais de área de proteção;
- mockups de aplicações;
- publicação na hospedagem;
- brandbook final.

## Critério de aprovação

A versão será considerada pronta para avançar quando o observador perceber primeiro uma assinatura institucional única e, em seguida, conseguir identificar as iniciais UZ sem explicação adicional.
