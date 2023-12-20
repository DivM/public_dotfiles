local gc = require("helpers.global_commands")

vim.keymap.set("n", "<leader>e", function()
	vim.cmd("echo 'Hello, Python User'")
	-- print("Hello again, Python User")

	local file_dir = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t")

	vim.fn.jobstart(
		gc.TMUX_SENDKEYS .. " 'clear; cd " .. file_dir .. "; python " .. file_name .. "; '",
		{ detach = true }
	)
end, { buffer = true })

-- vim.fn.jobstart(TMUX_COMMAND .. " cd " .. file_dir, {
-- 	on_exit = function(job_id, exit_code, event)
-- 		vim.fn.jobstart(TMUX_COMMAND .. " python " .. file_name, { detach = true })
-- 	end,
-- 	detach = true,
-- })
