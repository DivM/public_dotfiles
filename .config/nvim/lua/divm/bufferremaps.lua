-- DEFAULT KEYMAPS / COMMANDS TO REMEMBER
-- :bd - [B]uffer [D]elete

------------------------------------------------------------------------------------------------

vim.keymap.set({ "n", "v", "o" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "L", "$", { noremap = true, silent = true })

-- // moving inside a parantheses
-- { "before": [ "<leader>", "A" ], "after": [ "v", "i", "b", "<Esc>", "a" ] },
-- { "before": [ "<leader>", "I" ], "after": [ "v", "i", "b", "o", "<Esc>", "i" ] },
-- { "before": [ "<leader>", "^" ], "after": [ "m", "m", "v", "i", "b", "`", "m"] },
-- { "before": [ "<leader>", "$" ], "after": [ "m", "m", "v", "i", "b", "o","`", "m"] },

-- center the screen after moving
vim.keymap.set({ "n", "v" }, "<c-d>", "<c-d>zz")
vim.keymap.set({ "n", "v" }, "<c-u>", "<c-u>zz")
vim.keymap.set({ "n", "v" }, "{", "{zz")
vim.keymap.set({ "n", "v" }, "}", "}zz")
vim.keymap.set({ "n", "v" }, "n", "nzz")
vim.keymap.set({ "n", "v" }, "N", "Nzz")

-- J (Join) command will keep the cursor at the beginning
vim.keymap.set({ "n" }, "J", "mzJ`z")

-- using J & K for moving selected text up and down, <leader>J mapped for joining instead
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move to 2 lines above the start visual marker (<)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move to 1 line below the close visual marker (>)
vim.keymap.set({ "v" }, "<leader>J", "mzJ`z")

-- inserting new line above and below
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- copy, paste delete and go-replace in system-clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>gr", '"+gr')

-- paste but not replace the register
vim.keymap.set("v", "P", "pgvy")
vim.keymap.set("v", "<leader>P", '"+pgvy') -- with system-clipboard

-- keep selection after indent, de-indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- [EXPERIMENTAL] <C-n> to clear highlights (nohl)
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)

-- <C-n> & <C-p> for moving up and down the QuickFix List
vim.keymap.set({ "n", "v" }, "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set({ "n", "v" }, "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set({ "n", "v" }, "<leader><C-n>", "<cmd>lnext<CR>zz")
vim.keymap.set({ "n", "v" }, "<leader><C-p>", "<cmd>lprev<CR>zz")
