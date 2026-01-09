return {
	"neovim/nvim-lspconfig",
	dependencies = { "nvimdev/lspsaga.nvim" },
	config = function()
		vim.lsp.enable("bashls")
		vim.lsp.enable("eslint")
		vim.lsp.enable("jinja_lsp")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nixd")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("sqls")
		vim.lsp.enable("taplo")
		vim.lsp.enable("ts_ls")

		vim.lsp.config("eslint", {
			settings = { useFlatConfig = true },
		})
		local flakeExpr = '(builtins.getFlake "' .. vim.fn.expand("$HOME/347OS") .. '")'
		vim.lsp.config("nixd", {
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

		vim.lsp.config("rust_analyzer", {
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
					check = {
						command = "clippy",
					},
				},
			},
		})
	end,
}
