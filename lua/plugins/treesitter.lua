local ensureInstalled = {
	"bash",
	"javascript",
	"json",
	"lua",
	"rust",
	"tsx",
	"typescript",
	"css",
	"html",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",

	main = "nvim-treesitter",

	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
}
