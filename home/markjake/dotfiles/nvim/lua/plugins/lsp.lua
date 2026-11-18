return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                cmd = { "lua-language-server" },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    -- NixOS: uncomment if compile_commands.json references a
                    -- gcc-wrapper g++ and clangd cannot find system headers.
                    -- "--query-driver=" .. vim.fn.exepath("g++"),
                },
                filetypes = {
                    "c",
                    "cpp",
                    "objc",
                    "objcpp",
                },
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    ".git",
                },
                -- clangd reads configuration from `settings.clangd`.
                -- init_options only supports things like fallbackFlags /
                -- compilationDatabasePath, so InlayHints was being ignored.
                settings = {
                    clangd = {
                        InlayHints = {
                            Enabled = true,
                            DeducedTypes = true,
                            ParameterNames = false,
                        },
                    },
                },
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                cmd = {
                    "pyright-langserver",
                    "--stdio",
                },
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })

            -- TypeScript / JavaScript / Next.js
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                cmd = {
                    "typescript-language-server",
                    "--stdio",
                },
            })

            vim.lsp.config("marksman", {
                capabilities = capabilities,
                cmd = {
                    "marksman",
                    "server",
                },
                filetypes = {
                    "markdown",
                    "markdown.mdx",
                },
                root_markers = {
                    ".marksman.toml",
                    ".git",
                },
            })

            -- Tailwind CSS
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
                cmd = {
                    "tailwindcss-language-server",
                    "--stdio",
                },
            })

            -- ESLint
            vim.lsp.config("eslint", {
                capabilities = capabilities,
                cmd = {
                    "vscode-eslint-language-server",
                    "--stdio",
                },
            })



            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "pyright",

                -- Next.js
                "ts_ls",
                "tailwindcss",
                "eslint",

                "marksman",
            })
        end,
    },
}
