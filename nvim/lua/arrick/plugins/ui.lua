return {
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                icons_enabled = true,
                theme = "everforest",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diff", "diagnostics" },
                lualine_c = { "branch" },
                lualine_x = {},
                lualine_y = { "filetype" },
                lualine_z = { "filename" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local nvimtree = require("nvim-tree")
            nvimtree.setup({
                view = {
                    width = 35,
                    relativenumber = true,
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                },
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false,
                        },
                    },
                },
                filters = {
                    custom = { ".DS_Store" },
                },
                git = {
                    ignore = false,
                },
            })

            -- Keymaps para el explorador de archivos
            local keymap = vim.keymap
            keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar explorador de archivos" })
            keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Buscar archivo en explorador" })
            keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Colapsar explorador de archivos" })
            keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refrescar explorador de archivos" })
        end,
    },
}
