# GitHub Actions Setup

This repo is already adjusted for GitHub Actions deployment on your fork.

## What was changed

- `.github/workflows/main.yml`
  - checkout now falls back to the current fork if `REPOSITORY` / `REF` are not set
  - `SMTP_SERVER` and `SMTP_PORT` are passed through as secrets

- `.github/workflows/test.yml`
  - same fallback checkout logic
  - same SMTP secret support

- `config/custom.yaml`
  - preconfigured for health economics / aging / utilization adjacent sources
  - can be pasted directly into the `CUSTOM_CONFIG` repository variable

## Secrets to add

Add these in:

`GitHub repo -> Settings -> Secrets and variables -> Actions -> Secrets`

- `ZOTERO_ID`
- `ZOTERO_KEY`
- `SENDER`
- `RECEIVER`
- `SMTP_SERVER`
- `SMTP_PORT`
- `SENDER_PASSWORD`
- `OPENAI_API_KEY`
- `OPENAI_API_BASE`

For OpenRouter + Claude:

- `OPENAI_API_BASE`: `https://openrouter.ai/api/v1`
- `OPENAI_API_KEY`: your OpenRouter API key

## Repository variables to add

Add this in:

`GitHub repo -> Settings -> Secrets and variables -> Actions -> Variables`

- `CUSTOM_CONFIG`

Paste the contents of `config/custom.yaml` as the value of `CUSTOM_CONFIG`.

Optional:

- `REPOSITORY`
- `REF`

You can leave both unset on your own fork because the workflow now falls back to the current repository and branch.

## Trigger

After secrets and variables are filled:

1. Open `Actions`
2. Run `Test`
3. Check the logs
4. Then enable the scheduled `Send emails daily`

## Current schedule

The main workflow still runs at:

- `22:00 UTC`

If you want a different schedule, edit:

- `.github/workflows/main.yml`
