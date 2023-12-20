vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.opt.smartindent=true
vim.opt.breakindent = true

-- vim.opt.wrap = false

-- I don't understand this right now, so not implementing
-- vim.opt.swapfile = false
-- vim.opt.backup=false
-- vim.opt.undodir= os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile=true
--
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

-- https://vi.stackexchange.com/a/24938/49148
vim.opt.timeoutlen = 1000
vim.opt.updatetime=50

vim.opt.textwidth = 120
-- This looks pretty ugly, so removed it
-- vim.opt.colorcolumn="120"

-- change highlight and line number color of cursor-line
vim.opt.cursorline = true

-- highlight yanked text for 200ms using the "Visual" highlight group
-- https://stackoverflow.com/questions/26069278/highlight-copied-area-in-vim/61950540#61950540
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=150})
augroup END
]]

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes' -- can also use 'number' to have signs overlayed on number line.

-- "vim.sneak": true,
-- "vim.replaceWithRegister": true,
-- "vim.camelCaseMotion.enable": true,
-- "vim.highlightedyank.enable": true, // you can update the color and duration of highlight
-- "vim.whichwrap": "b,s,<,>,h,l,[,]",
-- "vim.visualstar": true,
-- vim.opt.isfname:append("@-@")

