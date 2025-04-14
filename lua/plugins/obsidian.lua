vim.keymap.set("n", "<leader>so", function()
	Snacks.picker.smart({
		cwd = "~/Documents/notes/",
		title = "Obsidian vault",
	})
end, { desc = "[S]earch [O]bsidian vault" })

return {
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"markdown-oxide",
			},
		},
	},
}
