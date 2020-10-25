if get(g:, 'ungrammar_formatting', v:true)
	" Tabbing options
	let &tabstop = 2
	let &shiftwidth  = 0  " Use tabstop
	let &softtabstop = -1 " Use shiftwidth
	set expandtab
endif

