---
title: Paleta Técnica Definitiva - A1
date: 2026-08-11
status: aprovado
approval: approved
tipo: paleta-tecnica
tags:
  - uli-zarzana
  - marca
  - identidade-visual
  - paleta
  - aprovado
aliases:
  - Paleta A1 Uli Zarzana
---

# Paleta técnica definitiva — A1

> [!success] Decisão determinística aprovada
> A paleta A1 — Autoridade Clássica é composta por quatro cores canônicas. A decisão foi derivada do levantamento documental, das pesquisas de audiência, dos materiais visuais aprovados e da validação técnica de contraste.

## Cores canônicas

| Token | Nome | HEX | RGB | CMYK aproximado |
| --- | --- | --- | --- | --- |
| `--color-ink` | Marrom profundo | `#332A26` | `51, 42, 38` | `0, 18, 25, 80` |
| `--color-paper` | Marfim | `#F7F0E7` | `247, 240, 231` | `0, 3, 6, 3` |
| `--color-accent-champagne` | Champagne | `#CDAE85` | `205, 174, 133` | `0, 15, 35, 20` |
| `--color-accent-terracotta` | Terracota | `#B46F52` | `180, 111, 82` | `0, 38, 54, 29` |

Os valores CMYK são conversões de referência a partir de sRGB. A produção gráfica deve confirmar o resultado no perfil ICC da gráfica.

## Base de conhecimento utilizada

- [[Briefing Estratégico - Personalidade e Percepção da Marca]] e a direção aprovada A1/T1/B1/M2/F1.
- Currículo base, análise de expert, análise de mercado e Mentoria Individual.
- Aula `Aula_7_Criterios_Invisiveis_Turma_2_V02.pptx`, que reforça postura executiva, clareza, influência, julgamento, maturidade e comunicação.
- Pesquisa `Me ajuda a te ajudar_ Pesquisa Uli (respostas).xlsx`, com 53 respostas: a leitura temática associa Uli a carreira, liderança, clareza, postura, elegância e crescimento.
- `Alunos.xlsx`, com 11 participantes das aulas, reunindo objetivos de crescimento profissional, liderança, clareza, organização e prosperidade de negócios.
- `Preferência de cores Uli.pdf`, que registra preferência explícita por cores neutras, bege e marrom.
- Fotografias e peças visuais existentes, que sustentam o território escuro, editorial, sóbrio e humano.

Arquivos jurídicos e administrativos foram mantidos fora dos critérios visuais por não conterem evidência relevante para a definição da paleta.

## Regras de uso

1. Texto normal e elementos funcionais: marrom sobre marfim ou marfim sobre marrom.
2. Champagne: sobre marrom ou como elemento decorativo; não usar como texto pequeno sobre marfim.
3. Terracota: acento, título grande ou elemento decorativo; não usar como texto normal sobre marfim.
4. Champagne e terracota não devem formar pares de texto funcional.
5. Botões e controles: preferencialmente fundo marrom com texto marfim.
6. Não criar uma quinta cor funcional nesta etapa.
7. Gradientes, sombras coloridas e tons exploratórios não fazem parte da paleta canônica.

## Contraste validado

| Combinação | Contraste | Tratamento |
| --- | ---: | --- |
| Marrom profundo / Marfim | `12.38:1` | Texto normal e interface |
| Marrom profundo / Champagne | `6.66:1` | Texto e acento sobre fundo escuro |
| Marrom profundo / Terracota | `3.56:1` | Elemento grande ou decorativo |
| Marfim / Terracota | `3.48:1` | Elemento grande ou decorativo |
| Marfim / Champagne | `1.86:1` | Proibido para texto |
| Champagne / Terracota | `1.87:1` | Proibido para texto |

O critério adotado é WCAG 2.2: mínimo de `4.5:1` para texto normal e `3:1` para texto grande.

## Implementação e estados

- [x] Tokens adicionados em `web/assets/design-tokens.css`.
- [x] Identidade visual atualizada.
- [x] Brandbook atualizado.
- [x] Teste de contrato `tests/validate-color-palette.ps1` criado e aprovado.
- [x] Publicação FTP e verificação das URLs públicas — `identidade-visual/`, `brandbook/` e `assets/design-tokens.css` retornaram HTTP 200 em 2026-08-11.
- [x] Commit/push da implementação — `93006c1` publicado em `main` no repositório remoto.

> [!warning] Escopo
> Esta nota consolida a paleta técnica. Não finaliza o vetor do monograma, as regras completas de redução do símbolo, o tratamento fotográfico final ou o brandbook técnico completo.
