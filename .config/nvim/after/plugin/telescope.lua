local tls_builtin = require("telescope.builtin")

-- require('telescope').setup{
-- 	defaults = {
-- 		vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading',
-- 		'--with-filename', '--line-number', '--column', '--smart-case' },
--
local telescope = require("telescope")
telescope.setup({
	pickers = {
		find_files = { hidden = true },
	},
	defaults = {
		file_ignore_patterns = {
			-- git files
			-- ".*/%.git/.*",
			"%.git/.*",
			-- python package files
			"__pycache__",
			"egg-info",
		},
	},
})

vim.keymap.set("n", "<leader><leader>", tls_builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<C-b>", tls_builtin.buffers, { desc = "Search [B]uffer" })
vim.keymap.set("n", "<leader>gg", tls_builtin.git_files, { desc = "Search [G]it Files" })
vim.keymap.set("n", "<leader>H", tls_builtin.help_tags, { desc = "Search [H]elp" })

vim.keymap.set("n", "<leader>/", tls_builtin.live_grep, { desc = "Search Workspace using Grep" })
vim.keymap.set("n", "<leader>*", tls_builtin.grep_string, { desc = "Search current-word in workspace" })

vim.keymap.set("n", "<leader>sd", tls_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>tr", tls_builtin.resume, { desc = "[T]elescope Search [R]esume" })
vim.keymap.set("n", "<leader>th", tls_builtin.highlights, { desc = "[T]elescope [H]ighlights" })

vim.keymap.set("n", "<leader>m", tls_builtin.man_pages, { desc = "Telescope [M]an Pages" })
