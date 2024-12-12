vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {noremap=true, silent=true})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {noremap=true, silent=true})

