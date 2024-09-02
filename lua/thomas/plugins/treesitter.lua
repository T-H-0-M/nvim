return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/playground",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		local parser_install = require("nvim-treesitter.install")
		parser_install.prefer_git = false

		vim.filetype.add({
			extension = {
				cd = "cd24",
			},
		})

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.cd",
			callback = function()
				vim.bo.filetype = "cd24"
				-- Function to extract custom type names
				local function get_custom_types()
					local types = {}
					local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
					for _, line in ipairs(lines) do
						local type_name = line:match("^%s*(%w+)%s+def%s*$")
						if type_name then
							table.insert(types, type_name)
						end
					end
					return types
				end

				-- Get custom types
				local custom_types = get_custom_types()

				local syntax_commands = [[
                    syntax clear

                    " Keywords 
                    syntax keyword cd24Keyword CD24 constants typedef def arraydef main begin end array of func void const
                    syntax keyword cd24Keyword for repeat until do while if else elif switch case default
                    syntax keyword cd24Keyword input return not and or xor func

                    " Built-in functions 
                    syntax keyword cd24BuiltinFunction print printline input

                    " Types 
                    syntax keyword cd24Type int float bool

                    " Boolean literals 
                    syntax keyword cd24Boolean true false

                    " Identifiers 
                    syntax match cd24Identifier "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

                    " Numbers 
                    syntax match cd24Number "\<\d\+\>"
                    syntax match cd24Number "\<0x\x\+\>"
                    syntax match cd24Number "\<0o\o\+\>"
                    syntax match cd24Float "\<\d\+\.\d*\>"
                    syntax match cd24Float "\<\d\+[eE][-+]\?\d\+\>"

                    " Operators 
                    syntax match cd24Operator "[+\-*/%^=<>!&|]"
                    syntax match cd24Operator "\(+\|--\|\*\|\/\|%\)="
                    syntax match cd24Operator "=="
                    syntax match cd24Operator "!="
                    syntax match cd24Operator "<="
                    syntax match cd24Operator ">="

                    " Delimiters 
                    syntax match cd24Delimiter "[(),:\[\].;]"

                    " Strings
                    syntax region cd24String start=/"/ skip=/\\"/ end=/"/ contains=cd24StringInterpolation
                    syntax match cd24StringInterpolation "\${[^}]*}" contained

                    " Comments 
                    syntax match cd24Comment "/--.*$" contains=cd24CommentTodo
                    syntax region cd24Comment start="/\*\*" end="\*\*/" contains=cd24CommentTodo
                    syntax keyword cd24CommentTodo contained TODO FIXME XXX NOTE

                    " Function declarations (updated)
                    syntax match cd24FunctionName "\<func\s\+\zs\w\+\ze\s*(" nextgroup=cd24FunctionParen
                    syntax match cd24FunctionParen "(" contained nextgroup=cd24FunctionParams
                    syntax region cd24FunctionParams start="(" end=")" contained contains=cd24Type,cd24Identifier

                    " Function calls 
                    syntax match cd24FunctionCall "\<\w\+\ze\s*("

                    " Constants TODO remove
                    syntax keyword cd24Constant  E

                    " Error highlighting 
                    syntax match cd24Error "\<\d\+[a-zA-Z_]\+"

                    " Highlight groups
                    highlight default link cd24Keyword Keyword
                    highlight default link cd24Type Type
                    highlight default link cd24CustomType Type
                    highlight default link cd24Identifier Identifier
                    highlight default link cd24Number Number
                    highlight default link cd24Float Float
                    highlight default link cd24Operator Operator
                    highlight default link cd24Delimiter Delimiter
                    highlight default link cd24String String
                    highlight default link cd24StringInterpolation Special
                    highlight default link cd24Comment Comment
                    highlight default link cd24CommentTodo Todo
                    highlight default link cd24FunctionName Function
                    highlight default link cd24FunctionParen Delimiter
                    highlight default link cd24FunctionParams Normal
                    highlight default link cd24FunctionCall Function
                    highlight default link cd24BuiltinFunction Special
                    highlight default link cd24Boolean Boolean
                    highlight default link cd24Constant Constant
                    highlight default link cd24Error Error
                ]]

				-- Add custom types syntax only if there are custom types
				if #custom_types > 0 then
					syntax_commands = syntax_commands
						.. [[

                    " Custom types
                    syntax keyword cd24CustomType ]]
						.. table.concat(custom_types, " ")
						.. [[
                ]]
				end

				vim.cmd(syntax_commands)
				print("CD24 syntax highlighting applied")
			end,
		})

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"java",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"cd24",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25,
				persist_queries = false,
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})
	end,
}
