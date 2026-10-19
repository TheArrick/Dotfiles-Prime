return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- Los servidores se activan a mano en lspconfig.lua; sin esto Mason
            -- enciende todo lo instalado (p. ej. stylua como LSP, ltex-ls).
            automatic_enable = false,
            -- list of servers for mason to install
            ensure_installed = {
                "ts_ls",        -- TypeScript / JavaScript
                "html",         -- HTML
                "cssls",        -- CSS
                "tailwindcss",  -- Tailwind CSS
                "svelte",       -- Svelte
                "lua_ls",       -- Lua
                "graphql",      -- GraphQL
                "emmet_ls",     -- Emmet
                "prismals",     -- Prisma
                "pyright",      -- Python
                "clangd",       -- C / C++
                "hls",          -- Haskell
                "csharp_ls",    -- C#
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",     -- prettier formatter
                "stylua",       -- lua formatter
                "isort",        -- python formatter
                "black",        -- python formatter
                "pylint",       -- python linter
                "eslint_d",     -- js linter
                "clang-format", -- c/c++ formatter
                "sonarlint-language-server", -- SonarLint language server
            },
        })
    end,
}
