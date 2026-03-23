# Local Setup

This repo is configured for a local workflow focused on health economics, aging, and healthcare utilization.

## What is already configured

- `config/custom.yaml`
  - `arxiv`: `econ.EM`, `econ.GN`, `q-fin.EC`, `stat.AP`
  - `medrxiv`: health economics / health policy / health systems / geriatrics / epidemiology / public health / primary care
  - output language: Chinese
  - reranker: local
  - max papers: 10

- `run_local.sh`
  - sources `../arXiv_recbot/.env` first if present
  - then overrides with `./.env.local` if present
  - runs the upstream entrypoint with `uv`

## What you still need to fill

Copy `.env.local.example` to `.env.local` and fill:

- `ZOTERO_ID`
- `ZOTERO_KEY`
- `SENDER`
- `RECEIVER`
- `SMTP_SERVER`
- `SMTP_PORT`
- `SENDER_PASSWORD`

`OPENAI_API_KEY` is optional here if you already keep it in `../arXiv_recbot/.env`.

## Run locally

```bash
cd /Users/linting/Documents/Playground/zotero-arxiv-daily
chmod +x run_local.sh
./run_local.sh
```

## Move to GitHub Actions later

If you want to deploy this repo the way the upstream author intended:

1. Fork the repo to your GitHub account.
2. Add the same secrets there:
   - `ZOTERO_ID`
   - `ZOTERO_KEY`
   - `SENDER`
   - `RECEIVER`
   - `SMTP_SERVER`
   - `SMTP_PORT`
   - `SENDER_PASSWORD`
   - `OPENAI_API_KEY`
   - `OPENAI_API_BASE`
3. Set the repository variable `CUSTOM_CONFIG` to the contents of `config/custom.yaml`.
