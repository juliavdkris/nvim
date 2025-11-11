return {
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				tinymist = {
					filetypes = { "typ", "typst" },
				},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"tinymist",
			},
		},
	},
	{
		"chomosuke/typst-preview.nvim",
		version = "1.*",
		opts = {
			dependencies_bin = { ["tinymist"] = "tinymist" },
		},
	},
}
