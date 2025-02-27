#!/bin/bash

echo "📌 Verificando Node.js..."
if ! command -v nvm &> /dev/null; then
  echo "⚡ Instalando NVM..."
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
  echo "✅ NVM ya está instalado."
fi

echo "📌 Verificando Node.js 23.5.0..."
if ! nvm list | grep -q "v23.5.0"; then
  echo "⚡ Instalando Node.js 23.5.0..."
  nvm install 23.5.0
else
  echo "✅ Node.js 23.5.0 ya está instalado."
fi

echo "📌 Verificando Serverless Framework..."
if ! command -v serverless &> /dev/null; then
  echo "⚡ Instalando Serverless Framework..."
  npm install -g serverless@4.7.0
else
  echo "✅ Serverless ya está instalado."
fi

echo "📌 Instalando plugins de Serverless si faltan..."
npm list serverless-python-requirements &> /dev/null || npm install --save-dev serverless-python-requirements
npm list serverless-offline &> /dev/null || npm install --save-dev serverless-offline
npm list serverless-dotenv-plugin &> /dev/null || npm install --save-dev serverless-dotenv-plugin --legacy-peer-deps

echo "✅ Instalación finalizada. Ejecuta 'serverless -v' para verificar."