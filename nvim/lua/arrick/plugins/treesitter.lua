return {
    "nvim-treesitter/nvim-treesitter",
    commit = "0e21ee8df6235511c02bab4a5b391d18e165a58d", -- versión estable con Neovim 0.12.5
    pin = true,                                          -- no actualizar hasta verificar compatibilidad
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                -- markdown usa injecciones pesadas que crashean en Neovim 0.12.5
                -- se usa markdown-preview.nvim en su lugar para visualizar .md
                disable = { "markdown", "markdown_inline" },
            },
            ensure_installed = {
                -- Lenguajes base
                "lua",
                "vim",
                "vimdoc",

                -- Web
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "svelte",
                "graphql",

                -- Backend / General
                "python",
                "c",
                "cpp",
                "java",

                -- Datos / Config
                "json",
                "yaml",
                "toml",
                -- markdown deshabilitado: crashea con injecciones en Neovim 0.12.5

                -- Shell
                "bash",

                -- Flutter / Dart
                "dart",

                -- Prisma
                "prisma",
            },
            indent = { enable = true },
        })
    end,
}
