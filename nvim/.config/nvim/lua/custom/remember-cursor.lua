-- Snippet for remembering the last position of the cursor when opening a file

vim.api.nvim_create_augroup('general', { clear = true })

vim.api.nvim_create_autocmd( 'BufReadPost', {
  group = 'general',
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})
