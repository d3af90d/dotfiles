vim.g.mapleader       = '\\' -- I like '\' as leader.
vim.g.maplocalleader  = '\\'

vim.o.hlsearch        = true -- Set highlight on search
vim.o.mouse           = 'a'  -- Enable mouse mode
vim.wo.number         = true -- Show line number
vim.wo.relativenumber = true -- Relative line numbers

vim.o.tabstop     = 8        -- Number of spaces a tab counts for
vim.o.softtabstop = 4        -- Useful for keep tabstop standard, but editing like tabs are a different size
vim.o.shiftwidth  = 4        -- Number of spaces used for indentation and shifting with >> and <<
vim.o.smarttab    = true     -- Act like tabs when tabbing the start of a line even if there are spaces
vim.o.expandtab   = true     -- Expand tabs with spaces

vim.o.scrolloff      = 2     -- Number of lines always above or below the cursor
vim.o.wrap           = false -- Do not wrap text by default
vim.opt.conceallevel = 0
vim.opt.signcolumn   = "no"

vim.wo.foldlevel = 99
vim.wo.foldenable = true

vim.o.ignorecase  = true     -- Case-insensitive search
vim.o.smartcase   = true     -- Override the 'ignorecase' option if the search contains upper case characters
vim.o.breakindent = true     -- Wrap following lines at the level of indentation of the initial line
vim.wo.signcolumn = 'yes'    -- always draw the sign column

vim.o.undofile    = true     -- Save undo history
vim.o.updatetime  = 500      -- ms before swap file is written after typing
vim.o.timeoutlen  = 300      -- ms to wait before a mapped sequence is complete

vim.o.completeopt = 'menu,menuone,noselect,fuzzy'  -- Options for Inert-mode completion

vim.g.loaded_python3_provider = 0                  -- Don't need the perl provider
vim.g.loaded_perl_provider = 0                  -- Don't need the perl provider
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

vim.opt.termguicolors = false  -- Make nvim use the terminal colors
vim.cmd.colorscheme("default") -- Force the default theme that follows the terminal colors
