lua package.loaded['modus-operandi'] = nil

hi clear

set bg=light

if exists('syntax_on')
  syntax reset
end

let g:colors_name = 'modus-operandi'

if !exists('g:modus_faint_syntax')
  let g:modus_faint_syntax = 0
end

lua require('modus-operandi')
