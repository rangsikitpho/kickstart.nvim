return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        styles = { comments = { italic = false } },
      }
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
}
