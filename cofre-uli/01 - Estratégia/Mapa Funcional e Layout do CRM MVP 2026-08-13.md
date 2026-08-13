---
title: Mapa Funcional e Layout do CRM MVP 2026-08-13
date: 2026-08-13
status: implementado-prototipo
tipo: decisao-e-especificacao
tags:
  - uli-zarzana
  - ecossistema-digital
  - crm
  - mvp
  - layout
  - deterministico
aliases:
  - CRM MVP Uli Zarzana
  - Layout da Visão Geral do CRM
---

# Mapa funcional e layout do CRM MVP

> [!success] Conclusão determinada
> O próximo avanço adequado é um CRM comercial próprio, iniciado por um protótipo estático navegável. A tela inicial é **Visão Geral**, não Pipeline. O protótipo foi implementado em `web/crm/`, com a identidade A1/B1/T1 aplicada, dados fictícios e sem backend.

## Decisão autônoma desta etapa

Com base no cofre, na especificação do MVP e nas regras já aprovadas, a implementação não depende de nova escolha humana. A solução determinada é validar primeiro a arquitetura da operação em uma interface pequena, navegável e visualmente coerente. Supabase, autenticação e integrações reais entram somente após a validação do fluxo e da política de acesso.

## Telas determinadas

1. **Visão Geral** — leitura do dia, seis indicadores, distribuição do pipeline, tarefas e atividade recente.
2. **Pipeline** — cinco colunas: Novo, Qualificando, Oferta, Ganho e Perdido.
3. **Leads** — busca, filtros por estado/origem e abertura do detalhe.
4. **Detalhe do lead** — contato, estado, responsável e histórico.
5. **Tarefas** — hoje, próximas e concluídas.
6. **Ofertas** — ofertas apresentadas e estado da decisão.
7. **Relatórios** — distribuição por estado e origem, sem métricas prematuras.
8. **Configurações** — governança, equipe, conectores futuros e ambiente.

## Layout determinado

- Desktop: sidebar fixa de 248 px, topbar de 76 px e área de conteúdo centralizada.
- Mobile: sidebar convertida em drawer e grids reduzidos para uma coluna.
- Base visual: marrom profundo e marfim; champagne e terracota como acentos.
- Tipografia: Libre Baskerville em títulos; Source Sans 3 em interface e dados.
- O selo institucional continua fora desta fase.
- O estado do lead não é alterado por arrastar cartão; é determinado por evento válido.

## Indicadores de hoje

| Indicador | Derivação |
| --- | --- |
| Novos leads hoje | Leads criados no dia corrente. |
| Leads em qualificação | Estado atual igual a `qualificando`. |
| Ofertas apresentadas hoje | Ofertas registradas no dia corrente. |
| Ganhos hoje | Conversões registradas no dia corrente. |
| Perdidos hoje | Transições para perdido registradas no dia corrente. |
| Tarefas pendentes hoje | Tarefas não concluídas com prazo no dia corrente. |

O protótipo usa a data fictícia de 13 de agosto de 2026 apenas para demonstrar a tela. Não são dados reais nem métricas de negócio.

## Regras do funil incorporadas

- Todo lead começa como **Novo**.
- A primeira interação válida leva a **Qualificando**.
- Mensagens vagas, vazias, de erro ou automáticas sem conteúdo não avançam o estado.
- Oferta apresentada leva a **Oferta**.
- Entrada confirmada na comunidade Vida Extraordinária leva a **Ganho**.
- Encerramento sem conversão leva a **Perdido**.
- Modal e motivo obrigatório de perda ficam no roadmap futuro.

## Perfis refletidos

- **Administradora:** acesso total, governança, usuários, configurações, relatórios e CRM.
- **Comercial:** cadastro, qualificação, ofertas, tarefas e atualização de leads.
- **Lead:** entidade externa sem login no MVP.

## Artefatos implementados

- `web/crm/index.html` — casca e telas navegáveis.
- `web/crm/assets/crm.css` — layout responsivo e aplicação dos tokens visuais.
- `web/crm/assets/crm-app.js` — dados fictícios, renderização e regras puras testáveis.
- `tests/crm-mvp.test.mjs` — contrato de métricas, busca, transições e rotas.
- `tests/validate-crm-mvp.ps1` — validação estrutural, visual e de limites do protótipo.

## Limites

Esta entrega não inclui Supabase, autenticação, persistência, WhatsApp oficial, Instagram, envio de mensagens, dados reais ou área de membros. A publicação é uma demonstração isolada no subdomínio `crm.ulizarzana.com`.

## Próximo avanço determinado

Após a verificação pública desta interface, criar a fundação técnica autenticada do CRM: schema Supabase mínimo, RLS para Administradora/Comercial, tabela de eventos append-only e contrato de entrada do formulário da landing page. A integração oficial do WhatsApp e a integração com Instagram permanecem posteriores.
