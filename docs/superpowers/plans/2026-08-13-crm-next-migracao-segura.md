# CRM Next.js e Migração Segura Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task with verification checkpoints.

**Goal:** Criar a aplicação real do CRM em Next.js, sem substituir as páginas estáticas existentes, e preparar a migração automática do subdomínio `crm.ulizarzana.com`.

**Architecture:** O site institucional e as páginas de identidade permanecem em `web/` e na raiz da Hostinger. O CRM operacional será um projeto Next.js independente em `apps/crm-next/`, com dados locais tipados inicialmente e Supabase conectado em uma etapa posterior. O subdomínio só será trocado depois de o novo runtime responder e o rollback estar preservado.

**Tech Stack:** Next.js App Router, React, TypeScript strict, CSS Modules/tokens A1/B1/T1, Zod, Vitest, Testing Library, Playwright, Supabase, Hostinger Node.js Web App + GitHub se disponível, Vercel como fallback.

## Global Constraints

- Não excluir, mover ou sobrescrever `web/index.html`, `web/identidade-visual/`, `web/brandbook/` ou o protótipo estático atual antes da validação pública do novo app.
- O CRM utilizará a Visão Geral como tela inicial e os cinco estados: Novo, Qualificando, Oferta, Ganho e Perdido.
- Nenhum dado real, credencial, chave Supabase ou segredo poderá entrar no repositório ou no cofre.
- O selo institucional permanece fora do escopo do CRM.
- A raiz `ulizarzana.com` continua estática; somente `crm.ulizarzana.com` será migrado.
- Cada mudança de código deve passar por validação local, commit/push na `main`, publicação correspondente e verificação pública.

---

### Task 1: Scaffold Next.js isolado

**Files:**
- Create: `apps/crm-next/package.json`
- Create: `apps/crm-next/tsconfig.json`
- Create: `apps/crm-next/next.config.ts`
- Create: `apps/crm-next/app/layout.tsx`
- Create: `apps/crm-next/app/page.tsx`
- Create: `apps/crm-next/app/globals.css`
- Modify: `.gitignore` only for generated `apps/crm-next/.next/`, `apps/crm-next/node_modules/`, `.env*`

**Interfaces:**
- Produces a runnable Next.js app at `apps/crm-next` with `npm run dev`, `npm run build` and `npm run start`.
- Does not import from `web/crm`; it will reuse approved visual token values through a local CSS token file to keep the applications independently deployable.

- [ ] Write a failing smoke test in `tests/crm-next-scaffold.test.mjs` that asserts the package scripts, App Router files and no secrets.
- [ ] Run `node --test tests/crm-next-scaffold.test.mjs` and verify it fails because `apps/crm-next` does not exist.
- [ ] Create the package with Next 16.x, React 19.x, TypeScript 5.x and strict mode.
- [ ] Implement a minimal branded page with title, accessible heading and a “Protótipo local” badge.
- [ ] Run the smoke test and `npm install`/`npm run build` inside `apps/crm-next`.
- [ ] Commit only scaffold files and the test with `git commit -m "feat: criar scaffold next do crm"`.

### Task 2: Casca visual e Visão Geral

**Files:**
- Create: `apps/crm-next/app/(crm)/layout.tsx`
- Create: `apps/crm-next/app/(crm)/page.tsx`
- Create: `apps/crm-next/components/crm-shell.tsx`
- Create: `apps/crm-next/components/metric-card.tsx`
- Create: `apps/crm-next/components/pipeline-summary.tsx`
- Create: `apps/crm-next/lib/demo-data.ts`
- Modify: `apps/crm-next/app/globals.css`
- Test: `tests/crm-next-overview.test.mjs`

**Interfaces:**
- `DemoLead`, `DemoTask` and `TodayMetrics` types are exported from `lib/demo-data.ts`.
- `getTodayMetrics(leads, tasks, now)` is pure and returns the six indicators definidos no cofre.
- `CrmShell` renders sidebar/topbar without real authentication.

- [ ] Write tests for the six indicators, the initial Visão Geral and the five state labels.
- [ ] Run tests and verify failure before implementation.
- [ ] Implement the shell with CSS Modules/tokens and responsive drawer behavior.
- [ ] Implement the Visão Geral using only fictional data and explicit prototype labeling.
- [ ] Run tests, `npm run build` and a local browser smoke check at desktop and mobile widths.
- [ ] Commit with `feat: implementar visao geral do crm next`.

### Task 3: Domínio tipado do CRM

**Files:**
- Create: `apps/crm-next/lib/domain/funnel.ts`
- Create: `apps/crm-next/lib/domain/leads.ts`
- Create: `apps/crm-next/lib/domain/types.ts`
- Create: `tests/crm-next-domain.test.mjs`

**Interfaces:**
- `LeadState = 'novo' | 'qualificando' | 'oferta' | 'ganho' | 'perdido'`.
- `nextStateFromEvent(current, event)` preserves the deterministic transition rules.
- `filterLeads(leads, filters)` is pure and does not mutate input.

- [ ] Write failing tests for valid/invalid interactions, offer, conversion, loss and filters.
- [ ] Implement the domain functions without UI or network dependencies.
- [ ] Run tests and TypeScript check.
- [ ] Commit with `feat: tipar dominio comercial do crm`.

### Task 4: Fundação Supabase sem dados reais

**Files:**
- Create: `apps/crm-next/lib/supabase/browser.ts`
- Create: `apps/crm-next/lib/supabase/server.ts`
- Create: `supabase/migrations/202608130001_initial_crm.sql`
- Create: `supabase/seed.example.sql`
- Create: `apps/crm-next/.env.example`
- Create: `tests/supabase-schema.test.mjs`

**Interfaces:**
- Schema contains profiles, leads, interactions, offers, tasks, funnel_events and community_conversions.
- RLS separates authenticated Administradora and Comercial according to the cofre.
- `.env.example` contains variable names only; no values.

- [ ] Write schema contract tests that inspect table names, states, RLS and append-only event policy.
- [ ] Implement SQL migrations and policies.
- [ ] Implement browser/server Supabase clients without service-role exposure.
- [ ] Run contract tests and SQL static validation.
- [ ] Commit with `feat: adicionar fundacao supabase do crm`.

### Task 5: Deploy automático e migração do subdomínio

**Files/configuration:**
- Modify: `apps/crm-next/package.json` with production scripts.
- Create/modify: `apps/crm-next/README.md` with deploy settings and rollback.
- External: Hostinger Node.js Web App or Vercel project, DNS only for `crm.ulizarzana.com`.

**Interfaces:**
- Build command: `npm run build`.
- Start command: `npm run start`.
- Node: 22.x, matching the current local runtime and Hostinger support.
- Root static pages remain untouched.

- [ ] Confirm authenticated hPanel access and plan capability for Node.js Web Apps/GitHub.
- [ ] Create the application as a separate service for `crm.ulizarzana.com`.
- [ ] Connect GitHub `main`, set build/start commands and environment variables only after the app exists.
- [ ] Deploy to temporary URL and verify HTML, assets, routes, no console errors and responsive behavior.
- [ ] Point only the CRM subdomain to the new service.
- [ ] Verify `https://crm.ulizarzana.com/`, `https://ulizarzana.com/`, `/identidade-visual/` and `/brandbook/`.
- [ ] Preserve the old static CRM artifact until production verification completes; then archive it in Git and remove only the public duplicate if necessary.
- [ ] Update the cofre with deployment evidence, commit/push and public checks.

## Verification matrix

- `node --test tests/crm-next-scaffold.test.mjs tests/crm-next-overview.test.mjs tests/crm-next-domain.test.mjs tests/supabase-schema.test.mjs`
- `npm run build` in `apps/crm-next`
- Existing static validators in `tests/validate-*.ps1`
- Public HTTP 200 and browser checks for CRM, root, identity and brandbook.

## Rollback

If the Next.js service fails, restore the DNS/hosting target of `crm.ulizarzana.com` to the previous static service. Never delete the root site or the GitHub source. The old static CRM is retained until the new production service has passed all checks.
