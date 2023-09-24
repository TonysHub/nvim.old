local Remap = require("tonylee.keymap")
local inoremap = Remap.inoremap
local nnoremap = Remap.nnoremap

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'lua_ls',
  'pylsp',
})


-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
  nnoremap("K", function() vim.lsp.buf.hover() end, opts)
  nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
  nnoremap("[d", function() vim.diagnostic.goto_next() end, opts)
  nnoremap("]d", function() vim.diagnostic.goto_prev() end, opts)
  nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
  nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


local pylsp_config = {
  pylsp = {
    plugins = {
      pycodestyle = {
        enabled = false,
        ignore = {"E501"}
      },
      flake8 = {
       enabled = false,
        ignore = {"E501", "E126", "E121", "E123"}
      },
      mccabe = {
        enabled = false
      },
      pyflakes = {
        enabled = false
      },
    }
  }
}

lsp.setup({
  pylsp = pylsp_config
})
require('lspconfig').tsserver.setup {}
require('lspconfig').rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').pylsp.setup{
   settings = pylsp_config
}


require("mason-nvim-dap").setup({
  ensure_installed = { "python", "cpp" },
  automatic_installation = true,
  handlers = {
    function(config) require("mason-nvim-dap").default_setup(config) end,
  },
})
