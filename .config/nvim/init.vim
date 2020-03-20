"
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"				--> Abhay Shanker Pathak
"


let mapleader =","

"-------All-the-plugins-for-vim-and-nvim----------------------
call plug#begin()
Plug 'vim-syntastic/syntastic' "error checker for languages and scripts
Plug 'dense-analysis/ale'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'mattn/emmet-vim'			" for html
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/calendar-vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'vim-pandoc/vim-pandoc-syntax'

" Theme / Interface
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'
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
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mhinz/vim-grepper'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'
Plug 'mhinz/vim-signify'

" shows diff signs in vim's signcolumn
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

" display colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Modify * to also work with visual selections
Plug 'nelstrom/vim-visual-star-search'

" Plug 'plasticboy/vim-markdown'	(overrides your foldmethod to fdm=expr)
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
" Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-git'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'tpope/vim-git'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"Elixir support
"Plug 'elixir-editors/vim-elixir'
"Plug 'avdgaag/vim-phoenix'
"Plug 'mmorearty/elixir-ctags'
"Plug 'mattreduce/vim-mix'
"Plug 'BjRo/vim-extest'
"Plug 'frost/vim-eh-docs'
"Plug 'slashmili/alchemist.vim'
"Plug 'tpope/vim-endwise'
"Plug 'jadercorrea/elixir_generator.vim'

"Plug 'godlygeek/tabular
"Plug 'gabrielelana/vim-markdown'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Theme / Interface
"Plug 'Yggdroot/indentLine'
"Plug 'AnsiEsc.vim'

"Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'metakirby5/codi.vim'
"Plug 'jreybert/vimagit'
"Plug 'lukesmithxyz/vimling'
"Plug 'bling/vim-airline'
"Plug 'roxma/nvim-completion-manager'
"Plug 'tpope/vim-surround'

call plug#end()

" set runtime to load some other plugins
set runtimepath^=~/.config/nvim/plugged/dragvisuals
" Colorcolumn settings <<<
highlight ColorColumn ctermbg=red
" although this is working, color isn't changing to red, it's still grey
" set colorcolumn=81
call matchadd('ColorColumn', '\%101v', 100)
" have some fun
" highlight ColorColumn ctermbg=red ctermfg=blue
" exec 'set colorcolumn=' . join(range(2,80,3), ',')
" >>>


" always display status line

" minimap customization
" let g:minimap_highlight='Visual'

" enbale highlighting current line
"set cursorline

" Limelight configuration
    let g:limelight_conceal_ctermbg     = 'dark-gray'
    let g:limelight_conceal_ctermfg     = 240
    let g:limelight_default_coefficient = 0.5
    let g:limelight_paragraph_span      = 1

" python syntax
	let g:python_highlight_all          = 1
	let g:python_slow_sync              = 0

" Goyo configuration
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

" reduces stretching of hand
" map : to ; and ; to :
" nnoremap ;	:
" nnoremap :	;

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab
set listchars=eol:↲,tab:↦\ ,nbsp:␣,extends:…,trail:⋅
set list
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set complete+=kspell
set completeopt=menuone,preview,longest
" set cryptmethod=blowfish2
set encoding=utf-8
"set formatoptions=tcqrn1
set hidden
set termguicolors
set ruler
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchpairs+=<:> " Use % to jump between pairs
" set mmp=5000
set modelines=2
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
"set nohls
set nostartofline
set regexpengine=1
set scrolloff=3
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set spelllang=en_us
set textwidth=0
set ttimeout
" set ttyfast
" set ttymouse=sgr
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wrap
set modifiable
set wrap

" better search in vim ------------
set hlsearch
set incsearch
nnoremap <M-;> :noh<CR>:<backspace>

" replacement of words ----------------
" press * then press a mapping below to replace all instances
nnoremap <leader>ro :s///g<Left><Left>
nnoremap <leader>ra :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

" same as above but works on visual selection with *(requires vim-visual-star-search plugin)

xnoremap <leader>ro :s///g<Left><Left>
xnoremap <leader>ra :%s///g<Left><Left>
xnoremap <leader>rc :%s///gc<Left><Left><Left>

" keep cursor at the bottom of the visual selection after you yank it
vmap y ygv<Esc>

" type replacement term and press '.' to repeat the
" replacement.(somewhat like vim-multiple-cursor plugin)
nnoremap <silent> <leader>s* :let@/='\<'.expand('<cword>').'\>'<CR>cgn
" you might as well can search the word and then do 'ce' to replace that word. Depends on how you need it
xnoremap <silent> <leader>s* "sy:let @/=@s<CR>cgn


" ---- format paragraph ------ "
" format paragraph (selected or not) to 80 character lines
nnoremap <leader>gP gqap
xnoremap <leader>gP gqa

highlight SpecialKey guifg=#ffffff guibg=#116611
hi SpellBad cterm=underline ctermfg=9
hi SpellLocal cterm=underline ctermfg=9
hi SpellRare cterm=underline ctermfg=9
hi SpellCap cterm=underline

"-------- highlight search funtion <<<
	" This rewires n and N to dot the highlighting
	" nnoremap <silent> n		n:call HLNext(0.4)<cr>
	" nnoremap <silent> N		N:call HLNext(0.4)<cr>

" This one highlights whole line in which you are in
	" function! HLNext (blinktime)
	" 	set invcursorline
	" 	redraw
	" 	exec 'sleep' . float2nr(a:blinktime * 1000) . 'm'
	" 	redraw
	" endfunction
	"
" This one rings the match
	" function! HLNext (blinktime)
	"
" This one rings the match
	" function! HLNext (blinktime)
	" 	highlight RedOnRed ctermfg=red ctermbg=red
	" 	let [bufnum, lnum, col, off] = getpos('.')
	" 	let matchlen = strlen(matchstr(strpart(getline('.'),col - 1),@/))
	" 	echo matchlen
	" 	let ring_pat = (lnum > 1 ? '\%'.(lnum - 1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
	" 				\ . '\%'.lnum.'l\%>'.max([col-4,1]) . 'v\%<'.col.'v.'
	" 				\ . '\|'
	" 				\ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
	" 				\ . '\|'
	" 				\ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
	" 	let ring = matchadd('RedOnRed', ring_pat, 101)
	" 	redraw
	" 	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	" 	call matchdelete(ring)
	" 	redraw
	" endfunction
	"
" briefly hide everything except the match
	" function! HLNext (blinktime)
	" 	highlight BlackOnBlack ctermfg=black ctermbg=black
	" 	let [bufnum, lnum, col, off] = getpos('.')
	" 	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	" 	let hide_pat = '\%<'.lnum.'l.'
	" 			\ . '\|'
	" 			\ . '\%'.lnum.'l\%'.col.'v.'
	" 			\ . '\|'
	" 			\ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
	" 			\ . '\|'
	" 			\ . '\%>'.lnum.'l.'
	" 	let ring = matchadd('BlackOnBlack', hide_pat, 101)
	" 	redraw
	" 	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	" 	call matchdelete(ring)
	" 	redraw
	" endfunction
	"
" OR highlight match in red...
    " function! HLNext (blinktime)
    "     let [bufnum, lnum, col, off] = getpos('.')
    "     let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    "     let target_pat = '\c\%#\%('.@/.'\)'
    "     let ring = matchadd('WhiteOnRed', target_pat, 101)
    "     redraw
    "     exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "     call matchdelete(ring)
    "     redraw
    " endfunction
" facing issue of INVALID ID: -1(must be greater than or equal to 1)
" >>>

" enable autocompletion
	set wildmode=longest,list,full

" Splits open at the bottom and right(should be default)
    set splitbelow splitright

" Display all matching files when tabs complete
    set wildmenu

set t_Co=256
" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	set omnifunc=syntaxcomplete#Complete
	syntax on
	set encoding=utf-8
"	set number relativenumber
	inoremap j' <ESC>

	inoremap \<Space> <Esc>/<++><Enter>"_c4l

	autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
    autocmd FileType c inoremap ;c // <++> <<<<CR><++>()<Space>{<CR><++><CR>}<CR>// >>><CR><CR><++><Esc>7kI
    autocmd FileType markdown inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
    autocmd FileType html inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
	autocmd FileType markdown inoremap ;sh ```sh<CR>```<CR><CR><++><Esc>2kO<C-i>
	autocmd FileType markdown inoremap ;p ```python<CR>```<Esc>O
	autocmd FileType markdown inoremap ;c ```c<CR>```<Esc>O
	autocmd FileType vimwiki inoremap ;p ```python<CR>```<Esc>O
	autocmd FileType vimwiki inoremap ;c ```c<CR>```<Esc>O

" Cycle through splits
nnoremap <S-Tab> <C-w>w

" Edit vim config file in a new tab
map <Leader>ev                      : tabnew $MYVIMRC<CR>

" Source vim config file
map <Leader>sv                      : source $MYVIMRC<CR>

" Toggle relative line number
nmap <F5>                           : set invrelativenumber number<CR>
nmap <leader>N                      : set nonumber norelativenumber<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
    map <F6> :setlocal spell! spelllang=en_us<CR>

" Toggle quickfix window
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
nmap <leader>ic :set noic<CR>

"---------------------------------------------------------------------------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"
" colorscheme configuration
" source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"
    let base16colorspace=256
	set background=dark
    " source this to your profile
    let g:gruvbox_bold='1'
    let g:gruvbox_italic='1'
    let g:gruvbox_undercurl='1'
    let g:gruvbox_termcolors='256'
    let g:gruvbox_underline='1'
    "let g:gruvbox_contrast='hard'
    let g:gruvbox_italicize_comments='1'
    let g:gruvbox_italicize_strings='1'
    let g:gruvbox_impoved_strings='1'
    let g:gruvbox_impoved_warnings='1'
    "let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_contrast_light='hard'
    "highlight Normal ctermbg=NONE
	let g:spacegray_underline_search = 1
	let g:spacegray_italicize_comments = 1
	let ayucolor="light"
	" nord colorscheme settings"
	let g:nord_cursor_line_number_background = 0
	let g:nord_uniform_status_line = 0
	let g:nord_bold_vertical_split_line = 0
	let g:nord_uniform_diff_background = 0
	let g:nord_bold = 1
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	let g:nord_underline = 1
	"let ayucolor="mirage"
	"let ayucolor="dark"
	colorscheme nord
    set go=a
    highlight Comment cterm=italic gui=italic
    highlight Search ctermbg=black ctermfg=yellow term=underline

" Disables automatic commenting on newline
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=0

" Goyo plugin makes text more readable when writing prose:
    map <leader>F :Goyo \| set background=dark\| set linebreak<CR>

" smart tab(space if it is in normal whitespace else autocompletion

"	function! CleverTab()
"	   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"	      return <"\<Tab>"		delete first < to use
"	   else
"	      return <"\<C-N>"
"	   endif
"	endfunction
"	inoremap <Tab> <C-R>=CleverTab()<CR>

" coc config
let g:coc_global_extensions = [
  \ 'coc-emoji',
  \ 'coc-css',
  \ 'coc-pyls',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-pairs',
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
  " \ 'coc-markdownlint',
  " \ 'coc-tslint',
  " \ 'coc-tslint-plugin',
  " \ 'coc-eslint',

" Better display for messages
set cmdheight=2
" Smaller updatetime for cursorhold & cursorholdI
set updatetime=300
" don't give |ins-completion-menu| messages
" set shortmess+=c
" always show signcolums
set signcolumn=auto

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
" these two mappings are supposed to do show.
" this one stimulates <C-x><C-o> to bring omni-completion menu, the stimulates <C-n><C-p> to remove longest common text
" then finally stimulates <Down> again to keep match highlighted
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
		\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" here's another example of set of mappings that first close any popups that are open which means you seamlessly switch between omni and user completions.
" if the menu is visible, use the above trick to keep the text you typed and select first
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
			\ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open an opening new menu without changing the text
inoremap <expr> <S-space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
			\ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" --------------------------------------------------------------------------------------------------
" --------------------------------------------------------------------------------------------------

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
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
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

" set width for codi
"   let g:coid#width=50.0
"
" Syntastic Configuration   #Check :help Syntastic
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    set statusline+=%#warningmsg#
    set statusline+=%{SystasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=0
    let g:syntastic_loc_list_height=6
    let g:syntastic_check_on_open=0
    let g:syntastic_auto_jump=3
    let g:syntastic_check_on_wq=0
    " let g:syntastic_enable_elixir_checker = 1
    " let g:syntastic_elixir_checkers = ["elixir"]
        map <leader>te :Errors<cr>
        map <leader>T :SynstasticToggleMode<CR>
        " map <leader>t :SyntasticCheck

        nnoremap cln :lnext<CR>
        nnoremap clp :lprevious<CR>
        nnoremap clc :lclose<CR>
        nnoremap <C-n> :cnext<CR>
        nnoremap <C-p> :cprev<CR>

" Elixir Tagbar Configuration (not active)
"let g:tagbar_type_elixir = {
""    \ 'ctagstype' : 'elixir',
""    \ 'kinds' : [
""        \ 'f:functions',
""        \ 'functions:functions',
""        \ 'c:callbacks',
""        \ 'd:delegates',
""        \ 'e:exceptions',
""        \ 'i:implementations',
""        \ 'a:macros',
""        \ 'o:operators',
""        \ 'm:modules',
""        \ 'o:operators',
""        \ 'm:modules',
""        \ 'p:protocols',
""        \ 'r:records',
""        \ 't:tests'
""    \ ]
""    \ }

"--------------------------------------------------------------------------------------------------------------------------------------------------------------
" Status Line
"--------------------------------------------------------------------------------------------------------------------------------------------------------------
" function! s:statusline_expr()
"     let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"     let ro = "%{&readonly ? '[RO] ' : ''}"
"     let ft = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"     let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"     let sep = ' %= '
"     let pos = ' %-12(%l : %c%V%) '
"     let pct = ' %P '

"     return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
" endfunction

" let &statusline = s:statusline_expr()

" " ---------------------------------------------------------------------------
" " change status line color for insert and replace modes
" " --------------------------------------------------------------------------

" " optimized for gruvbox:hard(both dark and light)
" function! InsertStatuslineColor(mode)
"     if a:mode == '1'
"         if(&background == 'dark')
"             hi StatusLine ctermfg=109 ctermbg=0 guifg=#83a598 guibg=#000000
"         else
"             hi StatusLine ctermfg=24 ctermbg=255 guifg=#076678 guibg=#ffffff
"         endif
"     elseif a:mode == 'r'
"         if (&background == 'dark')
"             hi StatusLine ctermfg=106 ctermbg=0 guifg=#98971a guibg=#000000
"         else
"             hi StatusLine ctermfg=100 ctermbg=255 guifg=#79740e guibg=#ffffff
"         endif
"     else
"         if (&background == 'dark')
"             hi StatusLine ctermfg=166 ctermbg=0 guifg=#d65d0e guibg=#000000
"         else
"             hi StatusLine ctermfg=88 ctermbg=255 guifg=#9d0006 guibg=#ffffff
"         endif
"     endif
" endfunction

" function! InsertLeaveActions()
"     if (&background == 'dark')
"         au InsertLeave * hi StatusLine ctermfg=239 ctermbg=223 guifg=#504945 guibg=#ebdbb2
"     else
"         au InsertLeave * hi StatusLine ctermfg=250 ctermbg=0 guifg=#d5c4a1 guibg=#000000
"     endif
" endfunction

" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertChange * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * call InsertLeaveActions()

" " Ensure status line color gets reverted if exiting insert mode with <C-c>
" inoremap <C-c> <C-o>:call InsertLeaveActions()<CR><C-c>

"--------------------------------------------------------------------------


" Vim-Airline configuration
   let g:airline#extensions#tabline#enabled=1
   let g:airline_powerline_fonts=1
   let g:airline_theme='nord'
   let g:hybrid_custom_term_colors=1
   let g:hybrid_reduced_contrast=1

" newtree(tweeks for browsing)
    let g:netrw_banner=0                "disables banner at top
    let g:netrw_browse_split=4          "open in prior window
    let g:netrw_altv=1                  "open splits to the right
    let g:netrw_liststyle=3             "tree view


"---------------------------------------------------------------------------
" scrooloose/nerdtree
"---------------------------------------------------------------------------
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
" NERDTree conf

" Open nerdtree at the current file or close nerd tree if pressed again
nnoremap <silent> <expr> <leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" --------- settings below slows down vim opening for a second

	" " autocmd vimenter * NERDTree
	" " " jump to main window
	" autocmd VimEnter * wincmd p
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " " sync open file with NERDTree
" " " " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
" 	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " " " Call NERDTreeFind if NERDTree is active, current window contains a modifiable file, not vimdiff
" function! SyncTree()
" 	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
" 		NERDTreeFind
" 		wincmd p
" 	endif
" endfunction

" " changing opening and closing arrow of NERDTree
let g:NERDTreeDirArrowExpandable  = "▷"
let g:NERDTreeDirArrowCollapsible = "◢"

" " Higlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()
" ----------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------

" searches down into subfolders
" provides tab-completion for all file-related tasks
    set path+=**

" Settings for vim latex live preview(needs working)
    let g:livepreview_previewer = 'zathura'
    "can also specify generator for latex

" Create the 'tags' file(install ctags)
    command! MakeTags !ctags -R .   "use ^] to jump to tag under cursor, g^] for ambiguous tag, ^t to jump back to tag stack

" vimling
    " nm <leader>d :call ToggleDeadKeys()<CR>

" Shortcutting split navigation,(laziness):
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Check file in shellcheck:
    map <leader>S :!clear && shellcheck %<CR>

" Compile document, for groff/LaTeX/markdown etc.
    " map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
    map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out the tex build files whenever I close out a .tex file
    " autocmd VimLeave *.tex !texclear %

" disables arrow movement, resize splits instead
    let g:elite_mode=1
    if get(g:, 'elite_mode')
        " nnoremap <Up>       :resize +2<CR>
        " nnoremap <Down>     :resize -2<CR>
        " nnoremap <Left>     :vertical resize +2<CR>
        " nnoremap <Right>    :vertical resize -2<CR>
		nnoremap <M-k>		:resize +2<CR>
		nnoremap <M-j>		:resize -2<CR>
		nnoremap <M-l>		:vertical resize +2<CR>
		nnoremap <M-h>		:vertical resize -2<CR>
    endif

    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
    " cnoremap w! !execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" breaks line beautifully instead of last fitting character
    set linebreak

" old
" +--  7 lines: set foldmethod=indent··············
"
" new ⏤⏤⏤⏤► [7 lines]: set foldmethod=indent ⏤⏤⏤⏤⏤⏤⏤⏤⏤⏤

	set foldcolumn=0
	set foldmarker=<<<,>>>
	set foldmethod=marker
	set fillchars=vert:╏,fold:━
"
	" I don't know why aren't they following this: "
	autocmd FileType vimwiki set foldmethod=marker
	autocmd FileType vimwiki set ft=markdown
	autocmd FileType markdown set foldmethod=marker

    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview


"Markdown

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



    let @+=@"
    let @*=@""

    ""    vnoremap <silent><Leader>y "yy <Bar> :call system('xclip', @y)<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" search :h ins-completion for auto-complete
"
    nnoremap \mainc :read $HOME/.vim/.skeleton/main.c<CR>ji<C-i>
    nnoremap \incc :read $HOME/.vim/.skeleton/include.c<CR>ji
    " use -1 read if you want snippet on the cursor line

" to get indentation
    nnoremap <leader>i :setlocal list!<CR>:setlocal list?<CR>

" indentLine Pluging customization
      " let g:indentLine_bgcolor_term = 202
      " let g:indentLine_color_term = 208
      " let g:indentLine_char = '┃'
	augroup FILETYPES
		autocmd FileType markdown let b:indentLine_setConceal=1
	augroup END


""" Using templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/shshebang.sh
        autocmd BufNewFile *.c 0r ~/.config/nvim/templates/incandmain.c
		autocmd BufNewFile *.py 0r ~/.config/nvim/templates/pyshebang.py
    augroup END
endif

".........................................................................
" plasticboy/vim-markdown
".........................................................................

" autocmd FileType markdown set conceallevel=2
" autocmd FileType markdown normal zR

".........................................................................
" iamcco/markdown-preview.nvim
".........................................................................

" let g:mkdp_refresh_slow=0
" let g:mkdp_markdown_css='/home/raytracer/dox/markdown/github-markdown-css/github-markdown.css'

".......................................................................
" vim-instant-markdown
".......................................................................
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"map <leader>md :InstantMarkdownPreview<CR>
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
"

" Notetaking
command! -nargs=1 Ngrep vimgrep "<args>" /home/raytracer/vimwiki/**/*.md
nnoremap <leader>[ :Ngrep

au BufRead,BufNewFile *wiki set filetype=markdown
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
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
:autocmd FileType vimwiki map <leader>cl :call ToggleCalendar() set ft=markdown

" Markdown codeblock highlight syntax
" let g:markdown_fenced_languages = ['c', 'bash', 'python']

" Vimwiki settings and ensures files are read as what is wanted:
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"     map <leader>v :set ft=markdown<CR>
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"     autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

"     augroup FILETYPES
"         autocmd FileType markdown let b:indentLine_enabled = 0
"     augroup END


" ----------------- settings for fzf --------------------- "
map <leader>ff :Files<CR>
map <leader>fc :Files ~/.config/<CR>
map <leader>fs :Files ~/.local/bin/.scripts/<CR>
map <leader>fl :Lines<CR>
map <leader>fw :Windows<CR>
"can also use :Files instead of :FZF
map <leader>fg :Files

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bc :Commands<CR>
nnoremap cq: :History:<CR>

command! -nargs=1 Locate call fzf#run( \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

" let g:fzf_files_options =
" 			\ '--preview "(codearay {} || cat {}) 2> /dev/null | head -' .&lines.'"'

let g:fzf_files_options =
			\ '--preview="pistol {}"'
" ----------------------- emmet plugin ------------------"
"" redefine default trigger key <C-y> followed by , "
"let g:user_emmet_leader_key='/'
"

" ------------- Using vimwiki settings from opensource.com(Manuel Dewald) ----
"
" let wiki_1 = {}
" " let wiki_1.path = '~/vimwiki/'
" let wiki_1.syntax = 'markdown'
" let wiki_1.ext = '.md'

" let g:vimwiki_list = [wiki_1]
" let g:vimwiki_ext2syntax = {}

" ---------------------
autocmd BufEnter * lcd %:p:h

" ---- vim-pandoc-syntax(without vim-pandoc) ------- "
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"----------------------------------------------------------------
"----------------------------------------------------------------

" Vim Hexokinase
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
"----------------------------------------------------------------
"----------------------------------------------------------------

" -- vim grepper --"
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
"----------------------------------------------------------------
"----------------------------------------------------------------

" --- ale pluging ----- "
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
"----------------------------------------------------------------
"----------------------------------------------------------------

" ---- vim-lion -----"
let g:lion_squeeze_spaces = 1
"----------------------------------------------------------------
"----------------------------------------------------------------


" --- vim-gitgutter ----"(only using because of staging feature)
" let g:gitgutter_grep                    = 'rg'
" let g:gitgutter_map_keys                = 0
" let g:gitgutter_map_keys                = 0
" let g:gitgutter_sign_added              = '▎'
" let g:gitgutter_sign_modified           = '▎'
" let g:gitgutter_sign_modified_removed   = '▶'
" let g:gitgutter_sign_removed            = '▶'
" let g:gitgutter_sign_removed_first_line = '◥'
" nmap [g <Plug>(GitGutterPrevHunk)
" nmap ]g <Plug>(GitGutterNextHunk)
" nmap <Leader>gp <Plug>(GitGutterPreviewHunk)
" nmap <Leader>+ <Plug>(GitGutterStageHunk)
" nmap <Leader>- <Plug>(GitGutterUndoHunk)
nmap <leader>gs :set signcolumn=
"----------------------------------------------------------------
"----------------------------------------------------------------

" -- undotree ----"
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 3
nnoremap <leader>U :UndotreeToggle<CR>
"----------------------------------------------------------------
"----------------------------------------------------------------

" ----- vim-fugitive ----- "
nnoremap <silent> <leader>B :Gblame<CR>
nnoremap <silent> <leader>C :Gclog %<CR>
nnoremap <silent> <leader>G :Gstatus<CR>
"----------------------------------------------------------------
"----------------------------------------------------------------

"" --- move visual block(dragvisual.vim)
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
"----------------------------------------------------------------
"----------------------------------------------------------------

" Remove any introduced trailing whitespace after moving...     ##
let g:DVB_TrimWS = 1

" operations related to foldmethod = marker
vnoremap af:<C-U>silent! normal! [zV]z<CR>
onoremap af:normal Vaf<CR>
vnoremap if:<C-U>silent! normal! [zjV]zk<CR>
onoremap if:normal Vif<CR>
"----------------------------------------------------------------
"----------------------------------------------------------------

" ----- majutsushi/tagbar ----- "
nmap <F8> :TagbarToggle<CR>
"----------------------------------------------------------------
"----------------------------------------------------------------

" ---- vim-signify ---------- "(first giving some try to vim-gitgutter)
nmap [g <plug>(signify-prev-hunk)
nmap ]g <plug>(signify-next-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk
