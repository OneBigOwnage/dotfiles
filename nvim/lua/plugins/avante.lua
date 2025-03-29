return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",  -- your desired model (or use gpt-4o, etc.)
      timeout = 30000,   -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0,
      max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
    file_selector = {
      provider = function(params)
        local filepaths = params.filepaths ---@type string[]
        local title = params.title ---@type string
        local handler = params.handler ---@type fun(selected_filepaths: string[]|nil): nil

        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        pickers.new({}, {
          prompt_title = title or "Avante File Selector",
          finder = finders.new_table({
            results = filepaths,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(_, map)
            actions.select_default:replace(function(bufnr)
              actions.close(bufnr)
              local selection = action_state.get_selected_entry()
              if not selection then
                handler(nil)
                return
              end
              handler({ selection[1] })
            end)
            return true
          end,
        }):find()
      end,

      provider_opts = {
        get_filepaths = function(params)
          local cwd = params.cwd ---@type string
          local selected_filepaths = params.selected_filepaths ---@type string[]

          local output = vim.fn.systemlist({
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!.git/*",
          }, cwd)

          return vim
              .iter(output)
              :filter(function(filepath)
                return not vim.tbl_contains(selected_filepaths, filepath)
              end)
              :totable()
        end,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
