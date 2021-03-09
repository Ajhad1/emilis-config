if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" set nginx filetype
	au! BufRead,BufNewFile /etc/nginx/* set ft=nginx
augroup END
