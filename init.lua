vim.g.mapleader = ","

require("config.lazy") -- Must be loaded first

require("config.options")
require("config.keymaps")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	callback = function()
		vim.hl.hl_op()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md" },
	command = "setlocal wrap",
})
