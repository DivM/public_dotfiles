return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			highlight_overrides = {
				mocha = function(mocha)
					return {
						LineNr = { fg = mocha.rosewater },
						CursorLineNr = { fg = mocha.lavender },
						CursorLine = { bg = mocha.surface0 },
						-- CursorLine = { bg = mocha.mantle},
						WinSeparator = { fg = mocha.lavender },
						CmpBorder = { fg = mocha.blue },
						Pmenu = { bg = mocha.base },
						NormalFloat = { bg = mocha.base },
						TelescopeNormal = { bg = mocha.base },
					}
				end,
			},
		})
		-- load the colorscheme here
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
