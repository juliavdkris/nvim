return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				yamlls = {
					filetypes = { "yaml", "yml" },
					settings = {
						yaml = {
							format = {
								enable = true,
								singleQuote = true,
							},
						},
					},
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				fish = {},
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				markdown = {},
			},
		},
	},
}
