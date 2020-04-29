
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
Plug 'tpope/vim-markdown'

Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'

Plug 'vim-pandoc/vim-pandoc-syntax'

" Theme / Interface
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'lifepillar/vim-solarized8'
Plug 'sjl/badwolf'
Plug 'rbgrouleff/bclose.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'kaicataldo/material.vim'
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
" >>> And this is done by the way
