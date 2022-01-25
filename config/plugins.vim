
" Plug List    --------------- {{{
call plug#begin('~/.config/nvim/plugged')

" 视觉增强
Plug 'mhartington/oceanic-next' 	" 主题颜色
Plug 'mhinz/vim-startify'			" 启动页面
Plug 'luochen1990/rainbow'			" 彩虹括号
Plug 'junegunn/vim-peekaboo'		" 剪切板宏列表
Plug 'ryanoasis/vim-devicons'		" 文件图标显示
Plug 'itchyny/lightline.vim'		" 底部状态栏
Plug 'itchyny/vim-cursorword'		" 相同单词高亮
Plug 'lfv89/vim-interestingwords'	" 高亮特定单词
Plug 'Yggdroot/indentLine'			" 空格缩进条
Plug 'nine2/vim-indent-guides'		" 制表符缩进条

" 编辑增强
Plug 'rhysd/clever-f.vim'			" 增强f
Plug 'jiangmiao/auto-pairs'			" 自动补全括号
Plug 'mbbill/undotree'				" 撤销树
Plug 'MattesGroeger/vim-bookmarks'	" 书签
Plug 'tpope/vim-surround'			" 引号修改
Plug 'godlygeek/tabular'			" 文本对其
Plug 'tpope/vim-commentary'			" 快速注释
Plug 'honza/vim-snippets'			" 代码片段
Plug 'mg979/vim-visual-multi', {'branch': 'master'}		" 多光标

" 编程环境
Plug 'neoclide/coc.nvim', {'branch': 'release'}			" Coc.nvim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }		" Golang
Plug 'elzr/vim-json'	" Json

" 查找
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'			" Git管理
Plug 'junegunn/gv.vim'				" Git提交浏览器
Plug 'airblade/vim-gitgutter'		" Git文件改动提示

" Markdown
Plug 'theniceboy/bullets.vim'		" 列表修复
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }			" 表格修复
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }	" Markdown预览

" Latex
" Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'

call plug#end()
" }}}

" Bookmarks    --------------- {{{
" 书签
nmap <leader>a <Plug>BookmarkToggle
nmap <leader>s <Plug>BookmarkShowAll
nmap <leader>j <Plug>BookmarkNext
nmap <leader>k <Plug>BookmarkPrev
nmap <leader>d <Plug>BookmarkClearAll
" }}}

" Colorscheme  --------------- {{{
" 主题颜色
set t_Co=256
colorscheme OceanicNext
if (has("termguicolors"))
	set termguicolors
endif

" 高亮单词
nnoremap <silent> <leader>w :call InterestingWords('n')<cr>
nnoremap <silent> <space><cr> :call UncolorAllWords()<cr>:nohlsearch<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>
" }}}

" Coc.nvim     --------------- {{{

set updatetime=100
set shortmess+=c

nmap <leader>rn <Plug>(coc-rename)		" 变量重命名
nnoremap P :CocList -A --normal yank<CR>" 剪辑版历史

" 按Tab自动补全
inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用回车键选择
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 唤出自动补全窗口
inoremap <silent><expr> <c-o> coc#refresh()

" Coc插件列表
let g:coc_global_extensions = [
			\ 'coc-go',
			\ 'coc-css',
			\ 'coc-json',
			\ 'coc-yank',
			\ 'coc-explorer',
			\ 'coc-tsserver',
			\ 'coc-snippets',
			\ 'coc-translator',
			\ ]

nmap <silent> gj <Plug>(coc-diagnostic-next)	" 跳转到下一个错误
nmap <silent> gk <Plug>(coc-diagnostic-prev)	" 跳转到上一个错误

" 打开帮助文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" coc-translator
" 弹窗
nmap ts <Plug>(coc-translator-p)
vmap ts <Plug>(coc-translator-pv)
" 提示
nmap te <Plug>(coc-translator-e)
vmap te <Plug>(coc-translator-ev)
" 替换
nmap tr <Plug>(coc-translator-r)
vmap tr <Plug>(coc-translator-rv)
" 历史
map th :CocList translation<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)		" 跳转到声明位置
nmap <silent> gr <Plug>(coc-references)		" 查看引用的位置
nmap <silent> gt <Plug>(coc-type-definition)" 跳转到类型声明位置
nmap <silent> gi <Plug>(coc-implementation) " 跳转到实现的位置

" Calculate extension
nmap <Leader>ca <Plug>(coc-calc-result-append)	" 计算结果追加
nmap <Leader>cr <Plug>(coc-calc-result-replace)	" 计算结果替换

" coc-snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:coc_snippet_next = '<tab>'

" coc-explorer
nmap <leader>n :CocCommand explorer<CR>
" }}}

" FZF          --------------- {{{
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>oh :History<CR>
nnoremap <leader>oa :Ag<CR>
" }}}

" Golang       --------------- {{{
let g:go_template_autocreate = 1
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_imports_autosave = 1
" }}}

" Indent       --------------- {{{
" 文本缩进
nnoremap <leader>i :Nine2IndentGuides<cr>
let g:nine2_indent_guides_disable = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
if (&filetype == 'json')
	let g:indentLine_setConceal = 1
else
	let g:indentLine_setConceal = 0
endif
" }}}

" Lightline    --------------- {{{
" 底部状态栏
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\		'left': [[ 'mode', 'paste' ],
			\				 [ 'readonly', 'gitbarnch' ],
			\				 [ 'filename', 'modified', 'username' ] ],
			\		'right':[[ 'lineinfo' ],
			\				 [ 'percent' ],
			\				 [ 'fileencoding', 'filetype', 'charvaluehex'] ],
			\ },
			\ 'component': {
			\		'username':	'残云cyun',
			\		'charvaluehex': '0x%B',
			\ },
			\ 'component_function': {
			\		'readonly': 'LightlineReadonly',
			\		'gitbarnch':'FugitiveHead'
			\ },
			\ }

function! LightlineReadonly()
	return &readonly && &filetype !=# '\v(help|vimfiler|unite)' ? 'ReadOnly' : ''
endfunction
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statuslne = 0
" }}}

" Markdown     --------------- {{{
let g:bullets_enabled_file_types = [
		\ 'markdown',
		\ 'text',
		\ 'gitcommit',
		\ 'scratch'
		\]

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
		\ 'mkit': {},
		\ 'katex': {},
		\ 'uml': {},
		\ 'maid': {},
		\ 'disable_sync_scroll': 0,
		\ 'sync_scroll_type': 'middle',
		\ 'hide_yaml_meta': 1
		\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
" }}}

" Python       --------------- {{{
let g:python2_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"
" }}}

" Rainbow      --------------- {{{
" 彩虹括号
let g:rainbow_active = 1
" }}}

" Undo Tree    --------------- {{{
noremap <leader>l :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has("persistent_undo")
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
" }}}

" Visual Multi --------------- {{{
" 多光标
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-t>'
let g:VM_maps['Find Subword Under'] = '<C-t>'
let g:VM_maps['Skip Region'] = '<C-n>'
let g:VM_maps['Remove Region'] = 'q'
" }}}

" Vista        --------------- {{{
map <leader>m :Vista!!<CR>
map <leader>M :Vista finder fzf:coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "class": "\uf0e8",
			\	"method": "\uf6a6",
			\	"script": "\ue628",
			\	"constant": "\uf8fe",
			\   "function": "\uf794",
			\   "variable": "\ufb4d",
			\	"interface": "\uf417",
			\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" }}}

" Latex        --------------- {{{
" let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'xelatex'
" }}}
