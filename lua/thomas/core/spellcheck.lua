-- Enable spelling
vim.cmd([[set spell]])

-- Set the language for the spell checker
vim.cmd([[set spelllang=en_au]])

-- Only enable spelling in LaTeX files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	command = "setlocal spell",
})

