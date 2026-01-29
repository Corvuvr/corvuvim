local config = function()

    local dap = require("dap")
    local dapui = require("dapui")
    local overseer = require("overseer")
    dapui.setup()

    dap.set_log_level('TRACE') -- :help dap.set_log_level()

    -- Events
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
      overseer.close()
    end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    -- Mappings (DAP)
    vim.keymap.set(
        'n', '<F5>',       
        function() 
            require('dap').continue() 
        end,             
        { desc = "DAP: continue"  }
    )
    vim.keymap.set('n', '<F10>',      function() require('dap').step_over() end,            { desc = "DAP: step over" })
    vim.keymap.set('n', '<F11>',      function() require('dap').step_into() end,            { desc = "DAP: step into" })
    vim.keymap.set('n', '<F12>',      function() require('dap').step_out() end,             { desc = "DAP: step out"  })
    vim.keymap.set('n', '<Leader>do', function() require('dap').open() end,                 { desc = "DAP: open"      })
    vim.keymap.set('n', '<Leader>dc', function() require('dap').close() end,                { desc = "DAP: close"     })
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end,             { desc = "DAP: run last"  })
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end,            { desc = "DAP: repl.open" })
    -- vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end,       { desc = "Set Breakpoint" })
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end,    { desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '<Leader>dB', 
        function() 
            local condition = vim.fn.input("Breakpoint condition (optional): ")
            local hit_condition = vim.fn.input("Hit count (optional): ")
            -- Convert empty strings to nil
            condition = condition ~= "" and condition or nil
            hit_condition = hit_condition ~= "" and hit_condition or nil
            require("dap").toggle_breakpoint(condition, hit_condition)
        end,    
        { desc = "Toggle Conditional Breakpoint" }
    )
    -- pWhereToReplace=="#define MFBSP_BASE 0xB82FB000UL"

    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Set Breakpoint" })

    -- Mappings (UI)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end)
    vim.keymap.set('n', '<Leader>dc', function()
        require('dapui').close()
    end)

    -- C++
    dap.adapters.codelldb = {
        type = "executable",
        command = "/home/test/.local/share/nvim/mason/bin/codelldb",
    }
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input(
                    'Executable: ', vim.fn.getcwd() .. '/', 'file'
                )
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
        {
            name = "Launch file from directory",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input(
                    'Executable: ', vim.fn.getcwd() .. '/', 'file'
                )
            end,
            cwd = function()
                return vim.fn.input(
                    'Working directory: ', vim.fn.getcwd() .. '/', 'dir'
                )
            end,
            stopOnEntry = false,
        },
    }
    dap.configurations.python = {
        {
            name = "Attach to...",
            type = "python",
            request = "attach",
            justMyCode = false,
            port = "5678",
        },
    }
end

return config
