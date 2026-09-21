-- Leader key configuration (must be set before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw for nvim-tree compatibility
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Fix: Neovim 0.12.5 activa treesitter automáticamente para .md aunque esté
-- deshabilitado en nvim-treesitter, causando crash en _get_injections.
-- Forzamos detener treesitter al abrir markdown.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function(ev)
		pcall(vim.treesitter.stop, ev.buf)
	end,
})

local opt = vim.opt
local opts = { noremap = true, silent = true }

-- UI & Editor options
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cmdheight = 1
opt.laststatus = 2
opt.cursorline = true
opt.termguicolors = true
opt.completeopt = "menuone,noselect"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.background = "dark"
opt.splitright = true
opt.splitbelow = true

-- Diagnostics
vim.diagnostic.config({ virtual_text = true })

-- General keymaps
vim.keymap.set("n", "<C-x>", "<C-r>", opts)
vim.keymap.set("n", "<leader>cp", ":%y+<CR>", { desc = "Copiar todo el archivo al portapapeles" })
vim.keymap.set("n", "\\cp", ":%y+<CR>", { desc = "Copiar todo el archivo al portapapeles" })

-- Title configuration
vim.o.titlestring = "%f"
vim.o.title = true

-- Autocomandos para template C++
local cpp_template_group = vim.api.nvim_create_augroup("CppTemplate", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	group = cpp_template_group,
	pattern = "*.cpp",
	callback = function()
		local template_path = vim.fn.expand("~/Workspace/Competitiva/Template/template.cpp")
		if vim.fn.filereadable(template_path) == 1 then
			vim.cmd("0r " .. template_path)
		end
	end,
})

-- Auto-renombrar ventana de tmux con el nombre del archivo (solo si se ejecuta dentro de tmux)
if vim.env.TMUX and vim.fn.executable("tmux") == 1 then
	local tmux_group = vim.api.nvim_create_augroup("TmuxAutoRename", { clear = true })

	vim.api.nvim_create_autocmd("BufEnter", {
		group = tmux_group,
		pattern = "*",
		callback = function()
			local filename = vim.fn.expand("%:t")
			if filename ~= "" then
				vim.fn.system("tmux rename-window " .. filename)
			end
		end,
	})

	vim.api.nvim_create_autocmd("BufLeave", {
		group = tmux_group,
		pattern = "*",
		callback = function()
			vim.fn.system("tmux rename-window nvim")
		end,
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		group = tmux_group,
		callback = function()
			local filename = vim.fn.expand("%:t")
			if filename ~= "" then
				vim.fn.system("tmux rename-window " .. filename)
			else
				vim.fn.system("tmux rename-window nvim")
			end
		end,
	})
end
