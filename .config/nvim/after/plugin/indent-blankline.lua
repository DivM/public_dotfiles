-- local highlight = {
--     "IndentColor1",
--     "IndentColor2",
--     "IndentColor3",
--     "IndentColor4",
-- }

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentColor1", { fg = "#a700a7" })
    vim.api.nvim_set_hl(0, "IndentColor2", { fg = "#007c00" })
    vim.api.nvim_set_hl(0, "IndentColor3", { fg = "#a8a800" })
    vim.api.nvim_set_hl(0, "IndentColor4", { fg = "#109393" })
end)

require("ibl").setup { indent = { highlight = highlight } }
