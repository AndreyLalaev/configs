return {
	{
		"tomasiser/vim-code-dark",

		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme codedark]])
		end,
	},

	{
		"vim-airline/vim-airline",
		config = function()
			vim.g["airline#extensions#tabline#enabled"] = 1
			vim.g["airline#extensions#whitespace#enabled"] = 0
			vim.g.airline_powerline_fonts = 1

			-- unicode
			vim.g.airline_left_sep = '»'
			vim.g.airline_left_sep = '▶'
			vim.g.airline_right_sep = '«'
			vim.g.airline_right_sep = '◀'
			vim.g.airline_symbols.linenr = '␊'
			vim.g.airline_symbols.linenr = '␤'
			vim.g.airline_symbols.linenr = '¶'
			vim.g.airline_symbols.branch = '⎇'
			vim.g.airline_symbols.paste = 'ρ'
			vim.g.airline_symbols.paste = 'Þ'
			vim.g.airline_symbols.paste = '∥'
			vim.g.airline_symbols.whitespace = 'Ξ'

			-- airline symbols
			vim.g.airline_left_sep = ''
			vim.g.airline_left_alt_sep = ''
			vim.g.airline_right_sep = ''
			vim.g.airline_right_alt_sep = ''
			vim.g.airline_symbols.branch = ''
			vim.g.airline_symbols.readonly = ''
			vim.g.airline_symbols.linenr = ''

			vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
			vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
		end,
	},
	{
		"vim-airline/vim-airline-themes"
	},

	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"sindrets/diffview.nvim",
			-- For a custom log pager
			"m00qek/baleia.nvim",
			"ibhagwan/fzf-lua",
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
		}
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},
}
