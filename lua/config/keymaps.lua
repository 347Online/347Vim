vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "-", ":Oil<CR>")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>") -- see plugins/lazygit.lua:keys
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")

vim.keymap.set("n", "K", ":LspUI hover<CR>", { silent = true })
vim.keymap.set("n", "grn", ":LspUI rename<CR>", {})
vim.keymap.set("n", "gd", ":LspUI definition<CR>", {})
vim.keymap.set("n", "gt", ":LspUI type_definition<CR>", {})
vim.keymap.set("n", "gi", ":LspUI implementation<CR>")
vim.keymap.set("n", "gr", ":LspUI reference<CR>")

vim.keymap.set("n", "<leader>f?", ":Telescope<CR>", {})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {})
vim.keymap.set("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set("n", "<leader>fr", ":Telescope registers<CR>", {})
