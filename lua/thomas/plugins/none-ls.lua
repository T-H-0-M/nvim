return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				require("null-ls").builtins.formatting.prettier,
				require("null-ls").builtins.diagnostics.eslint,
			},
		})
	end,
}
