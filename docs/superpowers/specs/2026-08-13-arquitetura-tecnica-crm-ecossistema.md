---
title: Arquitetura técnica do CRM e ecossistema digital Uli
date: 2026-08-13
status: determinada
---

# Arquitetura técnica determinada

## Resposta direta

- **Framework:** Next.js com App Router.
- **Frontend:** React + TypeScript.
- **Backend principal:** Supabase, com PostgreSQL, Auth, RLS, Storage e Edge Functions.
- **Backend Node separado:** não no MVP.
- **Funções de servidor:** Route Handlers do Next.js quando forem necessários; Edge Functions do Supabase para webhooks e integrações externas.
- **Hospedagem do sistema:** Hostinger Node.js Web App conectado ao GitHub, se disponível no plano atual; Vercel como fallback técnico.
- **Hospedagem das páginas estáticas atuais:** Hostinger via FTP.

## Decisão

O CRM real não será uma continuação destrutiva do HTML estático publicado. O HTML atual é o protótipo visual e funcional inicial e permanecerá como rollback até a nova aplicação ser validada. A aplicação operacional será criada em uma área própria Next.js, mantendo landing, identidade visual e brandbook isolados.

O subdomínio `crm.ulizarzana.com` receberá uma aplicação Node.js separada. A raiz `ulizarzana.com` continuará servindo as páginas estáticas existentes. A Hostinger será o primeiro destino porque mantém a operação do domínio no mesmo provedor e oferece integração GitHub para Node.js Web Apps nos planos compatíveis; Vercel será usada somente se o plano atual não disponibilizar essa capacidade.

O Supabase será a fonte de verdade do negócio. As regras do funil não ficarão apenas no navegador: transições, auditoria, perfis e permissões serão verificadas no servidor/banco. O frontend consumirá dados com RLS; segredos ficarão em ambiente servidor.

## Fases

1. Aplicação Next.js e componentes visuais.
2. Schema Supabase e migrations.
3. Auth e RLS.
4. CRM real com Visão Geral como tela inicial.
5. Entrada real de leads pela landing page.
6. Webhooks e integrações externas.

O sistema de membros continuará em Hotmart, Kiwify ou Hubla. Não será recriado dentro do CRM nesta fase.
