---
title: Próximo Avanço Determinístico - Fundação de Dados do CRM
date: 2026-08-13
status: determinado
tipo: roadmap
tags:
  - uli-zarzana
  - crm
  - supabase
  - mvp
  - arquitetura
aliases:
  - Fundação de Dados do CRM Uli Zarzana
---

# Próximo avanço determinístico — fundação de dados do CRM

> [!success] Conclusão determinada
> O próximo avanço do projeto é criar o schema inicial e as migrations do Supabase, incluindo as políticas de acesso RLS. O CRM já possui runtime Node.js/Next.js publicado, mas ainda opera com dados fictícios; desenvolver novas telas antes da fonte de verdade geraria retrabalho.

## Evidências utilizadas

- O Web App Node.js/Next.js está publicado em `crm.ulizarzana.com` e conectado ao GitHub.
- A Visão Geral atual usa `apps/crm-next/lib/demo-data.mjs`.
- Não existe ainda diretório de migrations, schema Supabase, cliente Supabase configurado, Auth ou RLS no aplicativo.
- A arquitetura aprovada determina Next.js + TypeScript + Supabase, sem backend Express separado.
- O MVP exige os perfis Administradora e Comercial, além dos estados `Novo`, `Qualificando`, `Oferta`, `Ganho` e `Perdido`.

## Escopo do próximo avanço

1. Definir as tabelas e enums mínimos: `profiles`, `leads`, `interactions`, `offers`, `tasks`, `funnel_events` e `community_conversions`.
2. Criar migrations SQL versionadas e reproduzíveis.
3. Definir chaves, índices, timestamps, auditoria e relacionamentos.
4. Criar RLS determinístico para Administradora e Comercial.
5. Configurar apenas os contratos de ambiente (`.env.example`), sem registrar credenciais.
6. Validar as migrations e as políticas localmente antes de substituir os dados fictícios da Visão Geral.

## Sequência posterior

Após a fundação de dados validada, a ordem será: Auth, cadastro real de leads, substituição da Visão Geral por consultas reais, Pipeline, detalhe do lead, tarefas e ofertas. Integrações com WhatsApp, Instagram e checkout permanecem posteriores aos contratos básicos de persistência e segurança.

## Estado de publicação

Esta decisão altera somente o roadmap e o cofre. Não requer FTP nem novo deployment. O código publicado permanece inalterado até a implementação do schema e da integração correspondente.
