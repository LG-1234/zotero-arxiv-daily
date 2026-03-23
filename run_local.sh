#!/bin/zsh
set -euo pipefail

cd "$(dirname "$0")"

set -a
if [[ -f ../arXiv_recbot/.env ]]; then
  source ../arXiv_recbot/.env
fi
if [[ -f ./.env.local ]]; then
  source ./.env.local
fi
set +a

uv run src/zotero_arxiv_daily/main.py "$@"
