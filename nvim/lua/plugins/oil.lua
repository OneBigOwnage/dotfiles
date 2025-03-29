
  return {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        float = {
          padding = 10,
          preview_split = "right",
        },
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["q"] = { "actions.close", mode = "n" },
        },
        preview_win = {
          disable_preview = function(filename)
            local max_size = 100 * 1024

            local file_size = vim.fn.getfsize(filename)

            return file_size < 0 or file_size > max_size
          end,
        },
      })

      -- Autocommand to always automatically show a preview split
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilEnter",
        callback = vim.schedule_wrap(function(args)
          local oil = require("oil")
          if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            oil.open_preview()
            -- oil.toggle_hidden()
          end
        end),
      })
    end
  }
