" Filetype: ungrammar (*.ungram)
" Repo: https://github.com/Iron-E/vim-ungrammar
" Credit: https://github.com/tbastos/vim-lua,
"         https://learnvimscriptthehardway.stevelosh.com/chapters/45.html

if exists("b:current_syntax")
	finish
endif

syntax sync fromstart

" ==============================================================================

syntax region ungramGrammar start=/^\(\S\|[^|]\)/ end=/^\n/ fold keepend transparent

syntax match ungramAlternation /^|\|\s\+|\s\+/ containedin=ungramOr display
syntax match ungramConditional '?' display
syntax match ungramDelimiter /[()]/ display
syntax match ungramLabel /\('\)\@<![_A-Za-z0-9]\+:\(''\)\@=/ conceal contains=ungramString display
syntax match ungramOperator '=' display
syntax match ungramOr '|' contains=ungramAlternation display
syntax match ungramQuote /\(\\\)\@<!'/ conceal
syntax match ungramRepeat '*' display
syntax match ungramRule /\('\)\@<![_A-Za-z0-9]\+\('\)\@!/ contains=ALLBUT,ungramGrammar,ungramQuote,ungramToken display
syntax match ungramString /\('\)\@<=[^ \t]\+\('\)\@=/ display
syntax match ungramToken /\('\)\@<=[A-Za-z0-9]\+\(_[A-Za-z0-9]\+\)\+\('\)\@=/ display

" ==============================================================================

let b:current_syntax = 'ungrammar'
