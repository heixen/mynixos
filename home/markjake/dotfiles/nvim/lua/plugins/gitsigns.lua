return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },

        opts = {
            -- Git signs in the sign column
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },

            -- Show signs for staged changes too
            signs_staged_enable = true,

            -- Enable Git signs
            signcolumn = true,

            -- Keep line numbers normal
            numhl = false,
            linehl = false,

            -- Show word-level differences in previews
            word_diff = false,

            -- Automatically detect Git changes
            watch_gitdir = {
                enable = true,
                follow_files = true,
            },

            auto_attach = true,
            attach_to_untracked = false,

            -- Git blame (disabled by default)
            current_line_blame = false,

            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = false,
            },

            current_line_blame_formatter =
            "  <author>, <author_time:%R> - <summary>",

            -- Update settings
            update_debounce = 100,
            max_file_length = 40000,

            -- Keybindings
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = bufnr,
                        desc = "Git: " .. desc,
                    })
                end

                -- Navigate between changed sections
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.nav_hunk("next")
                    end)
                    return "<Ignore>"
                end, "Next hunk")

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.nav_hunk("prev")
                    end)
                    return "<Ignore>"
                end, "Previous hunk")

                -- Stage and reset
                map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")

                map("v", "<leader>hs", function()
                    gs.stage_hunk({
                        vim.fn.line("."),
                        vim.fn.line("v"),
                    })
                end, "Stage selected lines")

                map("v", "<leader>hr", function()
                    gs.reset_hunk({
                        vim.fn.line("."),
                        vim.fn.line("v"),
                    })
                end, "Reset selected lines")

                -- Preview changes
                map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>hi", gs.preview_hunk_inline, "Inline preview")

                -- Git blame
                map("n", "<leader>hb", gs.blame_line, "Blame line")
                map("n", "<leader>hB", gs.blame, "Blame file")

                -- Diff
                map("n", "<leader>hd", gs.diffthis, "Diff file")

                -- Toggle current line blame
                map("n", "<leader>tb", gs.toggle_current_line_blame,
                    "Toggle line blame")

                -- Undo last staged hunk
                map("n", "<leader>hu", gs.undo_stage_hunk,
                    "Undo stage hunk")
            end,
        },
    },
}
