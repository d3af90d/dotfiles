local lspconfig = require("lspconfig")
local mason_lspconfig = require 'mason-lspconfig'
local cmp = require 'cmp'
local luasnip = require 'luasnip'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
  ts_ls = {
    -- You can optionally add settings or init_options here if needed
    -- For most use cases, leaving it empty works fine
    settings = {},
  },
  html = {},
  cssls = {},
}

for server, server_opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, server_opts))
end


require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local nmap = function(keys, func, desc) -- Helper function to set mappings
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
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
