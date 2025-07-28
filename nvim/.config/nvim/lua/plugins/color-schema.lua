return {
	{ "catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		require("catppuccin").setup()
	end
},
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		opts ={style = "deep", transparent=false},
	},
	"rebelot/kanagawa.nvim",
	{
		"shaunsingh/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function() 
			vim.opt.termguicolors = true
		end,
	}
}
