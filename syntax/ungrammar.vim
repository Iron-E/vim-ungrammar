" Filetype: ungrammar (*.ungram)
" URL: https://github.com/Iron-E/vim-ungrammar

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

syntax region ungramGroup matchgroup=ungramDelimiter start='(' end=/)\([?*]\)\@!/ contains=ALL display oneline
syntax region ungramConditionalGroup matchgroup=ungramConditional start='(' end=')?' contains=ALL display oneline
syntax region ungramRepeatGroup matchgroup=ungramRepeat start='(' end=')\*' contains=ALL display oneline

syntax match ungramAlternation '|' display
syntax match ungramConditional '?' display
syntax match ungramLabel /\('\)\@<![_A-Za-z0-9]\+:\('.*'\)\@=/ contains=ungramString display
syntax match ungramOperator '=' display
syntax match ungramQuote /\(\\\)\@<!'/
syntax match ungramRepeat '*' display
syntax match ungramString /'[A-Za-z0-9]\+'/ contains=ungramQuote display
syntax match ungramToken /'[A-Za-z0-9]\+\(_[A-Za-z0-9]\+\)\+'/ contains=ungramQuote display

syntax match ungramRule /\('\)\@<![_A-Za-z0-9]\+\('\)\@!/ contains=ALLBUT,ungramToken,ungramString display

" ==============================================================================

let b:current_syntax = 'ungrammar'
