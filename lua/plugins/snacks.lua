return {
	{
		"folke/snacks.nvim",
		optional = true,
		opts = {
			notifier = {
				top_down = false,
			},
			picker = {
				sources = {
					explorer = {
						layout = { layout = { position = "right" } },
					},
					keymaps = {
						layout = {
							preset = "vertical",
							layout = {
								width = 0.6,
							},
						},
					},
				},
			},
		},
	},
}
