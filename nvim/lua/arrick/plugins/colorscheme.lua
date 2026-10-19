return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 1,
				ui_contrast = "high",
				colours_override = function(palette)
					palette.red = "#E6686A"
					palette.orange = "#E68F62"
					palette.yellow = "#DDBB70"
					palette.green = "#9FBC72"
					palette.aqua = "#72BE8C"
					palette.blue = "#6EB7B5"
					palette.purple = "#D28EAD"
					palette.bg_visual = "#384D19"
				end,
			})
			vim.cmd([[colorscheme everforest]])
		end,
	},
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("solarized-osaka").setup({
	-- 			transparent = true,
	-- 			terminal_colors = true,
	-- 		})
	-- 		vim.cmd([[colorscheme solarized-osaka]])
	-- 	end,
	-- },
	-- {
	-- 	"jpwol/thorn.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("thorn").setup(opts)
	-- 		vim.cmd([[colorscheme thorn]])
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Optionally configure and load the colorscheme
	-- 		-- directly inside the plugin declaration.
	-- 		--
	-- 		vim.g.gruvbox_material_foreground = "material"
	-- 		vim.g.gruvbox_material_enable_italic = true
	-- 		vim.g.gruvbox_material_transparent_background = 1
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent_mode = true,
	-- 	},
	-- },
}
