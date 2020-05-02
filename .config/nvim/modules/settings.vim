" All the vim/nvim settings
set runtimepath^=~/.config/nvim/plugged/dragvisuals

" Some basics:
filetype plugin on
syntax on

set binary		" allows editing of binary files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab	"if switched on means it will insert spaces to length of tab
set smarttab
set autoindent
set smartindent
set listchars=eol:↲,tab:\|\ ,nbsp:␣,extends:…,trail:⋅
" ↦
set nolist
set linebreak
set sidescroll=1	" smooth scrolling
set nostartofline	" places cursor to same position when switching buffers
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus
set complete+=kspell
set completeopt=menuone,preview,longest
set encoding=utf-8
scriptencoding utf-8
set hidden
set autowrite	" saves file before switching buffer
set termguicolors
set t_Co=256
set nocompatible
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8

set ruler
set title	" sets title for document in terminal"
set hlsearch
set ignorecase
set smartcase
set incsearch
set laststatus=2
set lazyredraw
set matchpairs+=<:> " Use % to jump between pairs
set mmp=10000
set modelines=2
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set regexpengine=1
set showcmd
set showmatch
set noshowmode
" set noshowcmd
set shortmess+=Ft
set cursorline
" set cursorcolumn
set smartcase
set spelllang=en_us
set textwidth=0
set ttimeout
set mouse=a	"makes vim easy for others
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wrap
set modifiable
set wrap
set nojoinspaces    " don't add extra space ., !, etc. when joining
set modeline
set modelines=4

" better search in vim ------------
set hlsearch
set scrolloff=3	    " leaves 3 lines before the edge vertically

" enable autocompletion
set wildmode=longest,list,full
" Splits open at the bottom and right(should be default)
set splitbelow splitright
" Display all matching files when tabs complete
set wildmenu
" Better display for messages <<<
set cmdheight=1

" Smaller updatetime for cursorhold & cursorholdI
set updatetime=300
" don't give |ins-completion-menu| messages
" set shortmess+=c
" always show signcolums
set signcolumn=auto

" searches down into subfolders
" provides tab-completion for all file-related tasks
set path+=**

set formatoptions-=cro
" >>>

" indentation settings <<<
set foldcolumn=1
set foldlevelstart=1
set foldmarker=<<<,>>>
set foldmethod=marker
"set fillchars+=vert:\ ,fold:•

set fillchars=vert:\|,fold:-
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
set foldtext=''
set foldtext+=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction
" set foldtext=►
" ǁǂ｜┃
" >>>

autocmd FileType c,cpp,java set mps+==:;

" Switch between normal and relativenumber and cursorline when switching modes
autocmd FileType html,c,python,js,config,sh set number relativenumber
augroup highlight-when-switching-modes
    autocmd!
    autocmd InsertEnter * setlocal number norelativenumber nocursorline
    autocmd InsertLeave * setlocal relativenumber cursorline
    " if &buftype != "terminal"
	autocmd BufEnter,WinEnter * setlocal cursorline
	autocmd BufLeave,WinLeave * setlocal nocursorline
    " endif

" Periodically check for file changes <<<
augroup checktime
    autocmd!
    autocmd CursorHold * silent! checktime
augroup END
" >>>

" Resize splits when vim changes size <<<
augroup auto-resize
    autocmd!
    autocmd VimResized * wincmd =
" >>>

" Toggle quickfix window (coc)<<<
function! QuickFix_toggle()
	for i in range(1, winnr('$'))
		let bnum = winbufnr(i)
		if getbufbar(bnum, '&buftype') == 'quickfix'
			cclose
			return
		endif
	endfor

	copen
endfunction
nnoremap <silent><Leader>tq :call QuickFix_toggle()<CR>
" >>>

" Disables automatic commenting on newline
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=0
autocmd Filetype * setlocal formatoptions+=n
" >>>

" Automatically open & close quickfix window
autocmd QuickFixCmdPost [^l] * nested cwindow

" newtree(tweeks for browsing) <<<
let g:netrw_winsize = -35
let g:netrw_liststyle = '[\/]$,*'
let g:netrw_banner=0                "disables banner at top
let g:netrw_browse_split=4          "open in prior window
let g:netrw_altv=1                  "open splits to the right
let g:netrw_liststyle=3             "tree view
" >>>

" function for Lexplore (doesn't do what I want) <<<
" function! ToggleLexplorer()
"     if exists("t:expl_buf_num")
" 	let expl_win_num = bufwinnr(t:expl_buf_num)
" 	if expl_win_num != -1
" 	    let cur_win_nr = winnr()
" 	    exec expl_win_num . 'wincmd w'
" 	    close
" 	    exec cur_win_nr . 'wincmd w'
" 	    unlet t:expl_buf_num
" 	else
" 	    unlet t:expl_buf_num
" 	endif
"     else
" 	exec '1wincmd w'
" 	Lexplore!
" 	let t:expl_buf_num = bufnr("%")
"     endif
" endfunction

" com! -nargs=* -bar -bang -complete=dir Lexplore call netrw#Lexplore(<q-args>, <bang>0)
" fun! LexploreToggle(dir, right)
"     if exists("t:netrw_lexbufnr")
" 	" close down netrw explorer window
" 	let lexwinnr = bufwinnr(t:netrw_lexbufnr)
" 	if lexwinnr != -1
" 	    let curwin = winnr()
" 	    exe lexwinnr."wincmd w"
" 	    close
" 	    exe curwin."wincmd w"
" 	endif
" 	unlet t:netrw_lexbufnr
"     else
" 	" open netrw explorer in the dir of current file
" 	" for remote files also
" 	let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','e')
" 	exe (a:right? "botright" : "topleft")." vertical ".((g.netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
" 	if a:dir != ""
" 	    exe "Explore ".a:dir
" 	else
" 	    exe "Explore ".path
" 	endif
" 	setlocal winfixwidth
" 	let t:netrw_lexbufnr = bufnr("%")
"     endif
" endfun
" >>>

" Create the 'tags' file(install ctags)
command! MakeTags !ctags -R .   "use ^] to jump to tag under cursor, g^] for ambiguous tag, ^t to jump back to tag stack

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

autocmd WinLeave *.* mkview
autocmd WinEnter *.* silent! loadview

" Automatically deletes all whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" when shortcut files are updated, renew bash and ranger configs with new material
autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated
autocmd BufWritePost *Xdefaults,*Xresources !xrdb %

" Update binds when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

autocmd BufWritePost !ctags -R %

let @+=@"
let @*=@""

" some abbreviations <<<
iabbrev myname Abhay Shanker Pathak
iabbrev ppywar pylint: disable=W
" >>>

augroup FILETYPES
	autocmd FileType markdown let b:indentLine_setConceal=1
augroup END


" markdown setting
autocmd FileType markdown set conceallevel=2
autocmd FileType markdown set foldmethod=marker

au BufRead,BufNewFile *wiki set filetype=markdown
" :autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote

if &buftype != "terminal"
    autocmd BufEnter * lcd %:p:h
endif

" Remove any introduced trailing whitespace after moving...     ##
let g:DVB_TrimWS = 1
echom '(>^.^<)'

" html related <<<
autocmd BufWritePre,BufRead *.html :normal gg=G2``
autocmd BufNewFile,BufRead *.html :setlocal nowrap
" >>>

" python syntax <<<
let g:python_highlight_all          = 1
let g:python_slow_sync              = 0
" >>>
