" Code of Conquer settings and bindings
" full autocompletion settings

" coc extensions <<<
let g:coc_global_extensions = [
			\ 'coc-clangd',
			\ 'coc-emoji',
			\ 'coc-pairs',
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
			\ 'coc-lua',
			\ 'coc-sh',
			\ 'coc-css',
			\ 'coc-vimlsp',
			\ 'coc-explorer',
			\ 'coc-ultisnips'
			\ ]
" >>>

" some coc related key-bindings <<<
" Remap for format selected region
xmap <leader>v  <Plug>(coc-format-selected)
nmap <leader>v  <Plug>(coc-format-selected)

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


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

" Using CocList
" Show all diagnostics
nnoremap <silent> ,,a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> ,,e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ,,c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> ,,o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ,,s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ,,j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> ,,k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> ,,p  :<C-u>CocListResume<CR>
" >>>

" rest coc settings and functions <<<
command! -nargs=0 Prettier :CocCommand prettier.formatFile
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json,c,python setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Higlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1] =~ # '\s'
" endfunction

" Explorer (floating window)
" let g:coc_explorer_global_presets = {
" 	    \ 'floating': {
" 	    \ 'position': 'floating',
" 	    \ },
" 	    \ 'floatingLeftside': {
" 	    \ 'position': 'floating',
" 	    \ 'floating-position': 'left-center',
" 	    \ 'floating-width': 30,
" 	    \ },
" 	    \ 'floatingRightside': {
" 	    \ 'position': 'floating',
" 	    \ 'floating-position': 'right-center',
" 	    \ 'floating-width': 30,
" 	    \ },
" 	    \ 'simplify': {
" 	    \ 'file.child.template': '[selection | clip | 1] [filename omitCenter 1]'
" 	    \ }
" 	    \ }
nnoremap ,Ee :CocCommand explorer<CR>
" nnoremap ,Ef :CocCommand explorer --preset floatingRightside<CR>
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" >>>

" some auto-completion settings for <c-space>, <c-n> and <c-p> <<<
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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

" some autocomplete settings <<<
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmkcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
augroup endif
" >>>
