#!/bin/bash
# ============================================================
# Script de setup — sergingroisman.github.io
# Execute este arquivo UMA VEZ no seu terminal
# ============================================================

TOKEN=""
USUARIO="sergingroisman"
REPO="sergingroisman.github.io"

echo "🚀 Criando repositório $REPO no GitHub..."

# Cria o repositório público
curl -s -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO\",\"description\":\"Blog e portfólio pessoal — Sérgio Santos\",\"homepage\":\"https://$USUARIO.github.io\",\"private\":false,\"auto_init\":false}" \
  | grep -E '"full_name"|"html_url"|"message"'

echo ""
echo "⚙️  Configurando git..."
git config user.name "Sérgio Santos"
git config user.email "serjota@proton.me"

echo ""
echo "📦 Inicializando repositório local..."
git init
git add .
git commit -m "feat: setup inicial Hexo + Butterfly

Blog e portfólio pessoal com tema Butterfly.
Deploy automático via GitHub Actions."

echo ""
echo "🔗 Conectando ao GitHub e enviando..."
git remote add origin https://$TOKEN@github.com/$USUARIO/$REPO.git
git branch -M main
git push -u origin main

echo ""
echo "✅ Pronto! Agora:"
echo "   1. Vá em https://github.com/$USUARIO/$REPO/settings/pages"
echo "   2. Em 'Source', selecione 'Deploy from a branch'"
echo "   3. Branch: gh-pages / Folder: / (root)"
echo "   4. Clique em Save"
echo ""
echo "   Em ~2 minutos o site estará em:"
echo "   👉 https://$USUARIO.github.io"
echo ""
echo "⚠️  IMPORTANTE: Revogue o token em:"
echo "   https://github.com/settings/tokens"
