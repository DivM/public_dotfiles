return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				-- enable global statusline (have a single statusline
				-- at bottom of neovim instead of one for  every window).
				-- This feature is only available in neovim 0.7 and higher.
			},
			-- TODO: add CONDA environment to lualine similar to zsh p10k
			sections = {
				lualine_c = {
					{
						"filename",

						file_status = true, -- Displays file status (readonly status, modified status)

						path = 1,
						-- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path

						-- Automatically updates active tab color to match color of other components
						use_mode_colors = false,

						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "[New]", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_y = { {
					"diagnostics",
				} },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
