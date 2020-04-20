hi SignColumn guifg=#F6E2BE guibg=#235566 gui=bold
hi GREEN      guifg=#A6E22E guibg=#235566 gui=bold

sign define DONE text=✔ texthl=SignColumn

execute 'sign place 1 line=1 name=DONE file=' . expand('%:p')
