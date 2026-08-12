# Mockups de aplicações do sistema visual — Especificação

## Objetivo

Demonstrar, em quatro contextos concretos, como o sistema visual aprovado A1 + B1 + T1 + F1 funciona antes da consolidação do brandbook técnico final.

## Decisão

Os mockups serão implementados como uma seção compartilhada nas páginas estáticas de identidade visual e brandbook. A apresentação visual terá uma galeria editorial; o brandbook terá a mesma galeria com descrições de função e limites de uso.

## Contextos determinados

1. **Instagram:** perfil e publicação editorial com hierarquia de etiqueta, título e legenda.
2. **Site:** hero institucional com retrato F1 horizontal e chamada de posicionamento.
3. **Apresentação:** capa 16:9 e composição de slide executivo com retrato lateral.
4. **Material da mentoria:** capa vertical de módulo com título, identificação e chamada de aplicação.

## Regras de implementação

- Usar somente HTML e CSS estáticos, sem framework ou dependência adicional.
- Criar `web/assets/application-mockups.css` como folha compartilhada.
- Consumir os tokens A1/B1 existentes e somente os derivados JPG autorizados.
- Não inserir fotos brutas, novos tons, gradientes coloridos ou o monograma como logo final.
- Manter o aviso de que o selo institucional permanece provisório.
- Garantir adaptação para telas estreitas sem perder a leitura dos quatro contextos.
- Publicar os mesmos arquivos aprovados via FTP após a verificação local.

## Critérios de aceite

- Cada página contém os quatro contextos identificados e visualmente distintos.
- O CSS compartilhado referencia os tokens canônicos e contém regra responsiva.
- As páginas não referenciam a pasta privada `fotos/`.
- Os derivados F1 aparecem nos mockups sem substituir o monograma futuro.
- Os testes locais e as duas URLs públicas retornam HTTP 200 após publicação.
