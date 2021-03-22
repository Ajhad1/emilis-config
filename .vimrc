"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => General vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Sets how many lines of history VIM has to remember
setlocal history=50

" For plug-ins to load correctly.
set nocp
" set rtp+=/path/to/rtp/that/included/pathogen/vim " if needed
execute pathogen#infect()
filetype plugin on
filetype indent on

" Prompt confirmation dialogs
set confirm

" Enable spell-checking
" setlocal spell

" No annoying sound on errors
" setlocal noerrorbells
" setlocal novisualbell
" setlocal t_vb=
" setlocal tm=500

" Properly disable sound on errors on MacVim
" if has("gui_macvim")
" 	autocmd GUIEnter * setlocal vb t_vb=
" endif

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => General => Search vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight matching search patterns
setlocal hlsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Enable incremental search
set incsearch

" Visual mode pressing * or # searches for the current selection (Super useful! From an idea by Michael Naumann)
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => General => Shortcuts vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow quit via single keypress (Q)
map q :qa<CR>

" allow quit via single keypress (Q)
map Q :wqa<CR>

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => General => Files, backups, and undo vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Number of undo levels
set undolevels=100

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb
" of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => VIM User Interface vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
setlocal so=7

" Show line numbers
setlocal number
setlocal numberwidth=4

" change Vim color scheme
colorscheme torte

" Show row and column ruler information
set ruler

" Turn on syntax highlighting.
syntax enable

" Display command line’s tab complete options as a menu.
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Highlight the line currently under cursor.
" set cursorline

" Set the window’s title, reflecting the file currently being edited.
set title

" Display options
set showmode
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => VIM User Interface => Status Line vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
setlocal laststatus=2

" Set status line display
setlocal statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ %{strftime('%c')}
" set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => VIM User Interface => Text, Tab, and Indent vvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display different types of white spaces.
setlocal list
setlocal listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Automatically wrap text that extends beyond the screen length.
setlocal wrap

" Auto-indent new lines
" set autoindent

" Enable smart-indent
setlocal smartindent

" Enable smart-tabs
setlocal smarttab

" Set Tab Length
setlocal tabstop=4

" Shiftwidth
setlocal shiftwidth=0

" SoftTabStop
setlocal softtabstop=-1

" No Expand Tab
setlocal noexpandtab

" Avoid wrapping a line in the middle of a word.
setlocal linebreak

" Show tab bar
setlocal showtabline=2

" Show matching brackets.
set showmatch

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => VIM User Interface => Text, Tab, and Indent vvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold based on indention levels and manual folds.
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" set foldmethod=indent

" Add a bit extra margin to the left
setlocal foldcolumn=1

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Mouse Stuff vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block,a:blinkon0

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" Enable free-range cursor
" set virtualedit=all

" Display 5 lines above/below the cursor when scrolling with a mouse.
setlocal scrolloff=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Moving around tabs, windows, and buffers  vvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path - Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Helper Functions vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	endif
	return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")
	
	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif
	
	if bufnr("%") ==
		l:currentBufNum
		new
	endif
	
	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction

function! CmdLine(str)
	call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
 	let l:saved_reg = @"
 	execute "normal! vgvy"
	
	let l:pattern = escape(@", "\\/.*'$^~[]")
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'gv'
		call CmdLine("Ack '" . l:pattern . "' " )
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	endif
	
	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

func! DeleteTillSlash()
	let g:cmd = getcmdline()
	if has("win16") || has("win32")
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	endif
	if g:cmd == g:cmd_edited
		if has("win16") || has("win32")
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		endif
	endif
	return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
	return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Experimental vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" attempt at retabbing file
command! -nargs=1 Tabulate call TabulateFunc(<f-args>)

function! TabulateFunc(currentSpacesToTab)
	let oldTabStop=&tabstop
	setlocal noexpandtab
	execute "setlocal tabstop=".a:currentSpacesToTab
	%retab!
	execute "setlocal tabstop=".oldTabStop
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Experimental => Toggle All Folds vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle All Folds
" Toggle All Folds => Command
command! Fold call UnrolMe()
command! FOLD call UnrolMe()
" Toggle All Folds => Function
let $unrol=0
function! UnrolMe()
	if $unrol==0
		:exe "normal zR"
		let $unrol=1
	else
		:exe "normal zM"
		let $unrol=0
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Experimental => Remove Extra Spaces on Save vvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove Extra Spaces on Save
if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.json,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Experimental => Persistent undo (allows undo after closing file) vvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
	set undodir=~/.vim_runtime/temp_dirs/undodir
	set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Experimental => Parenthesis/Bracket vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>
"
" " Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Fixes vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixes common backspace problems
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvv => Filetype Specific Settings vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Example of autocmd setting tabstop to 4 for file type javascript
" autocmd Filetype javascript setlocal tabstop=4

" Set the tabstop  based on 'json' file extension, overriding value already set
au BufRead,BufNewFile,BufEnter *.json setlocal tabstop=4
au BufRead,BufNewFile *.json setlocal conceallevel=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ => END ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
