# Sistema Tipográfico B1 — Assinatura Executiva

**Data:** 11 de agosto de 2026

**Status:** aprovado para especificação

**Decisão:** B — Clássica Executiva + B1 — Assinatura Executiva

## Objetivo

Definir a assinatura nominal e a hierarquia tipográfica da marca Uli Zarzana com equilíbrio entre autoridade executiva, sofisticação editorial, proximidade humana e legibilidade digital.

## Decisões aprovadas

- **Serifada principal:** Libre Baskerville.
- **Sans-serif funcional:** Source Sans 3.
- **Tratamento nominal:** B1 — Assinatura Executiva.
- **Grafia da marca:** `Uli Zarzana`, em caixa mista. Não usar o nome integralmente em caixa alta como assinatura principal.
- **Princípio:** títulos e assinatura devem sustentar a autoridade; textos e elementos funcionais devem manter clareza e ritmo contemporâneo.

## Assinatura nominal

A assinatura tipográfica principal utiliza **Libre Baskerville 700**. A composição preserva iniciais maiúsculas e demais letras minúsculas, evitando a rigidez institucional da caixa alta integral.

Especificação de referência validada na comparação visual:

- peso: `700`;
- altura de linha: `1`;
- espaçamento entre letras: `-0.035em`;
- alinhamento preferencial: à esquerda;
- cor principal: marrom profundo sobre marfim ou marfim sobre marrom profundo;
- efeito, sombra, contorno ou deformação: não permitidos.

O valor em pixels varia conforme a aplicação. A proporção e o ritmo óptico acima devem ser preservados antes de qualquer ajuste específico de mídia.

## Hierarquia editorial

### Títulos de impacto

- família: Libre Baskerville;
- peso: `700`;
- altura de linha recomendada: `1.05–1.15`;
- espaçamento recomendado: `-0.025em`;
- uso: capas, aberturas, páginas institucionais, aulas e mensagens centrais;
- evitar: blocos extensos, caixa alta integral e pesos inferiores a 400 em tamanhos reduzidos.

### Textos e conteúdos funcionais

- família: Source Sans 3;
- corpo: `400`;
- ênfase e links: `500`;
- subtítulos, botões e informações institucionais: `600`;
- altura de linha: `1.5–1.65` para texto corrido;
- corpo mínimo recomendado na web: `16px` para leitura contínua.

### Etiquetas institucionais

- família: Source Sans 3;
- peso: `600`;
- caixa: alta;
- espaçamento recomendado: `0.14–0.18em`;
- uso restrito a categorias, funções, seções e linhas curtas;
- não aplicar a frases ou parágrafos.

## Escala inicial para implementação

| Papel | Desktop | Mobile | Peso | Entrelinha |
|---|---:|---:|---:|---:|
| Assinatura nominal | 40–48 px | 30–36 px | 700 | 1.00 |
| Display | 56–64 px | 38–44 px | 700 | 1.05 |
| H1 | 44–52 px | 34–38 px | 700 | 1.10 |
| H2 | 34–40 px | 28–32 px | 700 | 1.15 |
| H3 | 24–28 px | 22–24 px | 700 | 1.20 |
| Corpo grande | 18–20 px | 18 px | 400 | 1.60 |
| Corpo | 16–18 px | 16 px | 400 | 1.60 |
| Legenda | 14 px | 14 px | 400–500 | 1.45 |
| Etiqueta | 11–12 px | 11–12 px | 600 | 1.20 |

Os intervalos permitem adequação ao formato sem alterar a personalidade aprovada. A implementação deverá converter esta escala em tokens responsivos e testar quebras reais de texto.

## Fallbacks e carregamento

- serifada: `"Libre Baskerville", Georgia, serif`;
- sans-serif: `"Source Sans 3", "Segoe UI", Arial, sans-serif`;
- carregar somente os pesos efetivamente usados;
- priorizar `font-display: swap` ou estratégia equivalente;
- impedir mudança excessiva de layout durante o carregamento.

## Acessibilidade e qualidade

- contraste mínimo de texto normal: `4.5:1`;
- contraste mínimo de texto grande: `3:1`;
- não usar pesos abaixo de 400 em conteúdo funcional;
- não usar caixa alta em blocos longos;
- manter alinhamento à esquerda em leitura contínua;
- testar a assinatura e a hierarquia em telas pequenas, ampliações de navegador e fundos claros e escuros.

## Alternativas não selecionadas

- **B2 — Institucional Maiúscula:** descartada como assinatura principal por aumentar a distância e a rigidez corporativa.
- **B3 — Clássica Humana:** descartada como assinatura principal por reduzir parte da firmeza executiva e aproximar a marca de um universo autoral ou de lifestyle.

## Fora do escopo desta decisão

- desenho final do selo institucional e do monograma UZ;
- validação técnica final da paleta;
- composição definitiva entre símbolo e assinatura nominal;
- regras completas de área de proteção e redução;
- publicação dos arquivos de fonte ou de ativos finais.

## Critérios de aceitação da implementação

1. A assinatura `Uli Zarzana` mantém leitura imediata e presença executiva em desktop e mobile.
2. Libre Baskerville é usada apenas para assinatura e hierarquia editorial; Source Sans 3 sustenta leitura e interface.
3. Os pesos, espaçamentos e entrelinhas respeitam os papéis definidos nesta especificação.
4. A hierarquia passa pelos critérios mínimos de contraste e tamanho.
5. O sistema funciona em fundos marfim e marrom profundo sem efeitos decorativos.
6. A implementação não depende do selo institucional ainda pendente.

## Próxima etapa

Após revisão deste documento, criar o plano de implementação dos tokens tipográficos e das aplicações de validação. Em seguida, avançar para a **paleta técnica**, mantendo a finalização do selo institucional no roadmap futuro.
