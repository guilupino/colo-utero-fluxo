#!/usr/bin/env bash
# Gera o index.html publicado a partir do PDF em fonte/.
# Uso: ./build.sh
set -euo pipefail
cd "$(dirname "$0")"
echo "== 1/2 extraindo recomendacoes do PDF"
python3 build/extrair.py "$@"
echo
echo "== 2/2 montando o index.html"
python3 build/montar.py
