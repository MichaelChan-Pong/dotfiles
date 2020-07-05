" Tab shortcuts
map <Leader>tl :tabnext<CR>
map <Leader>th :tabprevious<CR>
map <Leader>tn :tabnew<CR>
map <Leader>tw :tabclose<CR>

" Buffer shortcuts
map <Leader>bl :bnext<CR>
map <Leader>bh :bprevious<CR>
map <Leader>bn :new<CR>
map <Leader>bw :bwipeout<CR>

" Disable search highlighting after search
map <Leader>/ :noh<CR>

" Shortcut to write
map <Leader>w :w<CR>

" Shortcuts for Vimux
map <Leader>rr :VimuxPromptCommand<CR>
map <Leader>rt :VimuxRunCommand("npm run test")<CR>
map <Leader>rs :VimuxRunCommand("npm start")<CR>
map <Leader>rp :VimuxRunCommand("python3 " . @%)<CR>
map <Leader>rc :VimuxInterruptRunner<CR>
map <Leader>rw :VimuxCloseRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>k :VimuxScrollUpInspect<CR>
map <Leader>j :VimuxScrollDownInspect<CR>

" FZF
map <C-f> :Lines<CR>
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>m :Marks<CR>

" Undotree
map <leader>u :UndotreeToggle<CR>
