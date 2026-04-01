-- fix cursor shape reset leaking into tmux
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    vim.opt.guicursor = 'a:ver25'
    vim.cmd 'sleep 10m'
  end,
})
