" Vim color file
" Maintainer:	koekeishiya
" Last Change:	2017 Jan 31

set bg&
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "koe"

" SYNTAX HIGHLIGHT GROUPS
"
" *Comment    any comment
"
" *Constant   any constant
"  String     a string constant: "this is a string"
"  Character  a character constant: 'c', '\n'
"  Number     a number constant: 234, 0xff
"  Boolean    a boolean constant: TRUE, false
"  Float      a floating point constant: 2.3e10
"
" *Identifier any variable name
"  Function   function name (also: methods for classes)
"
" *Statement        any statement
"  Conditional      if, then, else, endif, switch, etc.
"  Repeat           for, do, while, etc.
"  Label            case, default, etc.
"  Operator         'sizeof', '+', '*', etc.
"  Keyword          any other keyword
"  Exception        try, catch, throw
"
" *PreProc      generic Preprocessor
"  Include      preprocessor #include
"  Define       preprocessor #define
"  Macro        same as Define
"  PreCondit    preprocessor #if, #else, #endif, etc.
"
" *Type             int, long, char, etc.
"  StorageClass     static, register, volatile, etc.
"  Structure        struct, union, enum, etc.
"  Typedef          A typedef
"
" *Special          any special symbol
"  SpecialChar      special character in a constant
"  Tag              you can use CTRL-] on this
"  Delimiter        character that needs attention
"  SpecialComment   special things inside a comment
"  Debug            debugging statements
"
" *Underlined       text that stands out, HTML links
"
" *Ignore           left blank, hidden |hl-Ignore|
"
" *Error            any erroneous construct
"
" *Todo             anything that needs extra attention;
"                   mostly the keywords TODO FIXME and XXX

hi Pmenu ctermfg=7 ctermbg=Black guifg=White guibg=Black

hi Normal guifg=7 guibg=Black
hi Comment ctermfg=DarkGreen guifg=DarkGray

hi Identifier ctermfg=White guifg=#4f4f4f
hi cCustomFunc ctermfg=DarkGray guifg=#4f4f4f
hi link Function cCustomFunc

hi Statement ctermfg=White guifg=#4f4f4f
hi Operator ctermfg=White guifg=Green

hi Type ctermfg=Green guifg=Green
hi StorageClass ctermfg=White guifg=#4f4f4f
hi Structure ctermfg=White guifg=Green

hi Constant ctermfg=Cyan guifg=DarkGCyan
hi String ctermfg=DarkBlue guifg=DarkBlue
hi Character ctermfg=DarkBlue guifg=DarkBlue
hi Number ctermfg=Cyan guifg=DarkCyan
hi Boolean ctermfg=Cyan guifg=Green
hi Special ctermfg=DarkBlue guifg=DarkBlue

hi SignColumn ctermbg=Black guibg=Black
hi lineNr ctermfg=8 guifg=DarkGray

hi Todo ctermfg=DarkGreen guifg=DarkGreen ctermbg=NONE guibg=NONE cterm=bold gui=bold,underline
hi myNote ctermfg=DarkGreen ctermbg=NONE cterm=bold
hi myStatic ctermfg=White

hi Error ctermfg=Black ctermbg=DarkRed guifg=Black guibg=DarkRed

hi TabLine ctermbg=Black ctermfg=8 guibg=Black guifg=8
hi TabLineSel ctermfg=DarkRed guifg=DarkRed
hi TabLineFill ctermfg=Black guifg=Black
hi VertSplit ctermbg=Black ctermfg=Black guifg=Black guibg=Green

hi Search cterm=bold ctermfg=Black ctermbg=DarkRed guifg=Black gui=bold guibg=DarkRed
hi Visual ctermfg=Black ctermbg=DarkRed cterm=NONE

hi PreProc ctermfg=Green guifg=Green
hi MatchParen cterm=bold ctermbg=NONE ctermfg=Green
hi multiple_cursors_cursor ctermbg=Green
hi link multiple_cursors_visual Visual

hi StatusLine ctermfg=Black ctermbg=8 guifg=Black guibg=8
hi StatusLineNC ctermfg=Black ctermbg=8 guifg=Black guibg=8
hi CursorLine cterm=NONE ctermbg=Black gui=NONE guibg=Black
hi StatusLine ctermbg=NONE cterm=NONE
