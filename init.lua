vim.g.mapleader = ","

require("config.lazy") -- Must be loaded first

require("config.options")
require("config.keymaps")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
