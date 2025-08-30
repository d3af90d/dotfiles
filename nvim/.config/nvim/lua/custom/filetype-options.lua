-- Re-run FileType autocommands for all buffers
vim.api.nvim_create_autocmd({"VimEnter", "SessionLoadPost"}, {
  callback = function()
    vim.cmd("silent! bufdo filetype detect")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
