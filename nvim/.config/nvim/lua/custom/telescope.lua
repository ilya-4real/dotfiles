local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", function ()
	builtin.find_files{
		find_command = {'rg', '--files', '--iglob', '!.git', '--hidden'}
	}
end
)
vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})

