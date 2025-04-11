return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.ts_ls.setup({})

		vim.keymap.set("n", "<leader>ll", vim.lsp.buf.hover, {})
		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	end,
}
