" Filetype: ungrammar (*.ungram)
" URL: https://github.com/Iron-E/nvim-ungrammar

if exists("b:current_syntax")
	finish
endif

syntax sync fromstart

function! s:FoldableRegion(tag, name, expr)
	let synexpr = 'syntax region ' . a:name . ' ' . a:expr
	let pfx = 'g:lua_syntax_fold_'
	if !exists('g:lua_syntax_nofold') || exists(pfx . a:tag) || exists(pfx . a:name)
		let synexpr .= ' fold'
	end
	exec synexpr
endfunction

" ==============================================================================

syntax match ungramRule /\('\)\@<![_A-Za-z0-9]\+\('\)\@!/ contains=ALLBUT,ungramLabel,ungramToken display

syntax match ungramAlternation '|' display
syntax match ungramConditional '?' display
syntax region ungramConditionalGroup start='(' end=')?' contains=ungramGroup display matchgroup=ungramConditional oneline
syntax region ungramGroup start='(' end=/)\([?!]\)\@!/ display matchgroup=ungramDelimiter oneline
syntax match ungramLabel /\('\)\@<![_A-Za-z0-9]\+:\('.*'\)\@=/ contains=ungramString display
syntax match ungramOperator '=' display
syntax match ungramRepeat '*' display
syntax region ungramRepeatGroup start='(' end=')*' contains=ungramGroup display matchgroup=ungramRepeat oneline
syntax region ungramString start=/'/ skip=/\\'/ end=/'/ contains=ungramToken display matchgroup=ungramString oneline
syntax match ungramToken /[A-Za-z0-9]\+[_A-Za-z0-9]\+/ contained display

" ==============================================================================

let b:current_syntax = 'ungrammar'
