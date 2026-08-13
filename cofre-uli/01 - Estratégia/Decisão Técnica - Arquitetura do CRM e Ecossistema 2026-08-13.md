---
title: Decisão Técnica - Arquitetura do CRM e Ecossistema 2026-08-13
date: 2026-08-13
status: determinada-para-implementacao
tipo: decisao-tecnica
tags:
  - uli-zarzana
  - ecossistema-digital
  - crm
  - arquitetura
  - nextjs
  - supabase
  - typescript
aliases:
  - Stack do CRM Uli Zarzana
  - Arquitetura Técnica do Ecossistema Digital
---

# Decisão técnica — arquitetura do CRM e do ecossistema digital

> [!success] Conclusão determinada
> O sistema será desenvolvido com **Next.js App Router + React + TypeScript** no frontend e na camada de aplicação, usando **Supabase** como backend gerenciado: PostgreSQL, Auth, Row Level Security, Storage e Edge Functions. A aplicação autenticada será hospedada em runtime compatível com Next.js, preferencialmente **Vercel**. Não será criado um backend Node.js/Express separado no MVP.

## Por que esta é a escolha adequada

O MVP precisa de uma interface autenticada para Administradora e Comercial, dados relacionais de CRM, histórico append-only, regras de acesso por perfil, formulários de entrada e futuras integrações com WhatsApp, Instagram e plataformas de pagamento. A combinação escolhida cobre esses requisitos com uma arquitetura proporcional:

- Next.js concentra telas, navegação, renderização e endpoints pontuais;
- TypeScript reduz ambiguidades no modelo Lead/Event/Offer/Task e permite gerar tipos a partir do banco;
- Supabase fornece Postgres, autenticação e controle de acesso por RLS;
- Edge Functions recebem webhooks e executam integrações que não devem expor segredos ao navegador;
- Vercel fornece o runtime adequado para uma aplicação Next.js dinâmica.

## Stack oficial

| Camada | Tecnologia determinada | Uso no projeto |
| --- | --- | --- |
| Framework full-stack | **Next.js App Router** | Rotas, layouts, Server Components, Client Components e Route Handlers. |
| UI | **React** | Componentes da Visão Geral, Pipeline, Leads, Tarefas, Ofertas e Configurações. |
| Linguagem | **TypeScript** | Domínio, componentes, contratos de API, validações e testes. |
| Estilo | **CSS Modules + tokens CSS existentes** | Aplicar A1/B1/T1 sem substituir a identidade visual por um kit genérico. |
| Backend principal | **Supabase** | Postgres, Auth, RLS, Storage e serviços gerenciados. |
| Lógica de integração | **Supabase Edge Functions em TypeScript/Deno** | Webhooks, WhatsApp oficial, Instagram, formulários públicos e integrações com checkout. |
| Validação de entrada | **Zod** | Validar payloads de formulário, eventos, ofertas e webhooks antes de persistir. |
| Dados no cliente | **Supabase JS + TanStack Query** | Sessão, consultas, cache e invalidação no painel autenticado. |
| Testes | **Vitest + Testing Library + Playwright** | Regras puras, componentes e fluxos críticos autenticados. |
| Qualidade | **ESLint + Prettier + TypeScript strict** | Padronização e bloqueio de erros evitáveis. |
| Hospedagem do sistema | **Vercel** | Runtime dinâmico do Next.js e deploy conectado ao GitHub. |
| Hospedagem estática atual | **Hostinger via FTP** | Landing, identidade visual, brandbook e protótipo estático enquanto permanecerem estáticos. |

## Backend: o que será e o que não será

### Será utilizado

- PostgreSQL do Supabase como fonte de verdade;
- Supabase Auth para usuários autenticados;
- RLS para separar o que Administradora e Comercial podem consultar ou alterar;
- tabelas de `leads`, `interactions`, `offers`, `tasks`, `funnel_events`, `community_conversions` e `profiles`;
- Edge Functions para receber webhooks e operar com chaves secretas;
- Route Handlers do Next.js somente para BFF, webhooks controlados ou operações que precisem combinar autenticação e dados.

### Não será utilizado no MVP

- backend Node.js/Express separado;
- servidor VPS próprio;
- ORM obrigatório antes de validar o schema do Supabase;
- microserviços;
- Redis, filas ou workers dedicados;
- Kubernetes;
- integração automática com Instagram antes de permissões e necessidade comprovada;
- área de membros própria.

Node.js continuará sendo o runtime de desenvolvimento e ferramentas do projeto, mas não será uma API Express independente. O Next.js já oferece Route Handlers quando houver necessidade de uma camada de servidor específica.

## Arquitetura de alto nível

```mermaid
flowchart LR
    A[Landing page e redes sociais] --> B[Formulário / CTA WhatsApp]
    B --> C[Edge Function ou Route Handler]
    C --> D[Supabase Auth / Postgres / RLS]
    D --> E[Next.js CRM autenticado]
    E --> F[Administradora]
    E --> G[Comercial]
    C --> H[Webhooks futuros]
    H --> I[WhatsApp oficial]
    H --> J[Instagram]
    H --> K[Checkout / área de membros]
```

## Regra de segurança

O navegador poderá usar somente a chave pública do Supabase, sempre com RLS ativo e políticas de menor privilégio. Chaves secretas, service role e credenciais de integrações existirão somente em variáveis de ambiente de servidor ou secrets das Edge Functions. Nunca serão gravadas no repositório, no frontend, no cofre ou em mensagens.

## Ordem de implementação

1. Criar o aplicativo Next.js em uma área própria do repositório, sem substituir as páginas estáticas existentes.
2. Migrar os tokens A1/B1/T1 e a casca visual do protótipo estático para componentes reutilizáveis.
3. Definir migrations SQL do Supabase para perfis, leads, eventos, ofertas, tarefas e conversões.
4. Configurar Auth e RLS para Administradora e Comercial.
5. Implementar o cadastro real de lead da landing page.
6. Implementar Visão Geral, Leads, Pipeline, detalhe, tarefas e ofertas com dados reais.
7. Implementar as transições determinísticas do funil dentro de transações/eventos auditáveis.
8. Adicionar Edge Functions para webhooks e integrações externas somente quando cada contrato estiver definido.

## Decisão de hospedagem

O protótipo atual continua em `https://crm.ulizarzana.com/` como demonstração estática. A aplicação real deverá ocupar esse subdomínio em uma hospedagem de runtime Next.js, preferencialmente Vercel. A raiz `https://ulizarzana.com/` e as áreas estáticas existentes permanecem na Hostinger até uma migração futura, caso ela se torne necessária.

## Critério para reconsiderar a arquitetura

A arquitetura só deverá ser revista se surgirem requisitos comprovados que o conjunto Next.js + Supabase não atenda, como processamento assíncrono pesado, volume elevado de mensagens, necessidade de workers persistentes ou integrações que exijam infraestrutura própria. Até que esses sinais apareçam, adicionar um backend Node/Express separado aumentaria complexidade sem resolver uma necessidade do MVP.

## Fontes técnicas

- [Next.js App Router](https://nextjs.org/docs/app)
- [Next.js Route Handlers](https://nextjs.org/docs/app/getting-started/route-handlers)
- [Supabase Database](https://supabase.com/docs/guides/database/overview)
- [Supabase Row Level Security](https://supabase.com/docs/guides/database/postgres/row-level-security)
- [Supabase Edge Functions](https://supabase.com/docs/guides/functions)
