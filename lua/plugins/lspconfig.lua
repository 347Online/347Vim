return {
	"neovim/nvim-lspconfig",
	dependencies = { "nvimdev/lspsaga.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.bashls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.sqls.setup({})
		lspconfig.taplo.setup({})
		lspconfig.ts_ls.setup({})

		lspconfig.eslint.setup({
			settings = { useFlatConfig = true },
		})
		local flakeExpr = '(builtins.getFlake "' .. vim.fn.expand("$HOME/347OS") .. '")'
		lspconfig.nixd.setup({
			nixd = {
				formatting = { command = { "nixfmt" } },
				nixpkgs = { expr = "import <nixpkgs> { }" },
				options = {
					darwin = {
						expr = flakeExpr .. ".darwinConfigurations.Athena.options",
					},
					nixos = {
						expr = flakeExpr .. ".nixosConfigurations.Aspen.options",
					},
					user = {
						expr = flakeExpr .. ".packages.aarch64-darwin.homeConfigurations.katie.options",
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})
	end,
}
