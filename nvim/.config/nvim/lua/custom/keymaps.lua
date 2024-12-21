vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- lsp related keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {noremap=true, silent=true})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {noremap=true, silent=true})
vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>rf",  vim.lsp.buf.references, {noremap=true, silent=true})
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end)

-- best keymaps ever
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

-- neotest keymaps
local neotest = require("neotest")
vim.keymap.set("n", "<leader>rt", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end)
vim.keymap.set("n", "<leader>to", function() neotest.output.open({enter=true}) end)

-- toggle terminal
vim.keymap.set({"n","t"}, "<leader>j", function() ToggleTerminal() end)
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- go to previous file
vim.keymap.set("n", "<leader>-", "<C-^>")
