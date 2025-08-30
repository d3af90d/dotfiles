return {                           -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim', -- Fuzzy Finder (files, lsp, etc)
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup { -- See `:help telescope` and `:help telescope.setup()`
      pickers = {
        find_files = {
          theme = "ivy"
        }
      },
      extensions = {
        fzf = {} -- Require for fzf native
      },
    }
    pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed

    vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
          -- winblend = 10,
          previewer = true,
        })
      end,
      { desc = '[/] Fuzzily search in current buffer' }
    )
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' }) -- See `:help telescope.builtin`
  end,
}
