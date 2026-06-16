---
title: "Odysseus Chat"
source: "http://localhost:7000/"
author:
published:
created: 2026-06-16
description:
tags:
  - "clippings"
---
#### ⚙Settings

Toggle on/off visibility of tools and modules across the interface.

Admin

## Web Search

Search API used for web search and deep research.

⋮⋮ DuckDuckGo

Self-hosted SearXNG instance. Leave URL empty to use the SEARXNG\_INSTANCE env var.

Active: SearXNG · 5 results

## Keyboard Shortcuts

Click a shortcut to rebind. Press Escape to cancel.

## Account

V

va

Admin

## Change Password

## Two-Factor Authentication

Add an extra layer of security with an authenticator app (Aegis, Google Authenticator, etc.)

## Email Accounts

Add, edit, delete, and test accounts in Integrations.

## Email Tasks

Manage email background tasks in Tasks.

## Writing Style

AI-extracted from your sent emails. Used when AI drafts replies.

## How you're reminded

Controls how fired note reminders are delivered.

Reminders appear as browser notifications inside Odysseus.

Configure email account, ntfy server, etc. in [Integrations](#).

## AI Synthesis

When on, the utility model writes a short, warm one-line reminder for browser, email, ntfy, AND webhook reminders instead of just the raw note content.

## Public App URL

Used to build clickable links back to Odysseus inside outgoing reminder / urgent-email emails (e.g. `https://chat.yourdomain.com`). Leave blank to omit links.

## Test

Fire a test reminder using your current settings to verify everything works.

## Add Models (Endpoints)

Connect local models first, or add a cloud API.

Local

API

## Added Models (Endpoints)

Manage the endpoints you've added.

Local

None

API

None

## Integrations

All external service connections in one place.

No integrations configured

## API Tokens

Bearer tokens for external integrations (scripts, Codex, headless agent runs). Token value shown ONCE on create — copy it then.

No API tokens

Copy now — this is the only time you'll see it:

## Agent

Controls for the agent tool loop.

Unlimited tool calls · 20 steps/message

## Agent loop

Supervisor ladder. When on, every effectful agent turn that claims done is verified; on FAIL the ladder escalates verify → different method → teacher → stop-with-blocker, each rung visible in chat. Teacher rung requires `teacher_model` to be set.

## Built-in Tools

Enable or disable tools available to the AI agent.

Code 4/4

Shell Execute bash commands

~200

Python Run Python scripts

~200

Read File Read files from disk

~150

Write File Write/create files

~150

Search 2/2

Search Chats Search conversation history

~150

Web Search Search the web via SearXNG

~300

Documents 5/5

Create Document Create new documents

~200

Edit Document Find & replace in documents

~200

Manage Documents List, delete, organize docs

~150

Suggest Changes Propose document edits

~200

Update Document Modify existing documents

~200

Media 1/1

Generate Image Create images via AI

~150

Knowledge 2/2

Memory Save and recall memories

~200

Skills Learn and use procedures

~200

Multi-Agent 3/3

Ask Teacher Query a more capable model

~150

Chat with Model Talk to another AI model

~200

Pipeline Multi-step AI workflows

~200

Sessions 4/4

Create Session Start a new chat session

~100

List Sessions Browse existing sessions

~100

Manage Session Rename, archive, configure

~100

Send to Session Send message to another chat

~100

System 9/9

API Call Make HTTP requests

~200

List Models Show available models

~100

Endpoints Add/remove model endpoints

~100

MCP Servers Manage MCP connections

~100

Settings Change app settings

~100

Tasks Schedule automated tasks

~150

API Tokens Manage API access tokens

~100

Webhooks Configure webhook events

~100

UI Control Change theme, layout, settings

~150

Other 37/37

adopt\_served\_model

?

app\_api

?

archive\_email

?

ask\_user

?

bulk\_email

?

cancel\_download

?

delete\_email

?

download\_model

?

edit\_file

?

edit\_image

?

get\_workspace

?

glob

?

grep

?

list\_cached\_models

?

list\_cookbook\_servers

?

list\_downloads

?

list\_email\_accounts

?

list\_emails

?

list\_serve\_presets

?

list\_served\_models

?

ls

?

manage\_calendar

?

manage\_contact

?

manage\_notes

?

manage\_research

?

mark\_email\_read

?

read\_email

?

reply\_to\_email

?

resolve\_contact

?

search\_hf\_models

?

send\_email

?

serve\_model

?

serve\_preset

?

stop\_served\_model

?

trigger\_research

?

update\_plan

?

web\_fetch

?

## Terminal Logs

Live diagnostic logs and system output from the Odysseus process.

Auto-poll

2026-06-15 16:59:11,949 - core.auth - INFO - Auth config loaded

2026-06-15 16:59:11,951 - app - INFO - Auth middleware enabled (AUTH\_ENABLED=true)

2026-06-15 16:59:17,774 - services.youtube.youtube\_handler - INFO - YouTube transcript API available

2026-06-15 16:59:26,490 - src.rag\_vector - ERROR - VectorRAG init failed: ChromaDB is not reachable at localhost:8100. Start the ChromaDB service (e.g. \`docker compose up chromadb\`) or set CHROMADB\_HOST / CHROMADB\_PORT to point at a running instance.

2026-06-15 16:59:26,492 - src.rag\_singleton - WARNING - VectorRAG created but not healthy, will retry later

2026-06-15 16:59:26,493 - app - INFO - Vector document RAG not available at startup (ChromaDB may not be reachable yet — routes will retry lazily)

2026-06-15 16:59:27,036 - core.session\_manager - INFO - Loaded 0 session(s) (metadata only)

2026-06-15 16:59:27,039 - src.upload\_handler - WARNING - python-magic not available, falling back to basic detection

2026-06-15 16:59:27,041 - src.personal\_docs - INFO - Refreshed index: 0 documents from 1 directories

2026-06-15 16:59:31,083 - src.memory\_vector - ERROR - MemoryVectorStore init failed: ChromaDB is not reachable at localhost:8100. Start the ChromaDB service (e.g. \`docker compose up chromadb\`) or set CHROMADB\_HOST / CHROMADB\_PORT to point at a running instance.

2026-06-15 16:59:31,084 - src.app\_initializer - WARNING - MemoryVectorStore DEGRADED: ChromaDB vector memory unavailable

2026-06-15 16:59:31,089 - src.research\_handler - INFO - Legacy research\_engine.py not found — DeepResearcher only

2026-06-15 16:59:31,168 - app - INFO - TTS service initialized (provider managed via admin settings)

2026-06-15 16:59:33,700 - app - INFO - STT service initialized (provider managed via settings)

2026-06-15 16:59:34,710 - app - INFO - MCP routes initialized

2026-06-15 16:59:34,781 - app - INFO - AI interaction tools initialized (session, memory, RAG, UI control)

2026-06-15 16:59:34,848 - app - INFO - Webhook & API token routes initialized

2026-06-15 16:59:35,717 - app - INFO - Application starting up...

2026-06-15 16:59:35,741 - src.bg\_monitor - INFO - Background-job monitor started (poll 5s)

2026-06-15 16:59:35,792 - src.task\_scheduler - INFO - Housekeeping defaults for va: seeded=\['tidy\_sessions', 'tidy\_documents', 'consolidate\_memory', 'tidy\_research', 'summarize\_emails', 'draft\_email\_replies', 'extract\_email\_events', 'classify\_events', 'check\_email\_urgency', 'audit\_skills'\] renamed=\[\] deduped=\[\] retired=0

2026-06-15 16:59:35,844 - src.task\_scheduler - INFO - Seeded personal assistant (crew 7745a34f-1e9f-4529-8221-956c0e54e6af) for owner=va

2026-06-15 16:59:35,862 - src.task\_scheduler - INFO - Task scheduler started (concurrency cap: 1)

2026-06-15 16:59:35,877 - app - INFO - Application startup complete

2026-06-15 16:59:35,938 - src.builtin\_mcp - INFO - NPX binary resolved to: npx.cmd

2026-06-15 16:59:35,969 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 16:59:39,976 - src.tool\_index - WARNING - ToolIndex init failed (will retry in 30.0s): ChromaDB is not reachable at localhost:8100. Start the ChromaDB service (e.g. \`docker compose up chromadb\`) or set CHROMADB\_HOST / CHROMADB\_PORT to point at a running instance.

2026-06-15 16:59:46,973 - src.builtin\_mcp - WARNING - Built-in: Browser is not available.

Reason: npm package '@playwright/mcp@latest' is not installed in the npx cache.

Impact: tools provided by this MCP server will be unavailable.

Fix: npx.cmd -y @playwright/mcp@latest --version

(run once, then restart Odysseus)

Notes: this server is optional; see README.md 'Built-in MCP servers' for details.

2026-06-15 17:00:00,216 - src.mcp\_manager - INFO - MCP server connected: Built-in: Image Generation (image\_gen) - 1 tools via stdio

2026-06-15 17:00:00,218 - src.builtin\_mcp - INFO - Built-in MCP server registered: Built-in: Image Generation

2026-06-15 17:00:00,261 - src.mcp\_manager - INFO - MCP server connected: Built-in: Email (email) - 14 tools via stdio

2026-06-15 17:00:00,261 - src.builtin\_mcp - INFO - Built-in MCP server registered: Built-in: Email

2026-06-15 17:00:00,300 - src.mcp\_manager - INFO - MCP server connected: Built-in: Memory (memory) - 1 tools via stdio

2026-06-15 17:00:00,300 - src.builtin\_mcp - INFO - Built-in MCP server registered: Built-in: Memory

2026-06-15 17:00:00,325 - src.mcp\_manager - INFO - MCP server connected: Built-in: RAG (rag) - 1 tools via stdio

2026-06-15 17:00:00,326 - src.builtin\_mcp - INFO - Built-in MCP server registered: Built-in: RAG

2026-06-15 17:00:01,499 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-15 17:00:35,974 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 17:00:57,663 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-15 17:01:57,684 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 17:02:21,193 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-15 17:03:21,225 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 17:03:41,029 - routes.cookbook\_routes - INFO - orphan sweep starting: 0 server(s), known\_sids=0

2026-06-15 17:03:44,381 - routes.email\_pollers - INFO - Started scheduled email poller

2026-06-15 17:03:44,690 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:03:44,776 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:03:48,946 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-15 17:03:50,260 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:03:50,261 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:03:54,112 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-15 17:03:54,367 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-15 17:04:42,509 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:04:42,513 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:04:46,603 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-15 17:04:54,135 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 17:05:24,498 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-15 17:06:23,726 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:06:23,741 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-15 17:06:24,531 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-15 19:05:47,882 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-15 19:05:48,312 - src.upload\_handler - INFO - Rate-limit cleanup: removed 0 IPs, 0 timestamps.

2026-06-15 21:05:48,750 - src.upload\_handler - INFO - Rate-limit cleanup: removed 0 IPs, 0 timestamps.

2026-06-16 07:53:15,700 - src.upload\_handler - INFO - Rate-limit cleanup: removed 0 IPs, 0 timestamps.

2026-06-16 07:53:15,740 - routes.skills\_routes - INFO - Scheduled skill audit skipped — No model configured — set a Default or Utility model in Settings.

2026-06-16 07:53:29,333 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 07:53:29,451 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 07:53:33,560 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 07:53:39,508 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 07:53:39,510 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 07:53:40,293 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 07:53:43,589 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:13:48,444 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-16 08:13:56,494 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:13:56,513 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:14:00,602 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:14:26,510 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 08:15:20,564 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:15:20,565 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:15:24,627 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:15:26,516 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-16 08:15:55,384 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 08:16:20,580 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:16:20,583 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:16:24,642 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:16:55,400 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-16 08:17:20,579 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:17:20,580 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:17:22,702 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 08:17:24,660 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:20:47,694 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-16 08:58:06,593 - src.upload\_handler - INFO - Rate-limit cleanup: removed 0 IPs, 0 timestamps.

2026-06-16 08:58:11,883 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:58:11,903 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:58:25,195 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:58:37,961 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 08:59:14,060 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:14,064 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:18,136 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 08:59:29,649 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:29,649 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:36,915 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:36,916 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 08:59:37,977 - src.model\_discovery - INFO - Scanning 2 hosts for models: \['localhost', 'host.docker.internal'\]

2026-06-16 08:59:40,968 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

2026-06-16 09:00:07,312 - src.model\_discovery - INFO - Discovered 0 model endpoints across 2 hosts

2026-06-16 09:00:36,565 - routes.email\_helpers - WARNING - SMTP not configured — add an Email Account in Settings or set env vars

2026-06-16 09:00:36,567 - routes.email\_helpers - WARNING - IMAP not configured — add an Email Account in Settings or set env vars

2026-06-16 09:00:40,619 - routes.email\_routes - ERROR - Failed to list emails: \[WinError 10061\] Nenhuma ligação pôde ser feita porque o computador de destino

as recusou ativamente

## Data Backup

Export or import your user data (memories, presets, settings, skills, preferences) as a JSON file.

## Danger Zone

Irreversible. Each wipe targets one category — pick exactly what you want gone.

Wipe all chats

Every session, message, and chat history. Documents/notes/etc. stay.

Wipe all memory

Clears \`memory.json\`, the Memory table, and the vector store. Skills not affected.

Wipe all skills

Drops \`data/skills/\` (all SKILL.md files). Memory not affected.

Wipe all notes

Every note, todo, and checklist.

Wipe all tasks

Every scheduled task and its run history (Tasks tool).

Wipe all documents

Every document and version. Drafts, exports, library — all gone.

Wipe all gallery

Every image record and the upload directory on disk.

Wipe all calendar

Every event and every calendar (incl. CalDAV-synced ones; resync to restore).