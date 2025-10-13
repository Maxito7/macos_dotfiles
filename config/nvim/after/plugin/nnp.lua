require("no-neck-pain").setup({
	autocmds = {
		enableOnVimEnter = true,
		enableOnTabEnter = true,
	},
	buffers = {
		setNames = false,
		wo = {
			fillchars = "eob: ",
		},
	},
})
