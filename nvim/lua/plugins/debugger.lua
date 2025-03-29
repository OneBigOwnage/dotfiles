return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    require('telescope').load_extension('dap')

    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
    }

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            hostname = "127.0.0.1",
            port = 9003,
            pathMappings = {
              ["/app"] = "/home/niek/Code/panoord-materiaalbeheer/",
            }
        }
    }

    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F6>', function() dap.step_over() end)
    vim.keymap.set('n', '<F8>', function() dap.toggle_breakpoint() end)


    -- Configure DAPUI
    dapui.setup();

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
