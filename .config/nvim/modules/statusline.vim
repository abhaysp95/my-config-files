" ////////////////////////////////////////////////
" //			Statusline						//
" //			George B						//
" //			Vim group						//
" ////////////////////////////////////////////////

set laststatus=2
hi Base           guibg=background gui=italic
hi Mode           guifg=#0f111a guibg=#f78c6c
hi Filetype       guifg=#f78c6c guibg=#1f2233
hi FilePath       guifg=#A0A9B4 guibg=#1f2233 gui=italic


" Mode arrow have unique color
hi ModeArrow      guifg=#f78c6c
hi NotModeArrow   guifg=#1f2233

let s:left_separator = ""
let s:right_separator = ""

function! ActiveLine()
    let statusline = ""
    " Mode
    let statusline .= "%#Base#"
    let statusline .= " %#ModeArrow#"
	" .s:left_separator
    let statusline .= "%#Mode# %{ModeCurrent()}"
    let statusline .= "%#ModeArrow#"
	" .s:right_separator

    " Filename with modified flag
    let statusline .= " %#NotModeArrow#"
	" .s:left_separator

    let statusline .= "%#Modi# [%n] %{IsModified(&modified)} %m"
    let statusline .= " %#NotModeArrow#"
	" .s:right_separator

    " Go to right
    let statusline .= "%="

    " Filepath till of this file, on left side ( with condition of string length)
    if len(GetFilePath()) + len(IsModified(&modified)) + 40 < winwidth('.')
        let statusline .= "%#NotModeArrow#"
		" .s:left_separator
        let statusline .= "%#FilePath# %{GetFilePath()} "
        let statusline .= "%#NotModeArrow#"
		" .s:right_separator
    endif

    " Filetype
    let statusline .= " %#NotModeArrow#"
	" .s:left_separator
    let statusline .= "%#Filetype# %{CheckFT(&filetype)} "
    let statusline .= "%#NotModeArrow#"
	" .s:right_separator

    " Current line and column
    let statusline .= " %#NotModeArrow#"
	". s:left_separator
    let statusline .= "%#Filetype# ln %l:%L | %c"
    let statusline .= " %#NotModeArrow#"
	" .s:right_separator." "

    return statusline
endfunction
function GetFilePath()
    return expand('%:p:h')
endfunction



function! InactiveLine()
  let statusline = ""
  let statusline .= "%#Base# %F "
  return statusline
endfunction

let g:currentmode={
  \'n' : 'Normal ',
  \'no' : 'N·Operator Pending ',
  \'v' : 'Visual ',
  \'V' : 'V·Line ',
  \'^V' : 'V·Block ',
  \'s' : 'Select ',
  \'S': 'S·Line ',
  \'^S' : 'S·Block ',
  \'i' : 'Insert ',
  \'R' : 'Replace ',
  \'Rv' : 'V·Replace ',
  \'c' : 'Command ',
  \'cv' : 'Vim Ex ',
  \'ce' : 'Ex ',
  \'r' : 'Prompt ',
  \'rm' : 'More ',
  \'r?' : 'Confirm ',
  \'!' : 'Shell ',
  \'t' : 'Terminal '
  \}

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

function! LineNum()
    hi Modo guifg=#f78c6c guibg=#212333 gui=bold,italic
endfunction

function! IsModified(modified)
  hi Modi guifg=#E1E5F4 guibg=#212333 gui=bold,italic
  if a:modified == 1
    return expand('%:t').'*'
  else
    return expand('%:t')
  endif
endfunction

augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END
