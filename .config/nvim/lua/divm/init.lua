require("divm.lazy")

-- Set <space> as the <leader> key; See `:help mapleader`
-- Note: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("divm.plugins", {
	ui = {
		-- The border to use for the UI window. Accepts same border values as nvim_open_win().
		border = "rounded",
	},
})

require("divm.set")

require("divm.bufferremaps")
require("divm.actionremaps")

GLOBAL_TMUX_COMMAND = "/Users/dkm/Documents/githubRepos/dotfiles/scripts/mac/run_command_in_tmux.sh"
