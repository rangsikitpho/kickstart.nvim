return {
  'rmagatti/auto-session',
  lazy = false,
  init = function()
    -- Recommended by auto-session so window layout, folds, and buffer-local
    -- options are saved/restored along with the session.
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
  ---@module 'auto-session'
  ---@type AutoSession.Config
  opts = {
    -- Sessions are keyed by cwd, so restoring a tmux session (which restores
    -- the pane's working directory and relaunches nvim) restores the matching
    -- Neovim session automatically.
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    -- Only auto-restore when nvim is started with no file arguments.
    auto_restore = true,
    auto_save = true,
  },
  keys = {
    { '<leader>ts', '<cmd>SessionSearch<cr>', desc = '[T]oggle [S]ession search' },
    { '<leader>tS', '<cmd>SessionSave<cr>', desc = '[T]oggle [S]ession save' },
  },
}
