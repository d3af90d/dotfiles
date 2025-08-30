-- https://github.com/hrsh7th/nvim-cmp
-- A completion plugin for neovim coded in Lua.

return {
  'hrsh7th/nvim-cmp',

  lazy = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- https://github.com/L3MON4D3/LuaSnip
    -- Snippet Engine for Neovim written in Lua.
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*', -- use latest 2.x release
      build = 'make install_jsregexp',
    },

    -- https://github.com/saadparwaiz1/cmp_luasnip
    -- Snippet Engine & its associated nvim-cmp source
    'saadparwaiz1/cmp_luasnip',

    -- https://github.com/rafamadriz/friendly-snippets
    -- Set of preconfigured snippets for different languages.
    'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
  },

  config = function()
    require('cmp').setup {

      -- Specify LuaSnip as snippet engine
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },

      window = {
        completion = require('cmp').config.window.bordered(),
        documentation = require('cmp').config.window.bordered(),
      },

      mapping = require('cmp').mapping.preset.insert({
        ['<C-n>'] = require('cmp').mapping.select_next_item(),
        ['<C-p>'] = require('cmp').mapping.select_prev_item(),

        ['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(4),

        ['<C-Space>'] = require('cmp').mapping.complete(),

        ['<C-e>'] = require('cmp').mapping.abort(),

        ['<CR>'] = require('cmp').mapping.confirm({
          behavior = require('cmp').ConfirmBehavior.Replace,
          select = true -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        ['<Tab>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() then
            require('cmp').select_next_item()
          elseif require('luasnip').expand_or_locally_jumpable() then
            require('luasnip').expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() then
            require('cmp').select_prev_item()
          elseif require('luasnip').locally_jumpable(-1) then
            require('luasnip').jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = require('cmp').config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
          -- { name = 'buffer' },
        })

    }

    require('cmp').setup.cmdline({ '/', '?' }, {
      mapping = require('cmp').mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    require('cmp').setup.cmdline(':', {
      mapping = require('cmp').mapping.preset.cmdline(),
      sources = require('cmp').config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- setup lsp servers
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server it's using LuaJIT (used by Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      },
      pyright = {},
      gopls = {},
      ts_ls = { settings = {}, },
      html = {},
      cssls = {},
      clangd = {},
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    for server, server_opts in pairs(servers) do
      require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, server_opts))
    end

    require('luasnip.loaders.from_vscode').lazy_load()
    require("luasnip").config.setup {}

    -- TODO: clean

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = true, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('grx', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>ff', vim.lsp.buf.format, '[F]ormat current bu[F]fer with LSP')
    nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders')

  end
}
