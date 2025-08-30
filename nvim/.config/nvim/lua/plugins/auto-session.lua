-- https://github.com/rmagatti/auto-session
-- A small automated session manager for Neovim

return {
  'rmagatti/auto-session',
  config = function ()
    require('auto-session').setup{
      git_use_branch_name = true,
      suppressed_dirs = { '~/', '~/dl', '/'}, -- Folders where not to save sessions
      log_level = 'error',
    }
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,terminal,localoptions'
  end
}
