return {
    -- Preview de Markdown en el navegador con hot-reload
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown: Preview en navegador" },
        },
        config = function()
            vim.g.mkdp_auto_start   = 0   -- no abrir automáticamente
            vim.g.mkdp_auto_close   = 1   -- cerrar al cambiar de buffer
            vim.g.mkdp_refresh_slow = 0   -- refresco en tiempo real
            vim.g.mkdp_browser      = ""  -- navegador por defecto del sistema
            vim.g.mkdp_port         = "8888"
            vim.g.mkdp_theme        = "dark"
        end,
    },
}
