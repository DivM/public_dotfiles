require("conform").setup({
	-- Conform can run multiple formatters sequentially
	-- python = { "isort", "black" },
	-- Use a sub-list to run only the first available formatter
	-- javascript = { { "prettierd", "prettier" } },
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		sh = { "beautysh" },
		zsh = { "beautysh" },
		bash = { "beautysh" },
		-- html = { "prettier" },
		htmldjango = { "djlint" },
	},

	format_on_save = {
		-- timeout_ms = 500,
		lsp_fallback = true,
	},
})
