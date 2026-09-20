return {
    -- Signos de git en el gutter + blame inline + navegación de hunks
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "" },
                topdelete    = { text = "" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            current_line_blame = false, -- activar con <leader>gb
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navegación entre hunks
                map("n", "]h", gs.next_hunk,               "Git: Siguiente hunk")
                map("n", "[h", gs.prev_hunk,               "Git: Hunk anterior")

                -- Acciones sobre hunks
                map("n", "<leader>gs", gs.stage_hunk,       "Git: Stage hunk")
                map("n", "<leader>gr", gs.reset_hunk,       "Git: Resetear hunk")
                map("n", "<leader>gS", gs.stage_buffer,     "Git: Stage buffer completo")
                map("n", "<leader>gu", gs.undo_stage_hunk,  "Git: Unstage hunk")
                map("n", "<leader>gR", gs.reset_buffer,     "Git: Resetear buffer")
                map("n", "<leader>gp", gs.preview_hunk,     "Git: Preview hunk")
                map("n", "<leader>gb", gs.toggle_current_line_blame, "Git: Toggle blame inline")
                map("n", "<leader>gd", gs.diffthis,         "Git: Diff con HEAD")
            end,
        },
    },

    -- LazyGit dentro de Neovim
    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Git: Abrir LazyGit" },
        },
    },
}
