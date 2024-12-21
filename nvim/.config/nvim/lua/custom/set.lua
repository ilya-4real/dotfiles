vim.opt.nu=true
vim.opt.relativenumber=true


vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.clipboard="unnamedplus"
vim.cmd.colorscheme "onedark"
vim.opt.mouse='a'

-- mode is already displayed in statusline
vim.opt.showmode=false

-- save undo history into a file
vim.opt.undofile=true


-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "80"

-- highlight current line
vim.opt.cursorline = true

-- decrease update time
vim.opt.updatetime = 300
