return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function get_center_coords()
			local screen_width = vim.opt.columns:get()
			local screen_height = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local width = math.floor(screen_width * 0.8)
			local height = math.floor(screen_height * 0.8)
			local row = math.floor((screen_height - height) / 2)
			local col = math.floor((screen_width - width) / 2)
			return width, height, row, col
		end

		nvimtree.setup({
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local width, height, row, col = get_center_coords()
						return {
							relative = "editor",
							border = "rounded",
							width = width,
							height = height,
							row = row,
							col = col,
							zindex = 100,
						}
					end,
				},
				width = 50,
				relativenumber = true,
			}, -- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
