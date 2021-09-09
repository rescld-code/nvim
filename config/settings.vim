let mapleader = ","

" 行号设置 ---------- {{{
set number			" 显示绝对行号
set relativenumber	" 显示相对行号
set scrolloff=10	" 屏幕上下保留行
set numberwidth=4	" 设置行号显示宽度
" }}}

" 文本高亮 ---------- {{{
" set syntax=on		" 开启代码高亮
set cursorline		" 高亮光标所在行
set cursorcolumn	" 高亮光标所在列
" }}}

" 文本缩进 ---------- {{{
" set cindent
set tabstop=4
" set autoindent
set shiftround      " 设置文本缩进长度为 shiftwidth 的倍数
set shiftwidth=4
set softtabstop=4

" }}}

" 其他设置 ---------- {{{
set nowrap			" 文本超出屏幕，不换行显示
set showcmd			" 输入命令时，可以使用tab补全
set shortmess-=S	" 右下角显示搜索索引
set whichwrap+=<,>,h,l			" 允许光标自动换行
set clipboard+=unnamedplus		" 使用系统剪辑版
set virtualedit=block,onemore	" 允许光标移动到行尾
" }}}

" 文本查找 ---------- {{{
set hlsearch		" 高亮匹配的文本
set smartcase		" 包含大写字母时，严格匹配
set ignorecase		" 忽略大小写
" }}}
