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

Enquanto a hospedagem não disponibilizar uma vaga de Web App Node.js para o projeto, o CRM continuará sendo publicado como site estático no subdomínio `crm.ulizarzana.com`. O workflow `deploy-crm-static.yml` sincroniza somente `web/crm/` para o diretório remoto `crm/`.

O domínio raiz e as páginas de identidade visual, brandbook e landing page não fazem parte desse workflow.

## Secrets necessários no GitHub

Configurar no repositório `leoferrazbrasil/uli-zarzana`, em **Settings → Secrets and variables → Actions**, sem colocar valores em arquivos versionados:

- `CRM_FTP_SERVER`
- `CRM_FTP_USERNAME`
- `CRM_FTP_PASSWORD`

O workflow utiliza FTP na porta 21, conforme os dados operacionais da hospedagem. O primeiro deploy pode ser executado por `workflow_dispatch`; depois, qualquer push na `main` que altere `web/crm/` inicia a publicação.

## Migração futura para Next.js

O aplicativo Next.js permanece em `apps/crm-next/`, isolado do site público. A migração para Web App Node.js deverá ocorrer somente quando houver capacidade disponível na hospedagem ou quando uma infraestrutura compatível for contratada. Antes da troca do subdomínio, o novo app deve passar por build, teste, deploy de prévia e verificação pública; o CRM estático permanece como fallback até essa validação.
