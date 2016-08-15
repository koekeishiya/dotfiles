syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" syn keyword cTodo NOTE
hi myNote ctermfg=Green ctermbg=NONE cterm=bold,underline
syn match myNote /NOTE/ containedin=cComment,cCommentL

hi def cCustomFunc  gui=bold ctermfg=DarkBlue guifg=yellowgreen
hi def link cCustomClass Function
