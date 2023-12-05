local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

end)

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim'}
      }
    }
  }
})

require('mason').setup({})
require 'mason-lspconfig'.setup({
  ensure_installed = {
    'lua_ls',
    'intelephense',
    'tsserver',
    'rust_analyzer',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

require'lspconfig'.intelephense.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('intelephense'),
  root_dir = require'lspconfig/util'.root_pattern("composer.json", ".git", vim.fn.getcwd()),
}

require'lspconfig'.rust_analyzer.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('rust_analyzer', { network = "bridge" }),
  root_dir = require'lspconfig/util'.root_pattern("Cargo.toml", "rust-project.json", ".git", vim.fn.getcwd()),
}
