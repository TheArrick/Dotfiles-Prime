return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,

            },
            ensure_installed = {

                "lua",
                "c"

            },
            indent = { enable = true },
        })
    end,
}
