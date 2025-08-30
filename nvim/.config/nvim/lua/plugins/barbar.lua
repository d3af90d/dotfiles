-- https://github.com/romgrk/barbar.nvim
-- The neovim tabline plugin.

function SetBarbarColors()
  -- Colors for currently selected tab
  vim.api.nvim_set_hl(0, 'BufferCurrent',      {ctermfg = "None", ctermbg = "None", cterm = { reverse = true }})
  vim.api.nvim_set_hl(0, 'BufferCurrentSign',  {ctermfg = "None", ctermbg = "None", cterm = { reverse = true}})
  vim.api.nvim_set_hl(0, 'BufferCurrentMod',   {ctermfg = "None", ctermbg = "None", cterm = { reverse = true }})
  vim.api.nvim_set_hl(0, 'BufferCurrentIndex', {ctermfg = "None", ctermbg = "None", cterm = { reverse = true }})

  -- Colors for currently not visible tabs
  vim.api.nvim_set_hl(0, 'BufferInactive',   {ctermfg="None", ctermbg = "None"})
  vim.api.nvim_set_hl(0, 'BufferInactiveSign',   {ctermfg="None", ctermbg = "None"})
  vim.api.nvim_set_hl(0, 'BufferInactiveMod',   {ctermfg="None", ctermbg = "None"})
  vim.api.nvim_set_hl(0, 'BufferInactiveIndex',   {ctermfg="None", ctermbg = "None"})

  -- Colors for not currently focused splits tab
  vim.api.nvim_set_hl(0, 'BufferVisible',   {ctermfg="None", ctermbg = "None", cterm = {italic = true}})
  vim.api.nvim_set_hl(0, 'BufferVisibleSign',   {ctermfg="None", ctermbg = "None", cterm = {italic = true}})
  vim.api.nvim_set_hl(0, 'BufferVisibleMod',   {ctermfg="None", ctermbg = "None", cterm = {italic = true}})
  vim.api.nvim_set_hl(0, 'BufferVisibleIndex',   {ctermfg="None", ctermbg = "None", cterm = {italic = true}})
end

return {
  'romgrk/barbar.nvim',

  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },

  init = function() vim.g.barbar_auto_setup = false end,

  config = function ()
    require('barbar').setup {
      animation = true,
      auto_hide = true,
      minimum_padding = 1,
      maximum_padding = 1,
      icons = {
        buffer_index = true,
        filetype = {
          custom_colors = true,
          enabled = true,
        },
        separator = {left = None, right = None},
        separator_at_end = false
      }
    }

    -- Conform the color of barbar to the terminal colors
    SetBarbarColors()
    vim.api.nvim_create_autocmd('Colorscheme', {
      group = vim.api.nvim_create_augroup('barbar_colors', {}),
      callback = function() SetBarbarColors() end,
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts) -- Move to previous/next
    vim.api.nvim_set_keymap('n', '<M-.>', '<Cmd>BufferNext<CR>', opts)
    vim.api.nvim_set_keymap('n', "<M-'>", '<Cmd>BufferMovePrevious<CR>', opts) -- Re-order to previous/nextbar
    vim.api.nvim_set_keymap('n', '<M-\\>', '<Cmd>BufferMoveNext<CR>', opts)

    vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)

    vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
    vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

    vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts) -- Magic buffer-picking mode
    vim.api.nvim_set_keymap('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
  end,
}


