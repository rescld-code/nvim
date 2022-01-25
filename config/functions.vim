function! RunCode()
	exec "w"
	set splitbelow
	if &filetype == 'python'
		:split
		:terminal python3 %
	elseif &filetype == 'lua'
		:split
		:terminal lua %
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'html'
		silent! exec "!google-chrome-stable % &"
	elseif &filetype == 'cpp'
		exec "!g++ % -Wall -o ./%< -lm"
		:split
		:terminal ./%<
	elseif &filetype == 'c'
		exec "!gcc % -Wall -o ./%< -lm"
		:split
		:terminal ./%<
	elseif &filetype == 'go'
		exec "GoRun"
	elseif &filetype == 'tex'
		exec "LLPStartPreview"
	endif
endfunction
