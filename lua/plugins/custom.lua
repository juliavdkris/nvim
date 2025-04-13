return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		optional = true,
		opts = {
			window = {
				position = "right",
			},
		},
	},
	{
		"saghen/blink.cmp",
		optional = true,
		opts = {
			keymap = {
				preset = "super-tab",
			},
		},
	},
	{
		"nvim-lspconfig",
		optional = true,
		opts = {
			inlay_hints = { enabled = false },
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
