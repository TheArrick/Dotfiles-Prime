return {
    -- Comentar líneas y bloques con gcc / gc
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Editar comillas, paréntesis, tags HTML: ys, cs, ds
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },


    -- Resaltar y listar TODO, FIXME, HACK, NOTE, etc.
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            keywords = {
                FIX  = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint",    alt = { "INFO" } },
            },
        },
        keys = {
            { "]t",          function() require("todo-comments").jump_next() end, desc = "TODO: Siguiente" },
            { "[t",          function() require("todo-comments").jump_prev() end, desc = "TODO: Anterior" },
            { "<leader>td",  "<cmd>TodoTrouble<cr>",                              desc = "TODO: Ver en Trouble" },
            { "<leader>ts",  "<cmd>TodoTelescope<cr>",                            desc = "TODO: Buscar con Telescope" },
        },
    },

    -- Navegación rápida entre archivos frecuentes (Harpoon v2)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            -- Agregar archivo actual
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,            { desc = "Harpoon: Agregar archivo" })
            -- Abrir menú
            vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menú" })
            -- Navegar a posiciones
            vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,       { desc = "Harpoon: Archivo 1" })
            vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,       { desc = "Harpoon: Archivo 2" })
            vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,       { desc = "Harpoon: Archivo 3" })
            vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,       { desc = "Harpoon: Archivo 4" })
            -- Moverse entre marcadores
            vim.keymap.set("n", "<C-S-P>",    function() harpoon:list():prev() end,          { desc = "Harpoon: Anterior" })
            vim.keymap.set("n", "<C-S-N>",    function() harpoon:list():next() end,          { desc = "Harpoon: Siguiente" })
        end,
    },

    -- Panel de diagnósticos, errores LSP, referencias, todo-comments
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            modes = {
                lsp_references = { auto_close = true },
            },
        },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Trouble: Diagnósticos (workspace)" },
            { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Trouble: Diagnósticos (buffer)" },
            { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Trouble: Símbolos" },
            { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "Trouble: LSP" },
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                             desc = "Trouble: Quickfix" },
        },
    },

    -- Which-key: popup de atajos al presionar <leader>
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            delay = 400,
            spec = {
                { "<leader>g",  group = "Git" },
                { "<leader>f",  group = "Buscar" },
                { "<leader>p",  group = "Telescope" },
                { "<leader>e",  group = "Explorador" },
                { "<leader>h",  group = "Harpoon" },
                { "<leader>x",  group = "Trouble" },
                { "<leader>t",  group = "TODO / Temas" },
                { "<leader>c",  group = "Código / Clipboard" },
                { "<leader>r",  group = "Renombrar / LSP" },
                { "<leader>fm", group = "Formatear" },
                { "<leader>m",  group = "Markdown" },
                { "<leader>d",  group = "Diagnósticos" },
            },
        },
        keys = {
            { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Which-key: Atajos del buffer" },
        },
    },
}
