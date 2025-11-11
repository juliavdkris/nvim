vim.keymap.set("n", "<leader>so", function()
	Snacks.picker.smart({
		cwd = "~/Documents/notes/",
		title = "Obsidian vault",
	})
end, { desc = "[s]earch [o]bsidian vault" })

-- TODO: is there a way to fuzzy grep with snacks picker?
vim.keymap.set("n", "<leader>sO", function()
	Snacks.picker.grep({
		cwd = "~/Documents/notes/",
		title = "Obsidian vault",
	})
end, { desc = "[s]earch [O]bsidian vault" })

return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"markdown-oxide",
			},
		},
	},
}
