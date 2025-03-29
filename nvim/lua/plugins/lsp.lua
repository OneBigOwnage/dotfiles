return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- LSP Support
    'neovim/nvim-lspconfig',
    'lspcontainers/lspcontainers.nvim',
    'nvimtools/none-ls.nvim',
    'nvim-lua/plenary.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    local lspconfig = require('lspconfig')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({})
    require 'mason-lspconfig'.setup({
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
      },
      handlers = {
        lsp_zero.default_setup,
      }
    })

    lspconfig.phpactor.setup {
      before_init = function(params)
        params.processId = vim.NIL
      end,
      cmd = require 'lspcontainers'.command('phpactor', { image = 'phpactor' }),
      root_dir = require 'lspconfig/util'.root_pattern("composer.json", ".git", vim.fn.getcwd()),
    }

    lspconfig.rust_analyzer.setup {
      before_init = function(params)
        params.processId = vim.NIL
      end,
      cmd = require 'lspcontainers'.command('rust_analyzer', { network = "bridge" }),
      root_dir = require 'lspconfig/util'.root_pattern("Cargo.toml", "rust-project.json", ".git", vim.fn.getcwd()),
    }

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "html" },
        }),
      },
    })
  end
}
