" =========================================================
" === Author:       残云cyun <cyun@rescld.cn> =============
" === Github:       https://github.com/rescld-code/nvim ===
" === Create Date:  2021-06-20 ============================
" =========================================================

if empty(glob($HOME.'/.config/nvim/plugged'))
	" 自动安装插件
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

augroup init
	autocmd!

	" 代码折叠
	autocmd FileType vim setlocal foldmethod=marker

	" 打开文件时，恢复上一次关闭文件时光标所在行
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

augroup END

" 加载配置文件
source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/mappings.vim
source ~/.config/nvim/config/snippets.vim

" 加载插件配置
source ~/.config/nvim/config/plugins.vim
