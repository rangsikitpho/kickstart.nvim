return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom', -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<M-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
      -- Add Claude configuration
      providers = {
        -- Keep default OpenAI provider if you want to switch between them
        openai = {
          -- Your existing OpenAI config if any
        },

        -- Add Claude provider
        anthropic = {
          api_key = os.getenv 'ANTHROPIC_API_KEY',
          model = 'claude-3-7-sonnet-20250219',
          temperature = 0.7,
          max_tokens = 2000,
        },
      },
      -- Set default provider (optional)
      default_provider = 'anthropic', -- Use Claude by default

      -- Custom prompts for Claude
      prompts = {
        -- Example Claude-specific prompts
        ClaudeExplain = {
          provider = 'anthropic',
          prompt = 'Explain this code in detail:\n```{{filetype}}\n{{selection}}\n```',
        },
        ClaudeRefactor = {
          provider = 'anthropic',
          prompt = 'Refactor this code to improve its clarity and efficiency:\n```{{filetype}}\n{{selection}}\n```',
        },
        ClaudeTest = {
          provider = 'anthropic',
          prompt = 'Generate comprehensive tests for this code:\n```{{filetype}}\n{{selection}}\n```',
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  ---------------------------------------------------------------------------
  -- 2.  blink-cmp Copilot provider  ----------------------------------------
  ---------------------------------------------------------------------------
  {
    'giuxtaposition/blink-cmp-copilot', -- <- **NEW** provider plugin
    dependencies = { 'saghen/blink.cmp' }, -- make sure blink.cmp is loaded
  },

  ---------------------------------------------------------------------------
  -- 3.  Patch blink.cmp to use that provider ------------------------------
  ---------------------------------------------------------------------------
  {
    'saghen/blink.cmp',
    opts = function(_, opts)
      -- add the source once
      if not vim.tbl_contains(opts.sources.default, 'copilot') then
        table.insert(opts.sources.default, 'copilot')
      end

      -- register (or update) the provider definition
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.copilot = {
        name = 'copilot',
        module = 'blink-cmp-copilot', -- ← correct module name
        score_offset = 150,
        async = true,
      }

      return opts
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
      'giuxtaposition/blink-cmp-copilot',
    },
  },
}
