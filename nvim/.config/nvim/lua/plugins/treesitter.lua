-- https://github.com/nvim-treesitter/nvim-treesitter
-- Nvim Treesitter configurations and abstraction layer

return {
  'nvim-treesitter/nvim-treesitter',  -- Highlight, edit, and navigate code
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  config = function ()
    require('nvim-treesitter.configs').setup { -- See `:help nvim-treesitter`
      ensure_installed = { 'c', 'go', 'lua', 'markdown', 'python', 'vimdoc', 'vim' },
      sync_install = false,
      auto_install = true,
      modules = {},
      ignore_install = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = { enable = true },

      -- -----------------------------------------
      -- nvim-treesitter-textobjects configuration
      -- -----------------------------------------

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }

    -- -----------------------------------------
    -- Folding setup
    -- -----------------------------------------

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
  end,
}
