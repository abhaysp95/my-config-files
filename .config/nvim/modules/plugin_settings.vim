" All the plugin settins other than theme related and coc

" Limelight configuration <<<
let g:limelight_conceal_ctermbg     = 'dark-gray'
let g:limelight_conceal_ctermfg     = 240
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span      = 1
" >>>

" Goyo plugin makes text more readable when writing prose: <<<
map <leader>F :Goyo \| set background=dark\| set linebreak<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" >>>

" *Ultisnips configs <<<
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" >>>


" Syntastic Configuration   #Check :help Syntastic <<<
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=6
let g:syntastic_check_on_open=0
let g:syntastic_auto_jump=3
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_enable_highlighting = 1
" let g:syntasitc_mode_map = {
" 			\ "mode": "passive",
" 			\ "passive_filetypes": ["python"] }
let b:syntastic_mode="passive"
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]

let g:syntastic_quiet_messages = {'regex': 'E117\|W191'}
nnoremap <leader>te :Errors<cr>
nnoremap <leader>T :SyntasticToggleMode<CR>
nnoremap <leader>ts :SyntasticCheck<CR>
" >>>

" -------------------- emmet plugin ---------------" <<<
"" redefine default trigger key <C-y> followed by , "
let g:user_emmet_leader_key='<S-Tab>'
" >>>

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
let g:ale_sign_error                            = '●'
let g:ale_sign_warning                          = '·'
"let g:ale_linters_explicit                     = 1
"let g:ale_open_list                            = 1
let g:ale_lint_on_enter                         = 0
" if you want to show after opening file save file
let g:ale_lint_on_save                          = 1
"let g:ale_lint_on_filetype_changed             = 0
let g:ale_lint_on_insert_leave                  = 0
" let g:ale_python_pylint_use_global				= 1
"let g:ale_lint_on_text_changed                 = 'never'
" nmap <leader>El	<Plug>(ale_lint)
" nmap <leader>E	<Plug>(ale_fix)
" nmap <leader><BS>		<Plug>(ale_reset_buffer)
" >>>

" ---- vim-lion -----"
let g:lion_squeeze_spaces = 1

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
" let g:startfiy_custom_header = [
let s:header = [
			\ '',
			\ '',
			\ '   ╻ ╻   ╻   ┏┳┓',
			\ '   ┃┏┛   ┃   ┃┃┃',
			\ '   ┗┛    ╹   ╹ ╹',
			\ '   ',
			\ ]

function! s:center(lines) abort
	let longest_line = max(map(copy(a:lines), 'strwidth(v:val)'))
	let centered_lines = map(copy(a:lines),
				\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)
" >>>

" junegunn/rainbow_parethesis <<<
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses
let g:rainbow#blacklist = [248, '#1f2233', '#464b5d']
" >>>

" gcmt/wildfire.vim <<<
" This selects the next closest text object.
map <leader><CR> <Plug>(wildfire-fuel)

" This selects the previous closest text object.
" vmap <leader><CR> <Plug>(wildfire-water)

" ----- airblade/vim-rooter ---- "
let g:rooter_change_directory_for_non_project_files = 'current'

" ------ vim-slime ---- "
let g:slime_target = "x11"
" let g:slime_config = {"jobid": b:terminal_job_id}


"""""""""""""""""""""""""""
" Yggdroot/indentline
"""""""""""""""""""""""""""

let g:indentline_leadingSpaceEnabled = 1
let g:indentline_leadingSpaceChar = '.'

""""""""""""""""""""""""""""""""
"  indent-line-guide
""""""""""""""""""""""""""""""""
autocmd FileType python,yaml :IndentGuidesEnable
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
