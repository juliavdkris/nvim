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
}
