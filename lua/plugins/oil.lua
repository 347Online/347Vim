return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, bufnr)
				if
					string.match(name, "^%.git$")
					or string.match(name, "^node_modules$")
					or string.match(name, "^%.%.$")
					or string.match(name, "^%.stfolder$")
					or string.match(name, "^%.DS_Store$")
					or string.match(name, "^%.obsidian$")
				then
					return true
				end

				return false
			end,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
