# Seção “O que vem a seguir” no final — Especificação

## Objetivo

Garantir que a seção `O que vem a seguir` seja a última seção apresentada ao usuário na página de identidade visual. A seção equivalente `8. Próximas definições` deve ocupar a mesma posição final no brandbook.

## Decisão

Usar o JavaScript compartilhado já carregado pelas duas páginas para localizar os blocos pelo título e anexá-los ao final do elemento `<main>`. O conteúdo, estilo, identificadores e links dos blocos permanecem inalterados; somente a ordem efetiva do DOM é alterada.

## Critérios de aceite

- A seção `O que vem a seguir` aparece depois de `#mockups` e imediatamente antes do fechamento de `<main>` na identidade visual.
- A seção `8. Próximas definições` aparece depois de `#mockups` e imediatamente antes do fechamento de `<main>` no brandbook.
- A navegação visual e a ordem de leitura são iguais em desktop e mobile.
- Nenhum texto, estilo ou link das seções é alterado.
- O comportamento é coberto por teste estrutural e inspeção no navegador.
