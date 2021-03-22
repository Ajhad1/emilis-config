if did_filetype() " exists("did_load_filetypes")
	finish
endif
if getline(1) =~ '^#!.*\<bash\>'
	setfiletype sh
" elseif getline(1) =~ '^\(.\+\)(\d\{1}).\+\1(\d\{1})$'
" 	setfiletype man
elseif getline(1) =~ '^.*manual.*$'
	set ft=man nofoldenable bufhidden=hide nobuflisted noswapfile buftype=nofile nomodifiable nomod nolist nonu
	" set ft=man nomod nolist buftype=nofile bufhidden=hide noswapfile
	" command MANPAGER
endif
