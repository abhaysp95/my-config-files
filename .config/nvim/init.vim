"
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"				--> Abhay Shanker Pathak
"

let mapleader = ","
let maplocalleader = "`"

"-------All-the-plugins-for-vim-and-nvim---------------------- <<<
call plug#begin()
Plug 'vim-syntastic/syntastic' "error checker for languages and scripts
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'			" for html
Plug 'tpope/vim-repeat'
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-sandwich'

" Plug 'mattn/calendar-vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'vim-pandoc/vim-pandoc-syntax'

" Theme / Interface
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'sjl/badwolf'
Plug 'rbgrouleff/bclose.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'junegunn/limelight.vim'
Plug 'mkarmona/colorsbox'
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'AlessandroYorba/Sierra'
Plug 'daylerees/colour-schemes'
Plug 'effkay/argonaut.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'colepeters/spacemacs-theme.vim'

Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ptzz/lf.vim'

Plug 'mhinz/vim-grepper'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'

" shows diff signs in vim's signcolumn
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

" display colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Modify * to also work with visual selections
Plug 'nelstrom/vim-visual-star-search'

" learn using f/F & t/T
Plug 'unblevable/quick-scope'

" get startscreen
Plug 'mhinz/vim-startify'
call plug#end()
" >>>

" set runtime to load some other plugins
set runtimepath^=~/.config/nvim/plugged/dragvisuals
" Colorcolumn settings <<<
highlight ColorColumn ctermbg=red
" although this is working, color isn't changing to red, it's still grey
call matchadd('ColorColumn', '\%101v', 100)
" >>>

" Limelight configuration <<<
    let g:limelight_conceal_ctermbg     = 'dark-gray'
    let g:limelight_conceal_ctermfg     = 240
    let g:limelight_default_coefficient = 0.5
    let g:limelight_paragraph_span      = 1
	" >>>

" Goyo plugin makes text more readable when writing prose: <<<
map <leader>F :Goyo \| set background=dark\| set linebreak<CR>
" >>>

" python syntax
	let g:python_highlight_all          = 1
	let g:python_slow_sync              = 0

" Goyo configuration <<<
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
	" >>>"

" some set settings <<<
" Set Proper Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set noexpandtab	"if switched on means it will insert spaces to length of tab
set listchars=eol:↲,tab:↦\ ,nbsp:␣,extends:…,trail:⋅
set nolist
set linebreak
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus
set complete+=kspell
set completeopt=menuone,preview,longest
set encoding=utf-8
set hidden
set termguicolors
set t_Co=256
set nocompatible
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8

	if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
	endif

set ruler
set title	" sets title for document in terminal"
set hlsearch
set ignorecase
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
set scrolloff=3
set showcmd
set showmatch
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
autocmd FileType c,cpp,java set mps+==:;

" better search in vim ------------
set hlsearch
set incsearch
" >>>

nnoremap <M-;> :noh<CR>:<backspace>
" for list chars
nnoremap <leader>i :setlocal list!<CR>:setlocal list?<CR>

" replacement of words ---------------- <<<
" press * then press a mapping below to replace all instances
nnoremap <leader>ro :s///g<Left><Left>
nnoremap <leader>rd :s//
nnoremap <leader>ra :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>
" >>>

" same as above but works on visual selection with *(requires vim-visual-star-search plugin)
" <<<
xnoremap <leader>ro :s///g<Left><Left>
xnoremap <leader>rd :s//
xnoremap <leader>ra :%s///g<Left><Left>
xnoremap <leader>rc :%s///gc<Left><Left><Left>
" >>>

" keep cursor at the bottom of the visual selection after you yank it
vmap y ygv<Esc>

" repeat replacement <<<
" type replacement term and press '.' to repeat the
" replacement.(somewhat like vim-multiple-cursor plugin)
nnoremap <silent> <leader>s* :let@/='\<'.expand('<cword>').'\>'<CR>cgn
" you might as well can search the word and then do 'ce' to replace that word. Depends on how you need it
xnoremap <silent> <leader>s* "sy:let @/=@s<CR>cgn
" >>>


" ---- format paragraph ------ "<<<
" format paragraph (selected or not) to 80 character lines
nnoremap <leader>gP gqap
xnoremap <leader>gP gqa
" >>>

" spell error <<<
highlight SpecialKey guifg=#ffffff guibg=#116611
hi SpellBad cterm=underline ctermfg=9
hi SpellLocal cterm=underline ctermfg=9
hi SpellRare cterm=underline ctermfg=9
hi SpellCap cterm=underline
" >>>

" enable autocompletion
	set wildmode=longest,list,full

" Splits open at the bottom and right(should be default)
    set splitbelow splitright

" Display all matching files when tabs complete
    set wildmenu

" Some basics:
	nnoremap c "_c
	filetype plugin on
	syntax on
"	set number relativenumber
	inoremap j' <ESC>
	" inoremap <localleader><Space> <Esc>/<++><Enter>"_c4l
	inoremap <M-Space> <Esc>/<++><Enter>"_c4l

	" some custom snipptes <<<
	autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
    autocmd FileType c inoremap ;c // <++> <<<<CR><++>()<Space>{<CR><++><CR>}<CR>// >>><CR><CR><++><Esc>7kI
    autocmd FileType markdown inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
    autocmd FileType html inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
	autocmd FileType markdown inoremap ;sh ```sh<CR>```<CR><CR><++><Esc>2kO<C-i>
	autocmd FileType markdown inoremap ;p ```python<CR>```<Esc>O
	autocmd FileType markdown inoremap ;c ```c<CR>```<Esc>O
	" >>>

" some random setting <<<
" Cycle through splits
nnoremap <S-Tab> <C-w>w

" Edit vim config file in a new tab
map <Leader>ev : tabnew $MYVIMRC<CR>

" Source vim config file
map <Leader>sv : source $MYVIMRC<CR>

" Toggle relative line number
nmap <F5>      : set invrelativenumber number<CR>
nmap <leader>N : set nonumber norelativenumber<CR>
" >>>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <F6> :setlocal spell! spelllang=en_us<CR>

" Toggle quickfix window <<<
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
nnoremap <leader>Ic :set noic<CR>
" >>>

" *Ultisnips configs <<<
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" >>>

" movement in insert mode <<<
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
snoremap <M-k> <Up>
snoremap <M-j> <Down>
snoremap <M-h> <Left>
snoremap <M-l> <Right>
" >>>


" lightline configuration <<<
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Bright',
		\ 'active': {
		  \   'left': [ [ 'mode', 'paste' ],
		  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		  \ },
		  \ 'component_function': {
		  \   'gitbranch': 'FugitiveHead',
		  \ 'mode': 'LightlineMode',
		  \ 'filename': 'LightlineFilename',
		  \ 'fileformat': 'LightlineFileformat',
		  \ 'filetype': 'LightlineFiletype'
		  \ },
			\ 'component': {
			\ 'lineinfo': ' %3l:%-2v',
			\ 'tagbar': '%{tagbar#currenttag("[%s]", "")}'
			\ },
\ }
	let g:lightline.separator = {
	\ 'left': '', 'right': ''
	\}
	let g:lightline.subseparator = {
	\ 'left': '', 'right': ''
	\}
	let g:lightline.tabline = {
	\ 'left': [ ['tabs'] ],
	\ 'right': [ ['close'] ]
	\ }
	set showtabline=1 " Show tabline, only when there is another tab

	function! LightlineMode()
		return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
					\ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
					\ &filetype ==# 'unite' ? 'Unite' :
					\ &filetype ==# 'vimfiler' ? 'VimFiler' :
					\ &filetype ==# 'vimshell' ? 'VimShell' :
					\ lightline#mode()
	endfunction

	function! LightlineFilename()
	  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	  let modified = &modified ? ' +' : ''
	  return filename . modified
	endfunction

	function! LightlineFileformat()
		return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightlineFiletype()
		return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction
" >>>

" colorscheme configuration <<<
" source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"
let base16colorspace=256
set background=dark
" source this to your profile

" gruvbox settings
let g:gruvbox_bold='1'
let g:gruvbox_italic='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_termcolors='256'
let g:gruvbox_underline='1'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_improved_strings='0'
let g:gruvbox_improved_warnings='1'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_indent_guides='1'

" nord colorscheme settings"
let g:nord_cursor_line_number_background = 0
let g:nord_uniform_status_line = 0
let g:nord_bold_vertical_split_line = 0
let g:nord_uniform_diff_background = 0
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" other colorschemes
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
let ayucolor="light"
let g:gotham_airline_empahsised_insert = 0
colorscheme gotham256
set go=a
highlight String gui=italic cterm=italic
highlight Comment cterm=italic gui=italic
highlight Search ctermbg=black ctermfg=yellow term=underline
hi SignColumn ctermbg=255 guibg=255 gui=bold
" >>>

" Disables automatic commenting on newline
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=0

" coc extensions <<<
let g:coc_global_extensions = [
  \ 'coc-emoji',
  \ 'coc-pairs',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-pyls',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-markmap',
  \ 'coc-json',
  \ 'coc-syntax',
  \ 'coc-java',
  \ 'coc-html',
  \ 'coc-sh',
  \ 'coc-css',
  \ 'coc-ultisnips'
  \ ]
" >>>

" Better display for messages <<<
set cmdheight=1
" Smaller updatetime for cursorhold & cursorholdI
set updatetime=300
" don't give |ins-completion-menu| messages
" set shortmess+=c
" always show signcolums
set signcolumn=auto
" >>>

" some coc related settings <<<
" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definiton)
nmap <silent> <leader>lt <Plug>(coc-type-definiton)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for format selected region
xmap <leader>v  <Plug>(coc-format-selected)
nmap <leader>v  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,c,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-c> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-c> <Plug>(coc-range-select)
xmap <silent> <C-c> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Higlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" >>>

" some auto-completion settings for <c-space>, <c-n> and <c-p> <<<
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" it doesn't take this much time to open a nvim file(recording is affecting)
"
" saw this? what type of completion was this and the one which is happening as I'm typing is just a general completion, right?

" now see this,

" saw that i pressed <C-space> to open the second type of completion menu, what was that? Also noticed that it had already selected the first one.

" not selected, I had to press <C-n>

" now, see
" saw already selected first one

" tying to improve completion pop-up menu: -----------------------
" in first one, <c-n> works normally, however when completion menu appears the <Down> key is simulated.
" this keeps the menu item always highlighted so that you can hit enter anytime to insert it.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
		\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
		\ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'
" these two mappings are supposed to do show.
" this one stimulates <C-x><C-o> to bring omni-completion menu, the stimulates <C-n><C-p> to remove longest common text
" then finally stimulates <Down> again to keep match highlighted
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
		\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" here's another example of set of mappings that first close any popups that are open which means you seamlessly switch between omni and user completions.
" if the menu is visible, use the above trick to keep the text you typed and select first
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open an opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" >>>


" Automatically open & close quickfix window
autocmd QuickFixCmdPost [^l] * nested cwindow


" statusline learning <<<
set statusline=
set statusline+=\ %r	" readonly flag
set statusline+=\ %0.20F	" F for full path, t for tail only
set statusline+=\ %y	" display filetype
set statusline+=\ %m	" if file modified

set statusline+=%=		    " right side
set statusline+=\ %l/%L  " column:line:totalnumberoflines
set statusline+=\ %4p%% 	    " set line %
" set statusline+=\ %b 		" value of character under cursor
set statusline+=\ %3c
set statusline+=\ [%n] 	    " gives buffer number
" >>>

" Syntastic Configuration   #Check :help Syntastic <<<
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

	let g:syntastic_always_populate_loc_list=1
	let g:syntastic_auto_loc_list=0
	let g:syntastic_loc_list_height=6
	let g:syntastic_check_on_open=0
	let g:syntastic_auto_jump=3
	let g:syntastic_check_on_wq=0
	let g:syntastic_error_symbol = '✖'
	let g:syntastic_style_error_symbol = '✖'
	let g:syntastic_enable_highlighting = 1
    " let g:syntastic_enable_elixir_checker = 1
    " let g:syntastic_elixir_checkers = ["elixir"]
	map <leader>te :Errors<cr>
	map <leader>T :SyntasticToggleMode<CR>
	" map <leader>t :SyntasticCheck
	" >>>

" useful for error detection <<<
nnoremap cln :lnext<CR>
nnoremap clp :lprevious<CR>
nnoremap clc :lclose<CR>
nnoremap clo :lopen<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
" >>>

" Airline configuration <<<
" Vim-Airline configuration
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#show_splits = 1
	let g:airline#extensions#tabline#show_buffers = 1
	let g:airline#extensions#bufferline#enabled = 1
	let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline#extensions#tabline#buffer_idx_show = 1
	let g:airline#extensions#tabline#tab_nr_type = 1
	let g:airline#extensions#tabline#show_tabs = 1
	let g:airline#extensions#tabline#show_tab_count = 1
	let g:airline#extensions#tabline#fnamecollapse = 1
	let g:airline#extensions#tabline#overflow_marker = '…'
	let g:airline_powerline_fonts=0
	let g:airline_inactive_collapse = 1
	let g:airline#extensions#tabline#buffers_label = 'b'
	let g:airline#extensions#tabline#tabs_label = 't'
	let g:airline_mode_map = {
		  \ '__'     : '-',
		  \ 'c'      : 'C',
		  \ 'i'      : 'I',
		  \ 'ic'     : 'I',
		  \ 'ix'     : 'I',
		  \ 'n'      : 'N',
		  \ 'multi'  : 'M',
		  \ 'ni'     : 'N',
		  \ 'no'     : 'N',
		  \ 'R'      : 'R',
		  \ 'Rv'     : 'R',
		  \ 's'      : 'S',
		  \ 'S'      : 'S',
		  \ ''     : 'S',
		  \ 't'      : 'T',
		  \ 'v'      : 'V',
		  \ 'V'      : 'V',
		  \ ''     : 'V',
	\ }
	let g:airline#extensions#coc#enabled = 1
	let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
	let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
	let g:airline_exclude_preview = 0
	let g:airline_focuslost_inactive = 0
	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
	let airline#extensions#ale#error_symbol = 'e:'
	let airline#extensions#ale#warning_symbol = 'w:'
	let g:airline#extensions#nerdtree_status = 0
	let g:airline#extensions#syntastic#enabled = 1
	let airline#extensions#syntastic#error_symbol = 'ë:'
	let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
	let airline#extensions#syntastic#warning_symbol = 'ẃ:'
	let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'
	let g:airline_theme='gotham256'
	let g:hybrid_custom_term_colors=1
	let g:hybrid_reduced_contrast=1
" >>>

" newtree(tweeks for browsing) <<<
    let g:netrw_banner=0                "disables banner at top
    let g:netrw_browse_split=4          "open in prior window
    let g:netrw_altv=1                  "open splits to the right
    let g:netrw_liststyle=3             "tree view
	nnoremap <leader>nl :Lex! \| vertical resize 30<CR>
" >>>

" searches down into subfolders
" provides tab-completion for all file-related tasks
    set path+=**

" Settings for vim latex live preview(needs working)
    let g:livepreview_previewer = 'zathura'
    "can also specify generator for latex

" Create the 'tags' file(install ctags)
    command! MakeTags !ctags -R .   "use ^] to jump to tag under cursor, g^] for ambiguous tag, ^t to jump back to tag stack

" Shortcutting split navigation,(laziness): <<<
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
" >>>

" change splits from vert to horizontal and vice versa <<<
nnoremap <leader>th <C-w>t<C-w>H
nnoremap <leader>tk <C-w>t<C-w>K
" >>>

" Enable/disable auto comments <<<
set formatoptions-=cro
map <leader>cd :setlocal formatoptions-=cro<CR>
map <leader>ce :setlocal formatoptions=cro<CR>
" >>>

" Check file in shellcheck:
    map <leader>S :!clear && shellcheck %<CR>

" Open corresponding .pdf/.html or preview
    map <leader>p :!opout <c-r>%<CR><CR>

" resize pane <<<
" disables arrow movement, resize splits instead but
" since sometimes non vim users have to use my machine so arrow is necessary, so changed
    let g:elite_mode=1
    if get(g:, 'elite_mode')
        " nnoremap <Up>       :resize +2<CR>
        " nnoremap <Down>     :resize -2<CR>
        " nnoremap <Left>     :vertical resize +2<CR>
        " nnoremap <Right>    :vertical resize -2<CR>
		nnoremap <silent> <M-k>		:resize +2<CR>
		nnoremap <silent> <M-j>		:resize -2<CR>
		nnoremap <silent> <M-l>		:vertical resize +2<CR>
		nnoremap <silent> <M-h>		:vertical resize -2<CR>
    endif
" >>>

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' \| edit!

" indentation settings <<<
	set foldcolumn=1
	set foldlevelstart=1
	set foldmarker=<<<,>>>
	set foldmethod=marker
	set fillchars+=vert:╏,fold:•
"
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
" >>>

" Notestaking and text/config editing <<<
autocmd FileType markdown map <F7> :!pandoc<Space><C-r>%<space>-o<Space><C-r>%.pdf<Enter><Enter>
autocmd FileType rmd map <F7> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" Automatically deletes all whitespace on save
    autocmd BufWritePre * %s/\s\+$//e

" when shortcut files are updated, renew bash and ranger configs with new material
    autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated
    autocmd BufWritePost *Xdefaults,*Xresources !xrdb %

" Update binds when sxhkdrc is updated
    autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

    autocmd BufWritePost !ctags -R %
" >>>

let @+=@"
let @*=@""

" copy/paste registers <<<
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" >>>

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

" Notetaking <<<
" command! -nargs=1 Ngrep vimgrep "<args>" /home/raytracer/vimwiki/**/*.md
nnoremap <leader>[ :Ngrep

au BufRead,BufNewFile *wiki set filetype=markdown
" :autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
" >>>

" ----------------- settings for fzf --------------------- <<<
map <leader>ff :Files<CR>
map <leader>fc :Files ~/.config/<CR>
map <leader>fs :Files ~/.local/bin/.scripts/<CR>
map <leader>fl :Lines<CR>
map <leader>fw :Windows<CR>
"can also use :Files instead of :FZF
map <leader>fg :Files

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bc :Commands<CR>
nnoremap <leader>bs :Snippets<CR>
nnoremap cq: :History:<CR>

" open terminal in new split
nnoremap <leader>ct :vsplit term://zsh<CR>

command! -nargs=1 Locate call fzf#run( \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

" let g:fzf_files_options =
" 			\ '--preview "(codearay {} || cat {}) 2> /dev/null | head -' .&lines.'"'

let g:fzf_files_options =
			\ '--preview="pistol {}"'
" ----------------------- emmet plugin ------------------"
"" redefine default trigger key <C-y> followed by , "
let g:user_emmet_leader_key='<S-Tab>'
" >>>

autocmd BufEnter * lcd %:p:h

" Vim Hexokinase <<<
let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']
let g:Hexokinase_optInPatterns = [
			\	'full_hex',
			\	'triple_hex',
			\	'rgb',
			\	'rgba',
			\	'hsl',
			\	'hsla',
			\	'colour_names'
			\]
let g:Hexokinase_highlighters = ['backgroundfull']

" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn
" >>>

" -- vim grepper -- <<<
let g:grepper       = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jumps  = -1
nnoremap <leader>/ :GrepperRg<Space>
nnoremap gs :Grepper -cword -noprompt<CR>
xmap gs <Plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" >>>

" --- ale pluging ----- <<<
let g:ale_sign_error                               = '●'
let g:ale_sign_warning                             = '!-'
"let g:ale_linters_explicit                        = 1
"let g:ale_open_list                               = 1
let g:ale_lint_on_enter                            = 0
" if you want to show after opening file save file
let g:ale_lint_on_save                             = 1
"let g:ale_lint_on_filetype_changed                = 0
let g:ale_lint_on_insert_leave                     = 0
"let g:ale_lint_on_text_changed                    = 'never'
" nmap <leader>El	<Plug>(ale_lint)
" nmap <leader>E	<Plug>(ale_fix)
" nmap <leader><BS>		<Plug>(ale_reset_buffer)
" >>>

" ---- vim-lion -----"
let g:lion_squeeze_spaces = 1

nmap <leader>gs :set signcolumn=

" -- undotree ---- <<<
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 3
nnoremap <leader>U :UndotreeToggle<CR>
" >>>

" ----- vim-fugitive ----- <<<
nnoremap <silent> <leader>B :Gblame<CR>
nnoremap <silent> <leader>C :Gclog %<CR>
nnoremap <silent> <leader>G :Gstatus<CR>
" >>>

" Remove any introduced trailing whitespace after moving...     ##
let g:DVB_TrimWS = 1
" >>>

" operations related to foldmethod = marker(marco trosi) <<<
vnoremap af:<c-u>silent! normal! [zv]z$<cr>
onoremap af:normal vaf<cr>
vnoremap if:<c-u>silent! normal! [zjv]zk$<cr>
onoremap if:normal vif<cr>
" >>>

" ----- majutsushi/tagbar ----- "
nmap <F8> :TagbarToggle<CR>

" ---- vim-signify ---------- "(inplace of gitgutter) <<<
nmap [g <plug>(signify-prev-hunk)
nmap ]g <plug>(signify-next-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

highlight SignifySignAdd ctermbg=255 guibg=255
highlight SignifySignDelete ctermbg=255 guibg=255
highlight SignifySignChange ctermbg=255 guibg=255
" >>>

" ----- vim - quickscope ------------------- <<<
let g:qs_highlight_on_keys = ['f', 't', 'F', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" >>>

" ------- ptzz/lf.vim -------------------- "
let g:lf_map_keys=0
nnoremap <leader>fl :vsplit \| Lf<CR>

" ------- vim-startify ------------------ <<<
" save current session/switch to another
nnoremap <leader>ls :SSave<CR>
nnoremap <leader>ll :SClose<CR>
nnoremap <leader>lD :SDelete!

" simplify the startify to just recent files and sessions
let g:startify_list = [
			\ { 'type': 'dir'     ,	'header': ['Recent files'] },
			\ { 'type': 'sessions', 'header': ['Saved sessions'] }
\ ]

" Custom header
let g:startfiy_custom_header = [
  \ '   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┏┛   ┃   ┃┃┃',
  \ '   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]
" >>>

echom '(>^.^<)'

" learning some new things
" nnoremap <buffer> <localleader>x dd
autocmd BufNewFile * :write
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd BufNewFile,BufRead *.html :setlocal nowrap
