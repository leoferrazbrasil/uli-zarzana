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

## Configuração de ambiente — 13/08/2026

- Variável pública `NEXT_PUBLIC_SUPABASE_URL` configurada no Web App Node.js da Hostinger.
- Valor configurado: Project URL `https://pzschinocxlpuwrrmukr.supabase.co`.
- A alteração foi aplicada e o redeploy automático terminou como `Concluído`.
- Verificação pública: `https://crm.ulizarzana.com/` respondeu HTTP 200; a raiz `https://ulizarzana.com/` também respondeu HTTP 200.
- A chave `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` ainda não foi configurada porque não foi fornecida. Nenhuma chave privada ou credencial foi registrada no cofre.

## Chave pública configurada — 13/08/2026

- A chave publishable pública foi obtida no painel autenticado do projeto Supabase `uli-zarzana` sem ser exposta na conversa ou registrada em arquivos.
- Variável configurada no Web App Node.js da Hostinger: `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`.
- As duas variáveis públicas necessárias agora estão persistidas: `NEXT_PUBLIC_SUPABASE_URL` e `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`.
- O redeploy automático terminou como `Concluído`.
- Verificação pública final: `https://crm.ulizarzana.com/` respondeu HTTP 200 com o título `CRM Uli Zarzana`; `https://ulizarzana.com/` também respondeu HTTP 200.
- Nenhuma `service_role`, senha de banco ou outra credencial privada foi utilizada ou registrada.

## Migration inicial aplicada — 13/08/2026

> [!success] Conclusão determinada
> A fundação de dados mínima do CRM foi criada como migration versionada e aplicada no projeto Supabase autenticado `uli-zarzana`. A fonte de verdade do schema agora está no repositório; a Visão Geral ainda permanece demonstrativa até a etapa de Auth e consultas reais.

### Entrega técnica

- Migration: `supabase/migrations/202608130001_initial_crm.sql`.
- Seed seguro de referência: `supabase/seed.example.sql`, sem usuários, leads ou credenciais.
- Entidades criadas: `profiles`, `leads`, `interactions`, `offers`, `tasks`, `funnel_events` e `community_conversions`.
- Estados do funil: `Novo`, `Qualificando`, `Oferta`, `Ganho` e `Perdido`.
- Perfis operacionais: `Administradora` e `Comercial`; o Lead continua sem acesso ao sistema no MVP.
- RLS habilitado e verificado nas sete tabelas. Eventos de funil são append-only na primeira versão.
- A exigência de modal/motivo obrigatório para `Perdido` permanece no roadmap futuro, conforme decisão anterior.

### Validação e publicação

- Teste estrutural local: `tests/supabase-schema.test.mjs` — 5/5 testes aprovados.
- Aplicação remota: SQL Editor do projeto Supabase correto retornou `Success. No rows returned.`.
- Verificação remota: consulta do catálogo confirmou as sete tabelas com `rls_enabled = true`.
- Nenhum dado real foi inserido. O arquivo local não versionado `supabase/data-base.txt` foi preservado, não foi lido, usado ou incluído no commit.
- Como esta entrega altera apenas o schema remoto e artefatos de migration, não houve upload FTP de HTML/CSS. O commit na `main` poderá acionar o redeploy automático do Web App, que será verificado separadamente.

### Próximo avanço determinístico

Configurar Auth para os perfis Administradora/Comercial e substituir progressivamente os dados fictícios da Visão Geral por consultas protegidas ao Supabase. Integrações de WhatsApp, Instagram e checkout continuam posteriores aos contratos básicos.

## Auth e Visão Geral real — 14/08/2026

> [!success] Conclusão determinada
> O CRM passou a usar Supabase Auth e dados reais protegidos por sessão. A rota `/` não expõe mais dados fictícios nem é pré-renderizada como página estática; ela consulta o perfil operacional e as métricas das tabelas do CRM.

### Implementação

- Login por e-mail e senha em `apps/crm-next/app/login/page.tsx`.
- Cliente browser e cliente server Supabase em `apps/crm-next/lib/supabase/`.
- Middleware protege todas as rotas operacionais e redireciona visitantes sem sessão para `/login`.
- Apenas perfis `administradora` e `comercial` conseguem consultar a operação pela RLS já aplicada.
- Botão de encerramento de sessão incluído na Visão Geral.
- Indicadores reais consultam `leads`, `offers`, `funnel_events` e `tasks`.
- Pipeline usa os cinco estados reais: Novo, Qualificando, Oferta, Ganho e Perdido.
- Ausência de perfil Auth correspondente gera estado seguro de “Perfil operacional pendente”; nenhum usuário fictício foi criado.

### Validação

- Testes de Auth, proteção e consultas: `tests/crm-next-auth-overview.test.mjs` — 4/4 aprovados.
- Regressão do CRM: testes existentes — 5/5 aprovados.
- Total validado nesta etapa: 9/9 testes aprovados.
- `npm run build` em `apps/crm-next`: concluído com TypeScript válido.
- A rota `/` foi marcada como `force-dynamic`, confirmando renderização sob demanda.
- Dependências `@supabase/ssr` e `@supabase/supabase-js` adicionadas ao app e ao lockfile.

### Publicação verificada

- Commit publicado: `8bfca3f` — `feat: conectar auth e visao geral ao supabase`.
- Redeploy automático do Web App Hostinger: `Concluído` e marcado como atual.
- `https://crm.ulizarzana.com/`: visitante sem sessão redirecionado para `/login`.
- `https://crm.ulizarzana.com/login`: formulário de autenticação publicado.
- `https://ulizarzana.com/`, `/identidade-visual/` e `/brandbook/`: HTTP 200, sem alteração.
- Não houve FTP: o CRM é o Web App Node.js conectado ao GitHub; a publicação ocorreu pelo redeploy automático.

### Limite operacional

As contas Auth Administradora/Comercial não foram criadas porque não existem e-mails operacionais autorizados nesta base de conhecimento. A criação deve ocorrer quando os e-mails reais forem fornecidos no painel Supabase; a aplicação já está preparada para associar cada usuário ao registro correspondente em `profiles`.

### Próximo avanço determinístico

Criar as duas contas operacionais reais no Supabase Auth, associá-las aos perfis `administradora` e `comercial` e validar o primeiro login. Em seguida, cadastrar o primeiro lead real pelo CRM; integrações de entrada por landing page, WhatsApp e Instagram permanecem posteriores.
