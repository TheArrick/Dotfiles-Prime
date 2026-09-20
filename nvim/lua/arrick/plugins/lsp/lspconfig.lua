return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Iconos de diagnóstico (API estándar Neovim 0.10+)
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    [vim.diagnostic.severity.INFO]  = " ",
                },
            },
        })

        -- Keymaps al adjuntar un LSP al buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local keymap = vim.keymap

                opts.desc = "Ver referencias LSP"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Ir a declaracion"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Ver definiciones LSP"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Ver implementaciones LSP"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Ver definicion de tipo"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "Ver acciones de codigo"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Renombrar simbolo"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Diagnosticos del buffer"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Diagnostico de la linea"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Documentacion hover"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Reiniciar LSP"
                keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
            end,
        })

        -- Configuracion de servidores con la nueva API (Neovim 0.11+)
        -- vim.lsp.config() reemplaza require('lspconfig').server.setup()
        local servers = {
            html      = { capabilities = capabilities },
            ts_ls     = { capabilities = capabilities },
            cssls     = { capabilities = capabilities },
            svelte    = { capabilities = capabilities },
            graphql   = { capabilities = capabilities },
            prismals  = { capabilities = capabilities },
            pyright   = { capabilities = capabilities },
            hls       = { capabilities = capabilities },
            csharp_ls = { capabilities = capabilities },

            tailwindcss = {
                capabilities = capabilities,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            },

            emmet_ls = {
                capabilities = capabilities,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            },

            clangd = {
                capabilities = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            },

            lua_ls = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        completion  = { callSnippet = "Replace" },
                        workspace   = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")]   = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            },
        }

        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
        end

        vim.lsp.enable(vim.tbl_keys(servers))
    end,
}
