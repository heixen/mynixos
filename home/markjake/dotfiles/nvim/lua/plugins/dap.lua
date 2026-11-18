-- VSCode-like debugging for C/C++ using GDB's built-in DAP interpreter.
-- GDB >= 14 speaks DAP directly via `gdb -i dap`, so no codelldb/cpptools
-- adapter is needed. GDB is in the cpp flake's dev shell and in systemPackages.
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",             -- required by nvim-dap-ui
        "rcarriga/nvim-dap-virtual-text",     -- inline variable values
    },
    config = function()
        local dap = require("dap")

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" },
        }

        -- Compile the file you're editing with debug symbols, then hand the
        -- resulting binary to gdb. Breakpoints work once F5 is pressed.
        local function build_current_file()
            local file = vim.fn.expand("%:p")
            local out = vim.fn.expand("%:p:r")
            local is_c = vim.bo.filetype == "c"
            local output = vim.fn.system({
                is_c and "gcc" or "g++",
                "-g", "-O0", "-Wall",
                is_c and "-std=c11" or "-std=c++20",
                file,
                "-o",
                out,
            })
            if vim.v.shell_error ~= 0 then
                error("Build failed:\n" .. output)
            end
            return out
        end

        local debug_current_file = {
            name = "Debug current file (compile with -g, gdb)",
            type = "gdb",
            request = "launch",
            program = build_current_file,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
        }

        for _, ft in ipairs({ "c", "cpp", "objc", "objcpp" }) do
            dap.configurations[ft] = { debug_current_file }
        end

        -- Open the sidebar automatically when a session starts.
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        require("nvim-dap-virtual-text").setup()
    end,
}
