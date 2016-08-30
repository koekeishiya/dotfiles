" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "koe"

" ctermfg = 8 is a replacement for DarkGray

hi YcmErrorSection ctermbg=Black guibg=Black
hi YcmErrorSign ctermfg=Black ctermbg=DarkRed guifg=Black guibg=DarkRed
hi Pmenu ctermfg=White ctermbg=Black guifg=White guibg=Black
hi Type ctermfg=8 guifg=#353535
hi Statement ctermfg=8 guifg=#353535
hi Comment ctermfg=DarkGray guifg=DarkGray
hi String ctermfg=Yellow guifg=DarkGreen
hi Character ctermfg=Yellow guifg=DarkGreen
hi Identifier ctermfg=DarkBlue guifg=DarkBlue
hi Boolean ctermfg=DarkRed guifg=DarkRed
hi SignColumn ctermbg=Black guibg=Black
hi Todo ctermfg=DarkRed guifg=DarkRed ctermbg=NONE guibg=NONE cterm=bold,underline gui=bold,underline
hi lineNr ctermfg=DarkRed guifg=DarkRed
hi Number ctermfg=DarkRed guifg=DarkRed
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
hi Search ctermfg=White cterm=bold ctermbg=Red
hi PreProc ctermfg=Magenta
hi MatchParen cterm=bold ctermbg=none ctermfg=8

set guifont=Input

" vim: sw=2
