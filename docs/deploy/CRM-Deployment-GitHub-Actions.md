---
title: Publicação automática do CRM estático
date: 2026-08-13
tags:
  - uli
  - crm
  - deploy
  - github-actions
---

# Publicação automática do CRM estático

## Decisão

O CRM operacional agora é publicado como Web App Node.js no subdomínio `crm.ulizarzana.com`, conectado ao GitHub e ao diretório raiz `apps/crm-next`. O workflow `deploy-crm-static.yml` permanece no repositório como fallback/arquivo de rollback e sincroniza somente `web/crm/`; ele não é o runtime atual do subdomínio.

O domínio raiz e as páginas de identidade visual, brandbook e landing page não fazem parte desse workflow.

## Secrets necessários no GitHub

Configurar no repositório `leoferrazbrasil/uli-zarzana`, em **Settings → Secrets and variables → Actions**, sem colocar valores em arquivos versionados:

- `CRM_FTP_SERVER`
- `CRM_FTP_USERNAME`
- `CRM_FTP_PASSWORD`

O workflow utiliza FTP na porta 21, conforme os dados operacionais da hospedagem. O primeiro deploy pode ser executado por `workflow_dispatch`; depois, qualquer push na `main` que altere `web/crm/` inicia a publicação.

## Migração futura para Next.js

O aplicativo Next.js está em `apps/crm-next/`, isolado do site institucional. A migração foi validada localmente com build/testes e no hPanel com deployment concluído, Node 22, Next.js e implantação automática via GitHub. O `web/crm/` permanece preservado para rollback/recriação de uma instalação estática caso seja necessário.

## Estado atual — 13/08/2026

- Hostinger Node.js Web App criado para `crm.ulizarzana.com` a partir de `leoferrazbrasil/uli-zarzana`, branch `main`, diretório raiz `apps/crm-next`.
- Compatibilidade do build corrigida com `next.config.mjs` e `next build --webpack`; commits técnicos: `24fc104` e `5bb4dd2`.
- O app usa `server.mjs` como comando de inicialização (`node server.mjs`) e respeita `process.env.PORT`, requisito do runtime da hospedagem.
- A instalação anterior PHP/HTML do subdomínio foi removida somente depois da validação do novo deployment. A raiz `ulizarzana.com`, `/identidade-visual/` e `/brandbook/` não foram alterados.
- O deployment final aparece como `Concluído` e o hPanel mostra o app `Em execução`/`Implantação automática`. A verificação pública do subdomínio deve ser repetida após a reinicialização/propagação do processo Node.
