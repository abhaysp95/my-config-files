" All the keybindings except of those used in plugins

" check sidescroll for horizontal when nowrap is set
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

" keep cursor at the bottom of the visual selection after you yank it <<<
vnoremap y ygv<Esc>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" >>>

" repeat replacement <<<
" type replacement term and press '.' to repeat the
" replacement.(somewhat like vim-multiple-cursor plugin)
nnoremap <silent> <leader>s* :let@/='\<'.expand('<cword>').'\>'<CR>cgn
" you might as well can search the word and then do 'ce' to replace that word. Depends on how you need it
xnoremap <silent> <leader>s* "sy:let @/=@s<CR>cgn
" >>>

" Press enter for newline without insert <<<
nnoremap <cr> o<esc>
nnoremap <localleader><cr> O<esc>
" but don't effect command line mode
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd CmdwinLeave * nnoremap <CR> o<CR>
" >>>

" ---- format paragraph ------ "<<<
" format paragraph (selected or not) to 80 character lines
nnoremap <leader>gP gqap
xnoremap <leader>gP gqa
" >>>

nnoremap c "_c
inoremap j' <ESC>
" inoremap <localleader><Space> <Esc>/<++><Enter>"_c4l
inoremap <M-,> <Esc>/<++><Enter>"_c4l

" some custom snipptes <<<
" autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
" autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
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
" >>>

" linenumber settings <<<
nmap <F5>      : set invrelativenumber number<CR>
nmap <leader>N : set nonumber norelativenumber<CR>
" >>>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>Ic :set noic<CR>

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

" useful for error detection (error detection) <<<
nnoremap cln :lnext<CR>
nnoremap clp :lprevious<CR>
nnoremap clc :lclose<CR>
nnoremap clo :lopen<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
" >>>

nnoremap <leader>nl :Lex! \| vertical resize 30<CR>

" Some handy setting <<<
nnoremap gG ggvG
nnoremap g. @:
nnoremap U <C-R>
nnoremap cd :cd %:p:h<CR>
nnoremap cu :cd ..<CR>
nnoremap zq :qa!<CR>
autocmd FileType help nnoremap <buffer>q :helpclose<CR>
" >>>

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

" Enable/disable auto comments character <<<
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

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' \| edit!

" Notestaking and text/config editing <<<
autocmd FileType markdown nnoremap <F7> :!pandoc<Space><C-r>%<space>-o<Space><C-r>%.pdf<Enter><Enter>
autocmd FileType rmd nnoremap <F7> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

nnoremap <leader>[ :Ngrep
" >>>

" copy/paste registers <<<
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" >>>

" delete all buffers except current one
nnoremap <leader>bd :silent :w \| %bd \| e#<CR>

nmap <leader>gs :set signcolumn=

" operations related to foldmethod = marker(marco trosi) <<<
vnoremap af:<c-u>silent! normal! [zv]z$<cr>
onoremap af:normal vaf<cr>
vnoremap if:<c-u>silent! normal! [zjv]zk$<cr>
onoremap if:normal vif<cr>
" >>>
