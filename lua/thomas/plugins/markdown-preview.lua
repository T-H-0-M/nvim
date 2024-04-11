return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		-- Setting recognized filetypes
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	config = function()
		-- Abstracting vim.g to a local variable g
		local g = vim.g

		-- Setting configurations for markdown preview
		g.mkdp_auto_start = 0
		g.mkdp_auto_close = 1
		g.mkdp_refresh_slow = 0
		g.mkdp_command_for_global = 0
		g.mkdp_open_to_the_world = 0
		g.mkdp_open_ip = ""
		g.mkdp_browser = ""
		g.mkdp_echo_preview_url = 0
		g.mkdp_browserfunc = ""
		g.mkdp_preview_options = {
			mkit = {},
			katex = {},
			uml = {},
			maid = {},
			disable_sync_scroll = 0,
			sync_scroll_type = "middle",
			hide_yaml_meta = 1,
			sequence_diagrams = {},
			flowchart_diagrams = {},
			content_editable = false,
			disable_filename = 0,
			toc = {},
		}
		g.mkdp_markdown_css = ""
		g.mkdp_highlight_css = ""
		g.mkdp_port = ""
		g.mkdp_page_title = "「${name}」"
		g.mkdp_images_path = "/home/user/.markdown_images"
		g.mkdp_theme = "dark"
		g.mkdp_combine_preview = 0
		g.mkdp_combine_preview_auto_refresh = 1

		-- Setting keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
		keymap.set("n", "<leader>mpo", "<cmd>MarkdownPreview<CR>", { desc = "Open markdown preview" })
		keymap.set("n", "<leader>mps", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
	end,
}
