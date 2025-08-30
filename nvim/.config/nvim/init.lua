require 'custom.install-lazy'

require('lazy').setup({
  "nvim-neotest/nvim-nio",
  require 'plugins.treesitter',
  'neovim/nvim-lspconfig',
  require 'plugins.mason',
  require 'plugins.mason-lspconfig',
  require 'plugins.nvim-cmp',
  require 'plugins.telescope',
  require 'plugins.neo-tree',
  require 'plugins.barbar',
  require 'plugins.lualine',
  require 'plugins.nvim-autopairs',
  require 'plugins.auto-session',
  require 'plugins.gitsigns',
  require 'plugins.zen-mode',
  require 'plugins.indent-blankline',
  require 'plugins.nvim-surround',
  require 'plugins.aerial',
  require 'plugins.nvim-ufo',
  require 'plugins.neorg',
  require 'plugins.image',
  require 'plugins.img-clip',
  'tpope/vim-sleuth',               -- Detect tabstop and shiftwidth heuristically - https://github.com/tpope/vim-sleuth
  'folke/which-key.nvim',           -- Shows you pending keybinds - https://github.com/folke/which-key.nvim
  'mbbill/undotree',
})
require 'custom.vim-options'
require 'custom.yank-highlight'
require 'custom.remember-cursor'
require 'custom.keymaps'
require 'custom.filetype-options'
