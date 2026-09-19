return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
            "andrew-george/telescope-themes",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                        },
                    },
                },
                extensions = {
                    themes = {
                        enable_previewer = true,
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/current-theme.lua",
                        },
                    },
                },
            })

            -- Cargar extensiones después de setup()
            pcall(telescope.load_extension, "fzf")
            pcall(telescope.load_extension, "themes")

            -- Keymaps
            vim.keymap.set("n", "<leader>pr", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>pt", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
        end,
    },
    {
        "otavioschwanck/tmux-awesome-manager.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("tmux-awesome-manager").setup({
                per_project_commands = {
                    api = { { cmd = "tmux split-window -v", name = "Split View" } },
                    front = { { cmd = "yarn dev", name = "react server" } },
                },
                session_name = "Neovim Terminals",
                use_icon = false,
                picker = "telescope",
                icon = " ",
            })
        end,
    },
}
