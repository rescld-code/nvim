function! RunCode()
	exec "w"
	set splitbelow
	if &filetype == 'python'
		:split
		:terminal python3 %
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'html'
		silent! exec "!google-chrome-stable % &"
	elseif &filetype == 'cpp'
		exec "!g++ % -Wall -o ./%<"
		:split
		:terminal ./%<
	elseif &filetype == 'c'
		exec "!gcc % -Wall -o ./%<"
		:split
		:terminal ./%<
	elseif &filetype == 'go'
		exec "GoRun"
	endif
endfunction
