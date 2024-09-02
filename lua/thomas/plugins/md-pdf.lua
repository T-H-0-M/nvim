return {
	"arminveres/md-pdf.nvim",
	branch = "main",
	lazy = true,
	keys = {
		{
			"<leader>,",
			function()
				require("md-pdf").convert_md_to_pdf()
			end,
			desc = "Markdown preview",
		},
	},
	config = function()
		require("md-pdf").setup({
			margins = "1.5cm",
			highlight = "tango",
			toc = false,
			preview_cmd = function()
				return "firefox"
			end,
			ignore_viewer_state = false,
			fonts = {
				sans_font = "DejaVuSans",
				mono_font = "IosevkaTerm Nerd Font Mono",
			},
			pandoc_user_args = {
				"-V colorlinks",
				"--standalone=true",
			},
		})
	end,
	opts = {},
}
