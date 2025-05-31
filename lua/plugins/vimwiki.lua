vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
	{
		syntax = "markdown",
		ext = "md",
		path = "~/Sync/Notes/",
	},
}
vim.g.vimwiki_key_mappings = {
	headers = 0,
}

return { "vimwiki/vimwiki" }
