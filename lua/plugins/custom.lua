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
		"folke/snacks.nvim",
		optional = true,
		opts = {
			notifier = {
				top_down = false,
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
		"theacodes/witchhazel",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "witchhazel-hypercolor"
			colorscheme = "catppuccin",
		},
	},
	{
		"akinsho/git-conflict.nvim",
		opts = {
			disable_diagnostics = true,
		},
	},
}
