vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- quickfix menu keymaps
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")



-- lsp related keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {noremap=true, silent=true, desc="Rename variable"})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {noremap=true, silent=true, desc="Go to definition"})
vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, {desc="Signature help"})
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>rf",  vim.lsp.buf.references, {noremap=true, silent=true}, {desc="References"})
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {desc="Diagnostic"})
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, {desc="Code actions"})
vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, {desc="Format buffer"})
vim.keymap.set("n", "<leader>/", "gcc", {remap = true}, {desc="Comment line"})
vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, {desc="Hover with docs"})
vim.keymap.set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {desc="Toggle inlay hints"})


-- best keymaps ever
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

-- neotest keymaps
local neotest = require("neotest")

vim.keymap.set("n", "<leader>rt", function() neotest.run.run() end, {desc="Run the test under cursor"})
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, {desc="Test summary"})
vim.keymap.set("n", "<leader>to", function() neotest.output.open({enter=true}) end, {desc="Test output"})

-- toggle terminal
vim.keymap.set({"n","t"}, "<leader>j", function() ToggleTerminal() end, {desc="Terminal toggle"})
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- go to previous file
vim.keymap.set("n", "<leader>-", "<C-^>")

-- insert mode escape remap
vim.keymap.set("i", "jk", "<esc>")

-- haproon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>u", function() harpoon:list():add() end, {desc="Harpoon add file"})
vim.keymap.set("n", "<leader>i", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc="Harpoon quick menu"})

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, {desc="Harpoon option 1"})
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, {desc="Harpoon option 2"})
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, {desc="Harpoon option 3"})
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, {desc="Harpoon option 4"})


-- git keymaps
vim.keymap.set("n", "<leader>gs",":Git<CR>", {desc="Git status"})
vim.keymap.set("n", "<leader>gb",":Git branch<CR>", {desc="Git branch"})
vim.keymap.set("n", "<leader>gm",":Git blame<CR>", {desc="Git blame"})
vim.keymap.set("n", "<leader>gl",":Git log --graph<CR>", {desc="Git log"})
