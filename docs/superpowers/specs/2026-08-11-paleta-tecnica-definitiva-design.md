# Paleta técnica definitiva — Uli Zarzana

> Status: aprovada para implementação em 2026-08-11
> Escopo: normalização técnica da paleta A1 — Autoridade Clássica

## Decisão

A identidade visual da Uli Zarzana usará quatro cores canônicas, sem introdução de uma quinta cor funcional:

| Token | Nome | HEX | RGB | CMYK aproximado |
| --- | --- | --- | --- | --- |
| `--color-ink` | Marrom profundo | `#332A26` | `51, 42, 38` | `0, 18, 25, 80` |
| `--color-paper` | Marfim | `#F7F0E7` | `247, 240, 231` | `0, 3, 6, 3` |
| `--color-accent-champagne` | Champagne | `#CDAE85` | `205, 174, 133` | `0, 15, 35, 20` |
| `--color-accent-terracotta` | Terracota | `#B46F52` | `180, 111, 82` | `0, 38, 54, 29` |

Os valores CMYK são conversões de referência a partir de sRGB. A produção gráfica final deverá validar o resultado no perfil ICC da gráfica.

## Fundamentação da decisão

- A preferência de cor registrada pela Uli é explícita: cores neutras, bege e marrom.
- O briefing aprovado define autoridade vivida, sofisticação, clareza, segurança, visão estratégica e humanidade, evitando ostentação, banco tradicional e coach de luxo.
- O currículo, a análise de expert, a mentoria e a aula sustentam uma presença executiva, editorial, estratégica, prática e orientada a resultado.
- A pesquisa com 53 respostas associa Uli a liderança, carreira, clareza, postura, elegância e crescimento; a planilha de 11 participantes confirma objetivos mistos de carreira, liderança, clareza e prosperidade de negócios.
- Os materiais visuais existentes usam uma atmosfera de marrom escuro, marfim, bege/dourado suave e fotografia editorial. A paleta canônica normaliza essa atmosfera e evita que os diversos tons exploratórios da apresentação virem cores oficiais.
- A acessibilidade pode ser garantida com a paleta aprovada por regras de combinação; não há necessidade de criar outra cor.

## Regras de aplicação

1. Texto normal e elementos funcionais devem usar `--color-ink` sobre `--color-paper` ou `--color-paper` sobre `--color-ink`.
2. `--color-accent-champagne` deve aparecer sobre `--color-ink` ou em elementos decorativos sem função textual.
3. `--color-accent-terracotta` deve aparecer como acento, título grande ou elemento decorativo; não deve ser usado para texto normal sobre `--color-paper`.
4. `--color-accent-champagne` não deve ser usado como texto pequeno sobre `--color-paper`.
5. `--color-accent-champagne` e `--color-accent-terracotta` não devem formar pares de texto funcional.
6. Botões e controles devem priorizar fundo `--color-ink` com texto `--color-paper`; a inversão é permitida quando houver necessidade editorial.
7. Gradientes, sombras coloridas e novos tons derivados não fazem parte da paleta canônica nesta etapa.

## Contraste WCAG 2.2

| Combinação | Contraste | Uso determinado |
| --- | ---: | --- |
| Marrom profundo / Marfim | `12.38:1` | Texto normal e interface |
| Marrom profundo / Champagne | `6.66:1` | Texto e acento sobre fundo escuro |
| Marrom profundo / Terracota | `3.56:1` | Apenas elemento grande/decorativo |
| Marfim / Terracota | `3.48:1` | Apenas elemento grande/decorativo |
| Marfim / Champagne | `1.86:1` | Não usar para texto |
| Champagne / Terracota | `1.87:1` | Não usar para texto |

O critério adotado é o WCAG 2.2, que exige contraste mínimo de `4.5:1` para texto normal e `3:1` para texto grande.

## Critério de aceite

- Os quatro tokens existem em `web/assets/design-tokens.css`.
- As duas páginas públicas usam os tokens canônicos e não possuem cores hexadecimais concorrentes para a identidade.
- As regras de contraste e de uso proibido estão cobertas por teste automatizado.
- O cofre Obsidian registra a decisão como paleta técnica definitiva.
- O estado local, o commit/push, a publicação FTP e as URLs públicas são verificados separadamente.
