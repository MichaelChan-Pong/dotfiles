vim.g.mapleader = " "

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Save
keymap("n", "<Leader>w", ":w<CR>", opts)

-- Horizontal split
keymap("n", '<C-w>"', ":split<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Leader>bl", ":bnext<CR>", opts)
keymap("n", "<Leader>bh", ":bprevious<CR>", opts)
keymap("n", "<Leader>bn", ":new<CR>", opts)
keymap("n", "<Leader>bw", ":bwipeout<CR>", opts)

-- Navigate tabs
keymap("n", "<Leader>tl", ":tabnext<CR>", opts)
keymap("n", "<Leader>th", ":tabprevious<CR>", opts)
keymap("n", "<Leader>tn", ":tabnew<CR>", opts)
keymap("n", "<Leader>tw", ":tabclose<CR>", opts)

-- Clear highlights
keymap("n", "<leader>/", "<cmd>nohlsearch<CR>", opts)

-- Erase trailing whitespace
keymap("n", "<F5>", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>", opts)

-- Vimux
keymap("n", "<Leader>rr", ":VimuxPromptCommand<CR>", opts)
keymap("n", "<Leader>rt", ":VimuxRunCommand(\"npm run test\")<CR>", opts)
keymap("n", "<Leader>rs", ":VimuxRunCommand(\"npm start\")<CR>", opts)
keymap("n", "<Leader>rc", ":VimuxInterruptRunner<CR>", opts)
keymap("n", "<Leader>rw", ":VimuxCloseRunner<CR>", opts)
keymap("n", "<Leader>ri", ":VimuxInspectRunner<CR>", opts)

-- Undotree
keymap("n", "<Leader>u", ":UndotreeToggle<CR>", opts)

-- Maximizer
keymap("n", "<Leader>z", ":MaximizerToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>g", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>p", ":Telescope projects<CR>", opts)
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)

-- Nvimtree
keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)

-- Visual --
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
