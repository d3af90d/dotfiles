return {
  'nvim-neo-tree/neo-tree.nvim', -- Vedere Documentazione per conoscere piu' keybindings
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      window = {
        action = "show",
        position = "right",
      }
    }
    vim.keymap.set('n', '<A-n>', '<Cmd>Neotree toggle action=show<CR>', { noremap = true, silent = true })
  end,
}
