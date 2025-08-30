vim.keymap.set('v', '<C-c>', '"+y:echo "Copied to system clipboard"<CR>', {silent = true})
vim.keymap.set('n', '<Leader>rr', ':e!<CR>:echo "File reloaded. Changes discarded."<CR>', { desc = '[R]eload cu[r]rent file discarding changes', silent = true })
vim.keymap.set('n', '<Leader>rc', ':%!rfcp<CR>', { desc = '[R]efresh [C]opyright header', silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>nn", ":set hlsearch!<CR>:set hlsearch?<CR>", { desc = "Toggle ([N]o/yes) search highlight", silent = true }) -- Toggle search highlight
vim.keymap.set("n", "<leader>p", ":set wrap!<CR>:set wrap?<CR>", { desc = "Toggle Wra[P]", silent = true })

vim.keymap.set('n', '<A-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<A-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { silent = true })


-- Make invisible characters visible
vim.opt.listchars = { tab = '»·', trail = 'x', extends = '>', precedes = '<', space = '·', eol = '↲' }
vim.keymap.set('n', '<leader>in', ':lua vim.opt.list = not vim.opt.list:get()<CR>', { desc = 'Toggle [I]insible Characters', silent = true })

-- Code for making trailing whitespace visible

Visible_trailing_whitespace = false

vim.cmd [[
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match none
  autocmd ColorScheme * highlight ExtraWhitespace NONE
]]

function ToggleTrailingSpace()
  if Visible_trailing_whitespace then
    vim.cmd([[ highlight ExtraWhitespace NONE ]])
    print("Visible Trailing Whitespace disabled!")
  else
    vim.cmd([[ highlight ExtraWhitespace ctermbg=red guibg=red ]])
    print("Visible Trailing Whitespace enabled!")
  end
  Visible_trailing_whitespace = not Visible_trailing_whitespace
end

vim.api.nvim_set_keymap('n', '<leader>t', ':lua ToggleTrailingSpace()<CR>', { desc = '[T]railing whitespace visible', silent = true })

vim.keymap.set('n', '<leader>cn', function()
  if vim.wo.conceallevel == 0 then
    vim.wo.conceallevel = 2
  else
    vim.wo.conceallevel = 0
  end
  print("conceallevel =", vim.wo.conceallevel)
end, {desc = "Toggle conceallevel"})

local zoomed = false

function ToogleZoom()
  if not zoomed then
    vim.cmd("wincmd _")
    vim.cmd("wincmd |")
    zoomed = true
  else
    vim.cmd("wincmd =")
    zoomed = false
  end
end
vim.keymap.set("n", "<M-=>", ":lua ToogleZoom()<CR>", {noremap = true, desc = "Toggle maximization of currently active split window"})

-- Splits
vim.keymap.set('n', '<M-s>', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-v>', ':vsplit<CR>', { noremap = true, silent = true })

-- Resize splits keymap
vim.keymap.set('n', '<M-K>', ':resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-J>', ':resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-L>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-H>', ':vertical resize -5<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<M-q>', ':quit<CR>', { noremap = true, silent = true })

-- Diagnostics Messages
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
