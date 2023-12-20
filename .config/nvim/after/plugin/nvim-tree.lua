-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- -- set termguicolors to enable highlight groups
-- -- vim.opt.termguicolors = true
--
-- -- empty setup using defaults
-- -- require("nvim-tree").setup()
--
-- -- OR setup with some options
-- require("nvim-tree").setup({
-- 	sort_by = "case_sensitive",
-- 	view = { side = "right", width = 50 },
-- 	renderer = { group_empty = true },
-- 	filters = { dotfiles = false },
-- })
--
-- vim.g.nvim_tree_side = "right"
--
-- -- set keymaps
-- vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree Explorer ([F]ile [F]ocus)" })
-- vim.keymap.set("n", "<leader>ff", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle NvimTree Explorer ([F]ile [F]ocus)" })
-- vim.keymap.set("n", "<leader>fq", "<cmd>NvimTreeClose<CR>", { desc = "[F]ile Explorer Action - [Q]uit" })
