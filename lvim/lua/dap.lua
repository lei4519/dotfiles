local M = {}

function M.config()

    {
      "mfussenegger/nvim-dap",
      require = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui"
      },
      event = "BufRead",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("nvim-dap-virtual-text").setup({
          commented = true
        })

        vim.fn.sign_define("DapBreakpoint", lvim.builtin.dap.breakpoint)
        vim.fn.sign_define("DapBreakpointRejected", lvim.builtin.dap.breakpoint_rejected)
        vim.fn.sign_define("DapStopped", lvim.builtin.dap.stopped)

        dapui.setup({
          icons = {
            expanded = "▾",
            collapsed = "▸"
          },
          mappings = {
            -- Use a table to apply multiple mappings
            expand = { "o", "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t"
          },
          sidebar = {
            -- You can change the order of elements in the sidebar
            elements = { -- Provide as ID strings or tables with "id" and "size" keys
              {
                id = "scopes",
                size = 0.25 -- Can be float or integer > 1
              }, {
                id = "breakpoints",
                size = 0.25
              }, {
                id = "stacks",
                size = 0.25
              }, {
                id = "watches",
                size = 00.25
              } },
            size = 40,
            position = "left" -- Can be "left", "right", "top", "bottom"
          },
          tray = {
            elements = { "repl" },
            size = 10,
            position = "bottom" -- Can be "left", "right", "top", "bottom"
          },
          floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
              close = { "q", "<Esc>" }
            }
          },
          windows = {
            indent = 1
          },
          render = {
            max_type_length = nil -- Can be integer or nil.
          }
        }) -- use default

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
end

return M
