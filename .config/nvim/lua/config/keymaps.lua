-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local map = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Normal --
-- Save
map("n", "<Leader>w", ":w<CR>", opts)

-- Horizontal split
map("n", '<C-w>"', ":split<CR>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<Leader>bl", ":bnext<CR>", opts)
map("n", "<Leader>bh", ":bprevious<CR>", opts)
map("n", "<Leader>bn", ":new<CR>", opts)
map("n", "<Leader>bw", ":bwipeout<CR>", opts)

-- Navigate tabs
map("n", "<Leader>tl", ":tabnext<CR>", opts)
map("n", "<Leader>th", ":tabprevious<CR>", opts)
map("n", "<Leader>tn", ":tabnew<CR>", opts)
map("n", "<Leader>tw", ":tabclose<CR>", opts)

-- Clear highlights
map("n", "<leader>/", "<cmd>nohlsearch<CR>", opts)

-- Erase trailing whitespace
map("n", "<F5>", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>", opts)

-- Vimux
map("n", "<Leader>rr", ":VimuxPromptCommand<CR>", opts)
map("n", "<Leader>rt", ':VimuxRunCommand("dotnet test")<CR>', opts)
map("n", "<Leader>rs", ':VimuxRunCommand("dotnet run")<CR>', opts)
map("n", "<Leader>rc", ":VimuxInterruptRunner<CR>", opts)
map("n", "<Leader>rw", ":VimuxCloseRunner<CR>", opts)
map("n", "<Leader>ri", ":VimuxInspectRunner<CR>", opts)

-- Maximize
Snacks.toggle.zoom():map("<leader>z")
Snacks.toggle.zen():map("<leader>Z")

-- vim-table-mode
map("n", "<Leader>\\", ":TableModeToggle<CR>", opts)

-- Comment
map("n", "<leader>c<leader>", "<cmd>normal gcc<cr>", { silent = true, desc = "Comment current line" })

-- Visual --
-- Better paste
map("v", "p", '"_dP', opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Comment
map("v", "<leader>c", "<cmd>normal gc<cr>", { silent = true, desc = "Comment selection" })

vim.keymap.del("n", "s")
vim.keymap.del("n", "S")
vim.keymap.del("v", "s")
vim.keymap.del("v", "S")
