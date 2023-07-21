vim.opt.nu = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.signcolumn = "yes"

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.mouse = ""
-- vim.opt.clipboard = "unnamedplus"

vim.opt.list = true
vim.opt.listchars = {tab = '▸ ', trail = '·'}

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 500

vim.g.mapleader = " "
