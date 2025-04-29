-- lua/custom/plugins/colorscheme.lua
return {
  ---------------------------------------------------------------------------
  -- 1.  Disable the scheme that ships with Kickstart (Tokyonight) ----------
  ---------------------------------------------------------------------------
  { 'folke/tokyonight.nvim', enabled = false },

  ---------------------------------------------------------------------------
  -- 2.  Your preferred colourscheme (Kanagawa) -----------------------------
  ---------------------------------------------------------------------------
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- load before everything else
    config = function()
      require('kanagawa').setup {
        styles = { comments = { italic = false } },
      }
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
}
