local lualine = require("lualine")

lualine.setup({
	opt = true,
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		-- Or, added to the default lualine_b config from here: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
		lualine_b = { "branch", "diff", "diagnostics", "spelunk" },
		lualine_x = { "filetype" },
		lualine_y = {},
	},
})
