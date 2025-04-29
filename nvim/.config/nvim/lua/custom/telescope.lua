local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", function ()
	builtin.find_files{
		find_command = {'rg', '--files', '--iglob', '!.git', '--hidden'}
	}
end, {desc="find files"}
)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc="Telescope live grep"})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {desc="Telescope grep word under the cursor"})

