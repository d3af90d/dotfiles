return {
  'stevearc/aerial.nvim', -- https://github.com/stevearc/aerial.nvim
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup {
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,

      nav = {
        border = "rounded",
        max_height = 0.9,
        min_height = { 10, 0.1 },
        max_width = 0.9,
        min_width = { 20, 0.4 },
      },

      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<M-a>", "<cmd>AerialToggle! right<CR>"),
      vim.keymap.set("n", "<M-f>", "<cmd>AerialToggle float<CR>"),
      vim.keymap.set("n", "<M-A>", "<cmd>AerialOpenAll<CR>"),
      vim.keymap.set("n", "<M-C>", "<cmd>AerialCloseAll<CR>"),
    }
  end,
}
