return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- markdown = { { command = "prettier", args = { "--tab-width", "4" } } },
				markdown = { "prettier" },
				-- markdown = { { command = "deno_fmt", args = { "--indent-width", "4" } } }, -- Using deno fmt for Markdown with custom indent width
				-- markdown = { "deno_fmt" },
				-- markdown = {
				-- 	{
				-- 		command = "prettier",
				-- 		args = {
				-- 			"--print-width",
				-- 			"80",
				-- 			"--prose-wrap",
				-- 			"always",
				-- 		},
				-- 	},
				-- },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				tex = { "~/.config/nvim/latexindent_wrapper.sh" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
