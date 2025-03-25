-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "BurntSushi/ripgrep" },
    }
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('nvim-lualine/lualine.nvim')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use { 'pocco81/auto-save.nvim' }

  use { 'nvim-treesitter/nvim-treesitter-context' }

  use {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle'
  }

  use {
    'dhruvasagar/vim-prosession',
    requires = { 'tpope/vim-obsession' }
  }

  use { 'lspcontainers/lspcontainers.nvim' }

  use { 'nvim-tree/nvim-web-devicons' }

  use { 'onsails/lspkind-nvim' }

  use { 'RRethy/vim-illuminate' }

  use { 'stevearc/dressing.nvim' }

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use { 'hedyhli/outline.nvim' }

  use {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  }

  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }

  use { "zbirenbaum/copilot.lua" }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
  }

  use { "nvimtools/none-ls.nvim", requires = { 'nvim-lua/plenary.nvim' } }

  use { "catppuccin/nvim", as = "catppuccin" }

  use { "stevearc/oil.nvim" }

  use {
    "sphamba/smear-cursor.nvim",
    config = function ()
      require('smear_cursor').setup()
    end,
  }

  use { 'mfussenegger/nvim-dap' }

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  use { 'theHamsta/nvim-dap-virtual-text' }

  use { 'nvim-telescope/telescope-dap.nvim' }
end)
