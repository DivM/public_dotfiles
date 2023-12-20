local gc = require("helpers.global_commands")

vim.keymap.set("n", "<leader>e", function()
	vim.cmd("echo 'Hello, Go User'")

	local file_dir = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t")

	-- TODO: need to run main.go in the workspace instead of just the currently active file

	-- vim.fn.jobstart(
	-- 	gc.TMUX_SENDKEYS .. " 'clear; cd " .. file_dir .. "; go run " .. file_name .. "; '",
	-- 	{ detach = true }
	-- )
end, { buffer = true })
