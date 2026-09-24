return {
    "danarth/sonarlint.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("sonarlint").setup({
            server = {
                cmd = {
                    "sonarlint-language-server",
                    "-stdio",
                    "-analyzers",
                    vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarjs.jar"),
                    vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarhtml.jar"),
                    vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarpython.jar"),
                    vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarjava.jar"),
                },
            },
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "html",
                "python",
                "java",
            },
        })

    end,
}