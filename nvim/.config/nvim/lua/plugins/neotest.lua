return {
    "nvim-neotest/neotest",
    dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"rouge8/neotest-rust",
    },
	config = function() 
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					runner = "pytest",
					args = {"-v"},
				}),
				require("neotest-rust") {
				},
			}

		})
	end
  }
