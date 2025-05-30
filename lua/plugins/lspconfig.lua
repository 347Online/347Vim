return {
	"neovim/nvim-lspconfig",
	dependencies = { "nvimdev/lspsaga.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.nixd.setup({
			nixd = {
				formatting = { command = { "nixfmt" } },
				nixpkgs = { expr = "import <nixpkgs> { }" },
				options = {
					darwin = {
						expr = '(builtins.getFlake "/Users/katie/347OS").darwinConfigurations.Athena.options',
					},
					nixos = {
						expr = '(builtins.getFlake "/Users/katie/347OS").nixosConfigurations.Aspen.options',
					},
					user = {
						expr = '(builtins.getFlake "/Users/katie/347OS").packages.aarch64-darwin.homeConfigurations.katie.options',
					},
				},
			},
		})
	end,
}
