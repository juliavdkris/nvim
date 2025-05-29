return {
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			inlay_hints = { enabled = false },
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
				marksman = false,
			},
		},
	},
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"bash-language-server",
			},
		},
	},
}
