"
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

let mapleader =","

"-------All-the-plugins-for-vim-and-nvim----------------------
call plug#begin()
Plug 'vim-syntastic/syntastic' "error checker for languages and scripts
Plug 'dense-analysis/ale'
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'tmux-plugins/vim-tmux'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/emmet-vim'			" for html
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
"
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/calendar-vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'gabrielelana/vim-markdown'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Theme / Interface
"Plug 'Yggdroot/indentLine'
"Plug 'AnsiEsc.vim'
Plug 'ayu-theme/ayu-vim'
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
"Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'metakirby5/codi.vim'
"Plug 'jreybert/vimagit'
"Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
"Plug 'bling/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'roxma/nvim-completion-manager'
"Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'

" display colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

" set colorcolumn=110
" highlight ColorColumn ctermbg=darkgray
" set textwidth=0
" if exists('&colorcolumn')
" 	set colorcolumn=100
" endif

"highlight ColorColumn ctermbg=NONE guibg=red


" always display status line

" minimap customization
" let g:minimap_highlight='Visual'

" enbale highlighting current line
"set cursorline

" Limelight configuration
    let g:limelight_conceal_ctermbg='dark-gray'
    let g:limelight_conceal_ctermfg=240
    let g:limelight_default_coefficient=0.5
    let g:limelight_paragraph_span=1

" python syntax
	let g:python_highlight_all = 1
	let g:python_slow_sync = 0

" Goyo configuration
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab
set list lcs=tab:\ \ ,trail:-,extends:>,precedes:<,nbsp:+
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set complete+=kspell
set completeopt=menuone,preview
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
set nohls
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
highlight SpecialKey guifg=#ffffff guibg=#116611

hi SpellBad cterm=underline ctermfg=9
hi SpellLocal cterm=underline ctermfg=9
hi SpellRare cterm=underline ctermfg=9
hi SpellCap cterm=underline

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
    autocmd FileType c inoremap ;c (<++>)<Space>{<CR><++><CR>}<CR><CR><++><Esc>4kI
    autocmd FileType markdown inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
    autocmd FileType html inoremap ;c <!---<Space><Space>--><CR><CR><++><Esc>2kf<Space>a
	autocmd FileType markdown inoremap ;sh ```sh<CR>```<CR><CR><++><Esc>2kO<C-i>

" Cycle through splits
nnoremap <S-Tab> <C-w>w

" Clear search highlights
map <Leader><Space> :let @/=''<CR>

" Edit vim config file in a new tab
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source vim config file
map <Leader>sv :source $MYVIMRC<CR>

" Toggle relative line number
nmap <F5> :set invrelativenumber number<CR>
nmap <leader>n :set nonumber norelativenumber<CR>

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
nnoremap <silent><Leader>C :call QuickFix_toggle()<CR>
nmap <leader>ic :set noic<CR>

"---------------------------------------------------------------------------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" " Autocompletion for parenthesis and others(not active)
" 	inoremap ( ()<Esc>:let leavechar=")"<CR>i
" 	inoremap [ []<Esc>:let leavechar="]"<CR>i
" 	inoremap { {}<Esc>:let leavechar="}"<CR>i
" 	autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
" 	inoremap ) <c-r>=ClosePair(')')<CR>
" 	inoremap ] <c-r>=ClosePair(']')<CR>
" 	inoremap } <c-r>=CloseBracket('}')<CR>

" (	 inoremap <" <c-r>=QuoteDelim('"')<CR>	) 	delete < to use
	 " inoremap <' <c-r>=QuoteDelim("'")<CR>
	 " inoremap <` <c-r>=QuoteDelim('`')<CR>

" function ClosePair(char)
 " if getline('.')[col('.') - 1] == a:char
	"  return <"\<Right>"	delete first < to use
 " else
	"  return a:char
 " endif
" endf

" function CloseBracket()
 " if match(getline(line('.') + 1), '\s*}') < 0
	"  return <"\<CR>}"	delete first < to use
 " else
	"  return <"\<Esc>j0f}a"	delete first < to use
 " endif
" endf

"function QuoteDelim(char)
" let line = getline('.')
" let col = col('.')
" if line[col - 2] == <"\\">	Delete the <> in last to use
" "Inserting a quoted quotation mark into the string
" return a:char
" elseif line[col - 1] == a:char
" "Escaping out of the string
" return <"\<Right>"	delete first < to use
" else
" "Starting a string
" return a:char.a:char."\<Esc>i"
" endif
"endf
"	imap <C-j> <Esc>:exec <"normal f" . leavechar<CR>a	delete < of "normal f

"
" colorscheme configuration
    let base16colorspace=256
	set background=dark
    " source this to your profile
" source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"
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
	"let ayucolor="mirage"
	"let ayucolor="dark"
	colorscheme dracula
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
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Higlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

" set width for codi
"   let g:coid#width=50.0
"
" Syntastic Configuration   #Check :help Syntastic
	set statusline^=%{coc#status()}
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
        map <leader>t :Errors<cr>
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
   let g:airline_theme='dracula'
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
let g:NERDTreeShowHidden=0
let g:NERDTreeAutoDeleteBuffer=1
" NERDTree conf
    map <leader>N :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " map <C-m> :TagbarToggle<CR>

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

" Open bibliography file in split(haven't created yet):
    " map <leader>b :vsp<space>$BIB<CR>
    " map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S, so using <leader>s
    map <leader>s :%s//g<Left><Left>

" Compile document, for groff/LaTeX/markdown etc.
    map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
    map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out the tex build files whenever I close out a .tex file
    " autocmd VimLeave *.tex !texclear %

" disables arrow movement, resize splits instead
    let g:elite_mode=1
    if get(g:, 'elite_mode')
        nnoremap <Up>       :resize +2<CR>
        nnoremap <Down>     :resize -2<CR>
        nnoremap <Left>     :vertical resize +2<CR>
        nnoremap <Right>    :vertical resize -2<CR>
    endif

    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
    cnoremap w! !execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" breaks line beautifully instead of last fitting character
    set linebreak

" folding settings

" old
" +--  7 lines: set foldmethod=indent··············
"
" new ⏤⏤⏤⏤► [7 lines]: set foldmethod=indent ⏤⏤⏤⏤⏤⏤⏤⏤⏤⏤
    function! Foldtext() abort
        let l:start_arrow = '⏤⏤⏤⏤► '
        return l:start_arrow . l:lines . ': ' . l:first_line . ' '
    endfunction

    if has('folding')
        " set foldmethod=indent     #check out :h foldmethod
        set foldlevelstart=10
        if has('windows')
            " use wider line for folding
            set fillchars+=fold:⏤
            set foldtext=Foldtext()
        endif
    endif
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
	" augroup FILETYPES
		" autocmd FileType markdown let b:indentLine_setConceal=0
	" augroup END


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

au BufRead,BufNewFile *.wiki set filetype=markdown
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
let g:markdown_fenced_languages = ['c', 'bash', 'python']

" Vimwiki settings and ensures files are read as what is wanted:
    " let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

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
"can also use :Files instead of :FZF
map <leader>gf :Files

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

" Vim Hexokinase
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
