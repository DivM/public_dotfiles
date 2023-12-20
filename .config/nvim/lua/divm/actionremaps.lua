--------------- File Actions: Rename, Delete (Trash), Duplicate, Move ---------------
-- TODO: move all functions to fileactions.lua and keep remaps here.
--
-- Look into:
-- https://github.com/stevearc/oil.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim

-- custom function to trash the file currently open in buffer.
-- uses macos `trash` utility installed using brew.
local function trash_current_file()
	if vim.fn.executable("trash") == 0 then
		print("trash is not an executable. install using `brew install trash` on macos.")
		return
	end
	local confirm = vim.fn.confirm("Trash current file? (" .. vim.fn.expand("%") .. ")", "&yes\n&no", 2)
	if confirm == 1 then
		vim.fn.jobstart("trash -F" .. ' "' .. vim.fn.expand("%") .. '"', { detach = true })
		vim.api.nvim_buf_delete(0, { force = true })
	end
end

vim.keymap.set("n", "<leader>ft", trash_current_file, { desc = "[F]ile Action - [T]rash" })

-- custom function to delete the file currently open in buffer.
local function delete_current_file()
	local confirm =
		vim.fn.confirm("Permanently delete the current file? (" .. vim.fn.expand("%") .. ")", "&yes\n&no", 2)
	if confirm == 1 then
		os.remove(vim.fn.expand("%"))
		vim.api.nvim_buf_delete(0, { force = true })
	end
end

vim.keymap.set("n", "<leader>f<BS>", delete_current_file, { desc = "[F]ile Action - Delete" })

-- custom function to rename the file currently open in buffer.
local function rename_current_file()
	local current_dir = vim.fn.expand("%:h")
	print("current_dir:" .. current_dir)
	local current_filename = vim.fn.expand("%:t")
	print("current_filename:" .. current_filename)
	local changed_filename = vim.fn.input("Enter new name:\n" .. current_dir .. "/", current_filename)
	if current_filename == changed_filename then
		vim.fn.print("Filename is same. Skipping.")
	else
		-- TODO: Put a filter to check if changed_filename exists and get user_confirmation for replacement
		os.rename(current_dir .. "/" .. current_filename, current_dir .. "/" .. changed_filename)
		vim.api.nvim_buf_delete(0, { force = true })
		-- TODO: Replace buffer with the new file
		-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/actions/node/open-file.lua#L269
	end
end

vim.keymap.set("n", "<leader>fr", rename_current_file, { desc = "[F]ile Action - [R]ename" })

-- TODO: Functions + Remaps for move and duplicate

-- https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>Dj", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>Dk", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>Dm", vim.diagnostic.open_float, { desc = "Open floating [D]iagnostic [M]essage" })
vim.keymap.set("n", "<leader>Dl", vim.diagnostic.setloclist, { desc = "Open [D]iagnostics [L]ist" })

vim.keymap.set("n", "<C-q>", "<CMD>bd<CR>", { desc = "Close ([Q]uit) Current Buffer" })

-- // goto definition
-- { "before": ["g", "d" ], "commands": ["editor.action.revealDefinition","workbench.action.moveEditorToNextGroup"] },
-- // peek definition and references
-- { "before": ["<leader>", "g", "d" ], "commands": ["editor.action.peekDefinition"] },
-- { "before": ["<leader>", "g", "R" ], "commands": ["editor.action.goToReferences"] },
-- // rename symbol
-- { "before": [ "<leader>", "r" ], "commands": ["editor.action.rename"] },
-- // fuzzy search in files
-- { "before": [ "<leader>", "/" ], "commands": ["find-it-faster.findWithinFiles"] },
-- // easy search and replace in file (different from <C-r> rename)
-- { "before": [ "<leader>", "s" ],
-- "after": [ ":", "%", "s", "/", "\\", "<", "<C-r>", "<C-w>", "\\", ">", "/", "<C-r>", "<C-w>", "/", "g", "I",
-- "<Left>", "<Left>", "<Left>", ]},
-- { "before": ["<C-n>"], "commands": [ ":nohl"] },
-- // compile, execute and other actions
-- // TODO Add other languages - c, cpp, golang
-- { "before": ["<leader>", "e" ],"when":["editorLangId == 'python'"], "commands": ["python.execInTerminal-icon"] },
-- // { "before": ["<leader>", "e" ],"when":["editorLangId == 'cpp'"], "commands": ["cpp.execInTerminal-icon"] },
-- // debugging options
-- // main debug actions
-- { "before": ["<leader>", "x", "o"], "commands": ["workbench.action.debug.run"] },// start without debugging
-- { "before": ["<leader>", "x", "s"], "commands": ["workbench.action.debug.start"] },
-- { "before": ["<leader>", "x", "q"], "commands": ["workbench.action.debug.stop"] },
-- { "before": ["<leader>", "x", "r"], "commands": ["workbench.action.debug.restart"] },
-- { "before": ["<leader>", "x", "p"], "commands": ["workbench.action.debug.pause"] },
-- { "before": ["<leader>", "x", "c"], "commands": ["workbench.action.debug.continue"] },
-- { "before": ["C-c"], "when":"inDebugMode", "commands": ["workbench.action.debug.continue"] },
-- { "before": ["<leader>", "x", "d"], "commands": ["workbench.action.debug.disconnect"] },
-- // breakpoints, step in, out, and over
-- { "before": ["<leader>", "x", "b"], "commands": ["editor.debug.action.toggleBreakpoint"] },
-- { "before": ["<leader>", "x", "B"], "commands": ["workbench.debug.viewlet.action.removeAllBreakpoints"] },
-- { "before": ["<leader>", "x", "g", "n"], "commands": ["editor.debug.action.goToNextBreakpoint"] },
-- { "before": ["<leader>", "x", "g", "p"], "commands": ["editor.debug.action.goToPreviousBreakpoint"] },
-- { "before": ["<leader>", "x", "l"], "commands": ["workbench.action.debug.stepInto"] },
-- { "before": ["C-l"], "when":"inDebugMode", "commands": ["workbench.action.debug.stepInto"] },
-- { "before": ["<leader>", "x", "h"], "commands": ["workbench.action.debug.stepOut"] },
-- { "before": ["C-h"], "when":"inDebugMode", "commands": ["workbench.action.debug.stepOut"] },
-- { "before": ["<leader>", "x", "j"], "commands": ["workbench.action.debug.stepOver"] },
-- { "before": ["C-j"], "when":"inDebugMode", "commands": ["workbench.action.debug.stepOver"] },
-- { "before": ["<leader>", "x", "w"], "commands": ["editor.debug.action.selectionToWatch"] },
-- { "before": ["<leader>", "x", "W"], "commands": ["workbench.debug.viewlet.action.removeAllWatchExpressions"] },
-- ],

-- nnoremap("<C-z>", "<Cmd>silent !font-switcher; kill -SIGUSR1 $(ps -A | grep 'kitty$' | awk '{print $1}')<CR>")
-- nnoremap("<C-b>", "<Cmd>silent !font-switcher -d; kill -SIGUSR1 $(ps -A | grep 'kitty$' | awk '{print $1}')<CR>")
-- nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--
--
-- -- easier to enter normal mode
-- inoremap("jk", "<Esc>")
--
-- -- Movement
-- xnoremap(
--   "n",
--   [[:<c-u>let temp_variable=@"<CR>gvy:<c-u>let @/='\V<C-R>=escape(@",'/\')<CR>'<CR>:let @"=temp_variable<CR>]],
--   silent
-- )
--
-- -- built in terminal
-- nnoremap("<leader>t", "<Cmd>sp<CR> <Cmd>term<CR> <Cmd>resize 20N<CR> i", silent)
-- tnoremap("<C-c><C-c>", "<C-\\><C-n>", silent)
-- tnoremap("<D-v>", function()
--   local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>\"+pi", true, false, true)
--   vim.api.nvim_feedkeys(keys, "n", false)
-- end, silent)
--
-- -- misc
-- nnoremap("<leader><C-o>", "<Cmd>!open %<CR><CR>", silent)
--
-- -- Running Code
-- nnoremap("<leader>cb", "<Cmd>Build<CR>", silent)
-- nnoremap("<leader>cd", "<Cmd>DebugBuild<CR>", silent)
-- nnoremap("<leader>cl", "<Cmd>Run<CR>", silent)
-- nnoremap("<leader>cr", "<Cmd>Ha<CR>", silent)

------------------------------------------------------------------------------------------------------------------------
-- Experimenting with user defined functions
-- TODO: Read https://neovim.io/doc/user/lua-guide.html#lua-guide-commands-create

-- Defining global variable (function) Test_function which can be called using :lua Test_function()
function Test_function()
	print("Test Function was called!")
end
