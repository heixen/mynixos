return {
    'stevearc/aerial.nvim',
    opts = {
        backends = { "lsp", "treesitter" },
        layout = {
            width = 30,
            min_width = 25,
        },
        show_guides = true,
    },
    keys = {
        {
            "<leader>cs",
            "<cmd>AerialToggle!<CR>",
            desc = "Toggle code outline",
        },
    },
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
}
