# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on **kickstart.nvim** — a single-file starting point, not a distribution. The config uses Lua and the **lazy.nvim** plugin manager.

## Architecture

- `init.lua` — Main config file containing core settings, keymaps, autocommands, and the `lazy.nvim` plugin spec. Most built-in plugins (snacks.nvim, treesitter, LSP, blink.cmp, which-key, gitsigns, etc.) are configured inline here.
- `lua/kickstart/` — Optional kickstart-provided plugin configs (autopairs, debug, gitsigns, indent_line, lint). These are imported via `{ import = 'kickstart.plugins' }` in the lazy.nvim setup.
- `lua/custom/plugins/` — User customizations. Each file returns a lazy.nvim plugin spec table. Auto-imported via `{ import = 'custom.plugins' }`.
- `lua/custom/keymaps.lua` — Additional which-key group registrations (loaded from `custom/plugins/init.lua`).
- `lua/custom/autocmds.lua` — Custom autocommands (loaded from `custom/plugins/init.lua`).

## Key Customizations (lua/custom/)

- **Colorscheme**: Kanagawa (`kanagawa-wave`) is the active colorscheme, configured in `colorscheme.lua`.
- **Copilot**: `copilot.lua` + CopilotChat with Anthropic as default provider. Copilot integrated into blink.cmp as a completion source.
- **Tmux navigation**: `Navigator.nvim` (Lua-native) with `<C-h/j/k/l>` bindings for splits and tmux panes.
- **Cursor fix**: VimLeave autocmd resets cursor shape for tmux compatibility.

## Core Plugins

- **Snacks.nvim** — Picker (`<leader>s*`), file explorer (`\`), notifications, and input UI. Replaces Telescope, neo-tree, and fidget.nvim.
- **blink.cmp** — Autocompletion with Rust fuzzy matcher, Copilot source, and LuaSnip snippets.
- **conform.nvim** — Format on save. Formatters: stylua (Lua), ruff_format (Python), rustfmt (Rust), rubocop (Ruby).
- **nvim-lint** — Linting (markdownlint for Markdown).

## Plugin Management

- `:Lazy` — Open plugin manager UI
- `:Lazy update` — Update all plugins
- `lazy-lock.json` — Lockfile tracked in git

## Leader Key

Space is the leader key. Key groups: `<leader>s` (Search), `<leader>t` (Toggle), `<leader>h` (Git Hunk), `<leader>c` (Code), `<leader>d` (Document), `<leader>r` (Rename), `<leader>w` (Workspace).

## Adding Plugins

Create a new file in `lua/custom/plugins/` returning a lazy.nvim spec table. It will be auto-imported.
