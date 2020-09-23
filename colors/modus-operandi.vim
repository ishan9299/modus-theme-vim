if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='modus-operandi'

if !exists('g:modus_faint_syntax')
  let g:modus_faint_syntax = 0
endif

lua require('modus-operandi')
