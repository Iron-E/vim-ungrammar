" Filetype: ungrammar (*.ungram)
" Repo: https://github.com/Iron-E/vim-ungrammar
" Credit: https://github.com/tbastos/vim-lua,
"         https://learnvimscriptthehardway.stevelosh.com/chapters/45.html

if exists("b:current_syntax")
	finish
endif

syntax sync fromstart

" ==============================================================================

syntax region ungramGrammar start='^\(\S\|[^|]\)' end=#^\n# fold keepend transparent

syntax region ungramGroup matchgroup=ungramDelimiter start='(' end=')' contains=ALLBUT,ungramGrammar display oneline

syntax region ungramString matchgroup=ungramQuote start=#'# end=#'# concealends contains=ungramToken display oneline
syntax region ungramString matchgroup=ungramQuote start=#'# end=#\v'(\*|\?)@=# contains=ungramToken display oneline

syntax region ungramComment start=#/\*# end=#\*/# concealends display

syntax match ungramAlternation #^\s*|# containedin=ungramOr display
syntax match ungramComment #//.*$# display
syntax match ungramDocComment #///.*$# display
syntax match ungramLabel #_*\l[_a-z]*:# contained display contains=ungramLabelDelimiter
syntax match ungramLabelDelimiter #:# contained display nextgroup=ungramLabel,ungramString,ungramRule
syntax match ungramOperator '=' display
syntax match ungramOr '|' contains=ungramAlternation display
syntax match ungramRepeat '\*' display
syntax match ungramRepeat '?' display
syntax match ungramToken '\v\w+(_\w+)+' contained display

syntax match ungramRule #\v'@<!\w+'@!# contains=ALLBUT,ungramGrammar,ungramString,ungramToken display

" ==============================================================================

let b:current_syntax = 'ungrammar'
