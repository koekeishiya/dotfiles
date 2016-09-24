" Vim color file
" Maintainer:	koekeishiya
" Last Change:	2016 Sept 6

set bg&
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "koe"

" ctermfg = 8 is a replacement for a color between #000000 and #505050
" depending on the value of the background color.

hi YcmErrorSection ctermbg=Black guibg=Black
hi YcmErrorSign ctermfg=Black ctermbg=DarkRed guifg=Black guibg=DarkRed
hi Pmenu ctermfg=White ctermbg=Black guifg=White guibg=Black
hi Type ctermfg=8 guifg=#353535
hi Statement ctermfg=8 guifg=DarkRed
hi Constant ctermfg=DarkGreen guifg=DarkGreen
hi Operator ctermfg=DarkGreen guifg=DarkGreen
hi Number ctermfg=DarkGreen guifg=DarkGreen
hi Comment ctermfg=DarkGray guifg=DarkGray
hi Special ctermfg=DarkYellow guifg=DarkYellow
hi String ctermfg=Yellow guifg=Yellow
hi Character ctermfg=Yellow guifg=Yellow
hi Identifier ctermfg=DarkBlue guifg=DarkBlue
hi Boolean ctermfg=DarkGreen guifg=DarkGreen
hi SignColumn ctermbg=Black guibg=Black
hi Todo ctermfg=Red guifg=DarkRed ctermbg=NONE guibg=NONE cterm=bold,underline gui=bold,underline
hi lineNr ctermfg=DarkGray guifg=DarkGray
hi cCustomFunc ctermfg=DarkBlue guifg=DarkBlue
hi VertSplit ctermfg=Black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi TabLine ctermbg=Black ctermfg=DarkBlue guibg=Black guifg=DarkBlue
hi TabLineSel ctermfg=DarkRed guifg=DarkRed
hi TabLineFill ctermfg=Black guifg=Black
hi StatusLine ctermfg=Black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi StatusLineNC ctermfg=Black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi Normal guifg=White guibg=Black
hi CursorLine cterm=NONE ctermbg=Black gui=NONE guibg=Black
hi Error ctermfg=Black ctermbg=DarkRed guifg=Black guibg=DarkRed
hi Search cterm=bold ctermbg=15 guifg=Black gui=bold guibg=White
hi Visual ctermbg=15 cterm=NONE
hi PreProc ctermfg=Magenta guifg=Magenta
hi MatchParen cterm=bold ctermbg=NONE ctermfg=8

" vim: sw=2
