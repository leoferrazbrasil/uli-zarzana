# Derivados oficiais e mockups F1 — Especificação

## Decisão aprovada

Em 12/08/2026 foi aprovado o padrão de aplicabilidade editorial em cards verticais: fotografia em tela cheia, gradiente escuro para leitura, etiqueta temática, ícone discreto e mensagem ancorada na base.

## Objetivo

Transformar a shortlist F1 em derivados web reutilizáveis e aplicar o padrão aprovado nas páginas públicas de identidade visual e brandbook.

## Derivados

- Usar somente os IDs 015, 080, 082 e 087 nesta primeira família pública.
- Preservar os JPEGs originais em `fotos/` sem alteração.
- Gerar JPGs derivados em `web/assets/fotografia/` com recorte vertical 4:5 para cards e recorte horizontal 16:9 para hero.
- Usar nomes rastreáveis com ID, função e dimensão.
- Não publicar arquivos brutos nem fotos fora da shortlist.

## Aplicação

- `web/identidade-visual/index.html`: nova seção de cards editoriais F1 com quatro aplicações — Presença, Autoridade, Liderança e Ascensão.
- `web/brandbook/index.html`: seção de aplicações fotográficas e atualização do estado da seleção F1.
- A paleta canônica continua A1: `#332A26`, `#F7F0E7`, `#CDAE85` e `#B46F52`.
- O monograma final não será incorporado como logotipo; o uso do marcador UZ permanece provisório.

## Segurança e publicação

- Nenhum dado privado, credencial ou arquivo bruto entra no repositório ou FTP.
- O FTP publica somente HTML, CSS e derivados autorizados.
- Git, FTP e URLs públicas serão verificados separadamente.
