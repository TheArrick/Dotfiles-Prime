return { {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("everforest").setup({
            transparent_background_level = 1,
            ui_contrast = "high",
            colours_override = function(palette)
                palette.bg_visual = "#384D19"
            end,
        })
        vim.cmd([[colorscheme everforest]])
    end
}, {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        --
        vim.g.gruvbox_material_foreground = 'material'
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_transparent_background = 1
    end
}

}
