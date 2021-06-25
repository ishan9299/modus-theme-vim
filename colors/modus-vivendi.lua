vim.o.bg = 'dark'

local colors = require('modus-themes.modus_vivendi').setup()
require('modus-themes.highlights').core_highlights(colors)
require('modus-themes.highlights').set_terminal(colors)

if vim.g.modus_moody_enable == 1 then
	require('modus-themes.galaxyline').set_statusline(colors)
end

