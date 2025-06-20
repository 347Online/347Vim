-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

local detail = false

return {
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
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
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
				signcolumn = "yes:2",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
}
