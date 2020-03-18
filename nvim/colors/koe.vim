" Vim color file
" Maintainer:	koekeishiya
" Last Change:	2020 March 16

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

hi Pmenu ctermfg=7 ctermbg=0

hi Comment ctermfg=2

hi Identifier ctermfg=7
hi cCustomFunc ctermfg=8
hi link Function cCustomFunc

hi Statement ctermfg=15
hi Operator ctermfg=15

hi Type ctermfg=10
hi StorageClass ctermfg=15
hi Structure ctermfg=15

hi Constant ctermfg=6
hi String ctermfg=4
hi Character ctermfg=4
hi Number ctermfg=6
hi Boolean ctermfg=6
hi Special ctermfg=4

hi SignColumn ctermbg=8
hi lineNr ctermfg=8

hi Todo ctermfg=2 ctermbg=NONE cterm=bold
hi myNote ctermfg=2 ctermbg=NONE cterm=bold
hi myStatic ctermfg=15

hi Error ctermfg=8 ctermbg=1

hi TabLine ctermfg=8 ctermbg=0
hi TabLineSel ctermfg=7 ctermbg=0 cterm=NONE
hi TabLineFill ctermfg=0 ctermbg=8
hi VertSplit ctermbg=0 ctermfg=0

hi Search cterm=bold ctermfg=0 ctermbg=1
hi Visual ctermfg=8 ctermbg=1 cterm=NONE

hi PreProc ctermfg=10
hi MatchParen cterm=bold ctermbg=NONE ctermfg=10

hi StatusLine ctermfg=7 ctermbg=0 cterm=NONE
hi StatusLineNC ctermfg=8 ctermbg=0 cterm=NONE
hi CursorLine ctermfg=7 ctermbg=0 cterm=NONE
