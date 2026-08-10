# Publicar Identidade Visual e Brandbook Preliminar — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Execute this plan inline with validation checkpoints.

**Goal:** Criar e publicar uma apresentação web estática da direção visual aprovada em áreas isoladas da hospedagem Hostinger.

**Architecture:** O diretório local `web/` conterá dois artefatos independentes: uma apresentação visual em `identidade-visual/` e um brandbook preliminar em `brandbook/`. Ambos serão HTML/CSS estáticos, sem banco de dados, sem credenciais e sem documentos privados. O upload será feito somente nas pastas FTP já criadas.

**Tech Stack:** HTML5, CSS3, imagens JPEG locais, FTP passivo na porta 21, validação por servidor HTTP local e requisição HTTP pública.

## Global Constraints

- Publicar somente conteúdo da direção visual preliminar aprovada: A1 + T1 + M2 + F1.
- Não publicar o cofre, planilhas, PDFs internos, contratos, CNPJ ou arquivos `.superpowers`.
- Marcar o monograma UZ como conceito em desenvolvimento, não como logotipo final.
- Não sobrescrever arquivos fora de `/identidade-visual/` e `/brandbook/`.
- Separar validação local, upload FTP e verificação pública.

### Task 1: Criar os artefatos estáticos

**Files:**
- Create: `web/identidade-visual/index.html`
- Create: `web/brandbook/index.html`
- Create: `web/assets/uli-profile-reference.jpeg`

- [ ] Construir a página de apresentação com posicionamento, síntese A1/T1/M2/F1, paleta, tipografia, fotografia e aplicações.
- [ ] Construir o brandbook preliminar com status, decisões aprovadas, limites e próximos itens.
- [ ] Copiar apenas a fotografia executiva autorizada como referência para o pacote público.

### Task 2: Validar o pacote local

**Files:**
- Verify: `web/identidade-visual/index.html`
- Verify: `web/brandbook/index.html`

- [ ] Confirmar que os dois HTMLs existem, que as imagens carregam e que nenhum arquivo privado está dentro de `web/`.
- [ ] Servir localmente por HTTP e verificar títulos, headings e links internos.
- [ ] Confirmar ausência de placeholders `TBD` e `TODO`.

### Task 3: Publicar por FTP

**Files:**
- Upload: `/identidade-visual/index.html`
- Upload: `/brandbook/index.html`
- Upload: `/identidade-visual/uli-profile-reference.jpeg`

- [ ] Fazer upload somente desses arquivos para as pastas remotas correspondentes.
- [ ] Confirmar listagem remota após o upload.

### Task 4: Verificar publicação pública

- [ ] Verificar `https://ulizarzana.com/identidade-visual/`.
- [ ] Verificar `https://ulizarzana.com/brandbook/`.
- [ ] Confirmar carregamento da imagem, HTTPS, status HTTP e ausência de exposição de arquivos privados.
- [ ] Confirmar que a raiz do domínio não foi alterada.
