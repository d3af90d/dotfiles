-- https://github.com/nvim-neorg/neorg
-- Modernity meets insane extensibility. The future of organizing your life in Neovim.

return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function ()
        require('neorg').setup{
            load = {
                ["core.defaults"] = {}, -- load default behaviour
                ["core.concealer"] = {},
                ["core.export"] = {},
                ["core.export.markdown"] = {},
            }
        }
        -- https://github.com/nvim-neorg/neorg/wiki/Default-Keybinds
        vim.keymap.set("n", "<M-e>", "<Plug>(neorg.looking-glass.magnify-code-block)", { desc = "[E]dit code in a separate buffer", silent = true})
        vim.keymap.set("n", "<leader>no", "<Plug>(neorg.dirman.new-note)", { desc = "Create New [N]eorg [No]te", silent = true})
    end,
}
