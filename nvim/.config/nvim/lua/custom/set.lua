vim.opt.nu=true
vim.opt.relativenumber=true


vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.smartindent=true
vim.opt.clipboard="unnamedplus"
vim.cmd.colorscheme "gruvbox"
vim.opt.mouse='a'

-- mode is already displayed in statusline
vim.opt.showmode=false

-- save undo history into a file
vim.opt.undofile=true


-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
