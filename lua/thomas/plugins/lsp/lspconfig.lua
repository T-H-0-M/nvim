return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = {},
			float = {
				border = "rounded", -- Rounded borders for the floating windows (aesthetic)
				source = "always", -- Include the source of diagnostics in the display
				wrap = true, -- Crucial: enable text wrapping within floating windows
				max_width = 80, -- Set a max width to prevent messages from running off the screen
			},
			severity_sort = true, -- Sort messages by severity for better visibility
			underline = true, -- Continue to underline errors
			update_in_insert = false, -- Avoid updating diagnostics while typing
		})

		-- Create a custom highlight group for the hover window
		vim.cmd([[
		  highlight LspHoverWindow ctermbg=none guibg=#2e3440
		]])

		-- Configure the hover handler
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
			max_width = 80,
			max_height = 20,
			focusable = false,
			style = "minimal",
			float = {
				border = "rounded",
				highlight = "LspHoverWindow",
				winblend = 0,
			},
		})
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			-- Configuration for TypeScript (tsserver)
			["tsserver"] = function()
				lspconfig["tsserver"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						-- TypeScript server-specific settings or event handlers
					end,
				})
			end,

			-- Configuration for Java (jdtls)
			["jdtls"] = function()
				lspconfig["jdtls"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						-- Java server-specific settings or event handlers
					end,
					-- Additional settings can be specified here according to jdtls documentation
				})
			end,

			-- Configuration for Markdown (marksman)
			["marksman"] = function()
				lspconfig["marksman"].setup({
					capabilities = capabilities,
					filetypes = { "markdown" }, -- Ensure 'markdown' is listed as a filetype
				})
			end,

			["pyright"] = function()
				local homebrew_python = "/opt/homebrew/bin/python3"
				local venv_path = vim.fn.getenv("VIRTUAL_ENV")

				if venv_path and type(venv_path) == "string" and venv_path ~= "" then
					-- Using virtual environment paths
					local site_packages_path = venv_path .. "/lib/python3.11/site-packages" -- specifically using Python 3.11
					lspconfig["pyright"].setup({
						capabilities = capabilities,
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									extraPaths = { site_packages_path },
									typeCheckingMode = "basic",
								},
								pythonPath = venv_path .. "/bin/python", -- Using the virtual environment Python
							},
						},
						on_attach = function(client, bufnr)
							vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end,
					})
				else
					-- Using Homebrew Python as default if no VENV is found
					lspconfig["pyright"].setup({
						capabilities = capabilities,
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									extraPaths = { "/opt/homebrew/lib/python3.11/site-packages" }, -- Corrected path for Python 3.11
									typeCheckingMode = "basic",
								},
								pythonPath = homebrew_python,
							},
						},
						on_attach = function(client, bufnr)
							vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end,
					})
				end
			end,
			["ltex"] = function()
				lspconfig.ltex.setup({
					capabilities = capabilities,
					filetypes = { "markdown", "tex", "plaintext" }, -- Specify filetypes here
					settings = {
						ltex = {
							enabled = { "latex", "tex", "bib", "markdown" },
							language = "en",
							diagnosticSeverity = "information",
							setenceCacheSize = 2000,
							additionalRules = {
								enablePickyRules = true,
								motherTongue = "en",
							},
						},
					},
				})
			end,
		})
	end,
}
