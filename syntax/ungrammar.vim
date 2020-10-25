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

syntax region ungramGroup matchgroup=ungramDelimiter start='(' end=/)\([?*]\)\@!/ contains=ALLBUT,ungramGrammar,ungramQuote display oneline
syntax region ungramConditionalGroup matchgroup=ungramConditional start='(' end=')\s*?' contains=ALLBUT,ungramGrammar,ungramQuote display oneline
syntax region ungramRepeatGroup matchgroup=ungramRepeat start='(' end=')\s*\*' contains=ALLBUT,ungramGrammar,ungramQuote display oneline

syntax region ungramString matchgroup=ungramQuote start=/'/ skip=/\\'/ end=/'\([?*]\)\@!/ concealends contains=ungramToken display oneline
syntax region ungramConditionalString matchgroup=ungramConditional start=/'/ skip=/\\'/ end=/'\s*?/ contains=ungramToken display oneline
syntax region ungramRepeatString matchgroup=ungramRepeat start=/'/ skip=/\\'/ end=/'\s*\*/ contains=ungramToken display oneline

syntax match ungramAlternation /^|\|\s\+|\s\+/ containedin=ungramOr display
syntax match ungramOr '|' contains=ungramAlternation display

syntax match ungramConditional '?' display
syntax match ungramLabel /\('\)\@<![_A-Za-z0-9]\+:\('.*'\)\@=/ contains=ungramString display
syntax match ungramOperator '=' display
syntax match ungramQuote /\(\\\)\@<!'/ contained
syntax match ungramRepeat '*' display
syntax match ungramToken /[A-Za-z0-9]\+\(_[A-Za-z0-9]\+\)\+/ contained display

syntax match ungramRule /\('\)\@<![_A-Za-z0-9]\+\('\)\@!/ contains=ALLBUT,ungramGrammar,ungramQuote,ungramToken display

" ==============================================================================

let b:current_syntax = 'ungrammar'
