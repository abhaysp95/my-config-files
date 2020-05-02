" Airline configuration <<<
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
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
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
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

let g:airline_theme='material'
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
" >>>
