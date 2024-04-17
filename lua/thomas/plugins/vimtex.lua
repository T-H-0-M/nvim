return {
	{
		"lervag/vimtex",

		-- Configuring LaTeX files with specific settings
		config = function()
			-- Set up the text wrapping and tab settings for LaTeX files
			vim.cmd([[
                augroup latex_settings
                    autocmd!
                    autocmd FileType tex setlocal textwidth=80
                    autocmd FileType tex setlocal wrap
                    autocmd FileType tex setlocal linebreak
                augroup END
            ]])

			-- Setting tab behavior for better formatting control
			vim.bo.tabstop = 4
			vim.bo.shiftwidth = 4
			vim.bo.expandtab = true -- Converts tabs to spaces

			-- Optionally, to ensure these settings are correctly applied to tex files, add:
			vim.cmd([[
                augroup latex_tab_settings
                    autocmd!
                    autocmd FileType tex setlocal tabstop=4 shiftwidth=4 expandtab
                augroup END
            ]])
		end,
	},
}
