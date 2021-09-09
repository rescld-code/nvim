inoremap qq <esc>

" 打开/刷新配置文件 ------- {{{
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>e :edit ~/.config/nvim/init.vim<cr>
" }}}

" 光标跳跃 ---------------- {{{
noremap <a-u> ^
noremap <a-i> $

inoremap <c-b> <ESC>i
inoremap <c-f> <ESC>la
inoremap <c-p> <ESC>ka
inoremap <c-n> <ESC>ja
inoremap <c-e> <ESC>A
inoremap <c-a> <ESC>I
" }}}

" 分屏 -------------------- {{{
nnoremap si <nop>
nnoremap su <nop>
nnoremap <leader>si :split<cr>
nnoremap <leader>su :vsplit<cr> 
nnoremap <leader>wo :only<cr>

" 切换窗口
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" 修改窗口大小
nnoremap <up> :res +5<cr>
nnoremap <down> :res -5<cr>
nnoremap <left> :vertical resize-5<cr>
nnoremap <right> :vertical resize+5<cr>
" }}}

" 标签页 ------------------ {{{
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tn :tabNext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tc :tabclose<cr>
" }}}

nnoremap <F5> :call RunCode()<cr>

