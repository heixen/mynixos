return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        format_on_save = {
            timeout_ms = 5000,
            lsp_format = "fallback",
        },

        formatters_by_ft = {
            -- Nix
            nix = { "nixfmt" },

            -- Lua
            lua = { "stylua" },

            -- Shell
            sh = { "shfmt" },
            bash = { "shfmt" },

            -- Go
            go = { "gofumpt" },

            -- Python
            python = { "black" },

            -- JSON
            json = { "prettier" },
            jsonc = { "prettier" },

            -- C / C++
            c = { "clang_format" },
            cpp = { "clang_format" },
            objc = { "clang_format" },
            objcpp = { "clang_format" },

            -- JavaScript / TypeScript
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },

            -- Web
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },

            -- Markdown
            markdown = { "prettier" },
        },

        formatters = {
            nixfmt = {
                command = "/run/current-system/sw/bin/nixfmt",
                args = { "-" },
                stdin = true,
            },

            prettier = {
                command = "prettier",
                args = { "--stdin-filepath", "$FILENAME" },
                stdin = true,
            },
        },
    },
}
