-- all plugins are configured here only. If you need separate configuration, create separate lua files.
return {
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- surround text-objects
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- replace with register (gr action)
	{ "vim-scripts/replacewithregister" },

	-- auto pairs and closes brackets
	-- consider using nvim-autopairs which uses tree-sitter to first find if there's need for a closing bracket
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},

	-- auto-close and
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml" },
			})
		end,
	},
	-- Detect tabstop and shiftwidth automatically using open file and other files in parent dir
	{ "tpope/vim-sleuth" },
}
