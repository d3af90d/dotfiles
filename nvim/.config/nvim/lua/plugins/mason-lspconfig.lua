-- https://github.com/mason-org/mason-lspconfig.nvim
-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
