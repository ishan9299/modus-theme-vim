lua package.loaded['modus-vivendi'] = nil

hi clear

set bg=dark

if exists('syntax_on')
  syntax reset
end

let g:colors_name = 'modus-vivendi'

if !exists('g:modus_faint_syntax')
  let g:modus_faint_syntax = 0
end

lua require('modus-vivendi')
