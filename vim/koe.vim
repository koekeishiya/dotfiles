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

hi YcmErrorSection ctermbg=0 guibg=#282828
hi YcmErrorSign ctermfg=Black ctermbg=DarkRed guifg=#282828 guibg=DarkRed
hi Pmenu ctermfg=7 ctermbg=Black guifg=#353535 guibg=#131313
hi Type ctermfg=8 guifg=#353535
hi Statement ctermfg=8 guifg=#353535
hi Comment ctermfg=DarkGreen guifg=#38662F
hi String ctermfg=3 guifg=#BDD322
hi Character ctermfg=3 guifg=#BDD322
hi Identifier ctermfg=DarkBlue guifg=DarkBlue
hi Boolean ctermfg=DarkRed guifg=DarkRed
hi SignColumn ctermbg=Black guibg=Black
hi Todo ctermbg=NONE guibg=NONE
hi Todo ctermfg=Red guifg=Red
hi Todo cterm=underline gui=underline
hi lineNr ctermfg=DarkRed guifg=Green
hi Number ctermfg=DarkRed guifg=Green
hi cCustomFunc ctermfg=DarkBlue guifg=DarkBlue
hi VertSplit ctermfg=black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi TabLine ctermbg=Black ctermfg=DarkBlue guibg=Black guifg=DarkBlue
hi TabLineSel ctermfg=DarkRed guifg=DarkRed
hi TabLineFill ctermfg=Black guifg=Black
hi StatusLine ctermfg=Black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi StatusLineNC ctermfg=Black ctermbg=DarkBlue guifg=Black guibg=DarkBlue
hi Normal guifg=#606060 guibg=#131313
hi CursorLine cterm=NONE ctermbg=Black gui=NONE guibg=Black
hi Error ctermfg=Black ctermbg=DarkRed guifg=Blac guibg=DarkRed
hi Search ctermbg=DarkYellow
hi PreProc ctermfg=5
hi MatchParen cterm=bold ctermbg=none ctermfg=8

set guifont=Osaka-Mono:h12

" vim: sw=2
