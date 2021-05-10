local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local colors

cmd('hi clear')

if o.bg == 'dark' then
	colors = require('modus-themes.modus_vivendi').setup()
else
	colors = require('modus-themes.modus_operandi').setup()
end

if fn.exists('syntax_on') then
	cmd('syntax reset')
end

local settings = {
	modus_faint_syntax = 0,
	modus_moody_enable = 0,
	modus_yellow_comments = 0,
	modus_green_strings = 0
}

for key,val in pairs(settings) do
	if g[key] == nil then
		g[key] = val
	end
end

-- this will apply the highlights
local highlight = function(group, foreground, background, style)
	local g_foreground = foreground[1]
	local c_foreground = foreground[2]
	local g_background = background[1]
	local c_background = background[2]
	style = style or 'none'
	cmd(string.format(
	'hi %s guifg=%s guibg=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s',
	group, g_foreground, g_background, style, c_foreground, c_background, style
	))
end

-- link function will link 2 groups
local link = function(target, source)
	cmd(string.format('hi! link %s %s', target, source))
end

function M.core_highlights()
	highlight('Normal', colors.fg_main, colors.bg_main)
	highlight('NonText', colors.fg_alt, colors.bg_main)
	highlight('NormalNC', colors.fg_inactive, colors.bg_inactive)
	highlight('Folded', colors.fg_special_mild, colors.bg_special_mild)
	highlight('Error', colors.fg_main, colors.red_intense_bg)
	link('ErrorMsg', 'Error')
	if g.modus_yellow_comments == 1 then
		highlight('Comment', colors.fg_comment_yellow, colors.bg_main, 'italic')
	else
		highlight('Comment', colors.fg_alt, colors.bg_main, 'italic')
	end
	highlight('Conceal', colors.fg_special_warm, colors.bg_dim)
	highlight('Cursor', colors.bg_main, colors.fg_main)
	link('lCursor', 'Cursor')
	link('CursorIM', 'Cursor')
	highlight('ColorColumn', colors.bg_main, colors.bg_active)
	highlight('CursorLine', colors.none, colors.bg_hl_line)
	link('Define', 'Normal')
	link('Delimiter', 'Normal')
	link('Float', 'Normal')
	link('Special', 'Normal')
	link('SpecialComment', 'Comment')
	highlight('Title', colors.fg_special_cold, colors.bg_main, 'bold')
	highlight('Visual', colors.fg_main, colors.magenta_intense_bg)
	link('Whitespace', 'NonText')
	highlight('TabLine', colors.fg_main, colors.bg_tab_inactive)
	highlight('TabLineSel', colors.fg_tab_accent, colors.bg_tab_active)
	highlight('TabLineFill', colors.bg_main, colors.bg_tab_bar)
	highlight('Search', colors.fg_main, colors.green_intense_bg)
	highlight('EndOfBuffer', colors.fg_inactive, colors.bg_main)
	if g.modus_faint_syntax == 1 then
		highlight('Function', colors.magenta_faint, colors.bg_main)
		highlight('Warning', colors.yellow_alt_faint, colors.bg_main)
		highlight('Boolean', colors.blue_faint, colors.bg_main, 'bold')
		highlight('Character', colors.blue_alt_faint, colors.bg_main)
		highlight('Conditional', colors.magenta_alt_other_faint, colors.bg_main)
		highlight('Constant', colors.blue_alt_other_faint, colors.bg_main)
		highlight('Directory', colors.blue_faint, colors.bg_main)
		highlight('Include', colors.red_alt_other_faint, colors.bg_main)
		highlight('Label', colors.cyan_faint, colors.bg_main)
		highlight('Todo', colors.magenta_faint, colors.bg_main, 'bold')
		highlight('Type', colors.magenta_alt_faint, colors.bg_main)
	else
		highlight('Function', colors.magenta, colors.bg_main)
		highlight('Warning', colors.yellow_alt, colors.bg_main)
		highlight('Boolean', colors.blue, colors.bg_main, 'bold')
		highlight('Character', colors.blue_alt, colors.bg_main)
		highlight('Conditional', colors.magenta_alt_other, colors.bg_main)
		highlight('Constant', colors.blue_alt_other, colors.bg_main)
		highlight('Directory', colors.blue, colors.bg_main)
		highlight('Include', colors.red_alt_other, colors.bg_main)
		highlight('Label', colors.cyan, colors.bg_main)
		highlight('Todo', colors.magenta, colors.bg_main, 'bold')
		highlight('Type', colors.magenta_alt, colors.bg_main)
	end
	link('Exception', 'Conditional')
	highlight('Tag', colors.magenta_active, colors.bg_main)
	link('Identifier', 'Constant')
	link('Keyword', 'Conditional')
	link('PreProc', 'Include')
	link('Repeat', 'Conditional')
	link('SpecialChar', 'Constant')
	link('Statement', 'Conditional')
	link('StorageClass', 'Conditional')
	if g.modus_green_strings == 1 then
		highlight('String', colors.green_alt, colors.bg_main)
	else
		highlight('String', colors.blue_alt, colors.bg_main)
	end
	link('Structure', 'Conditional')
	link('Typedef', 'Type')
	highlight('Underlined', colors.fg_main, colors.bg_main, 'underline')
	highlight('MatchParen', colors.fg_main, colors.bg_paren_match)
	link('Number', 'Normal')
	link('Operator', 'Normal')
	highlight('Pmenu', colors.fg_active, colors.bg_active)
	highlight('PmenuSel', colors.fg_dim, colors.bg_dim)
	highlight('PmenuSbar', colors.bg_main, colors.bg_inactive)
	link('PmenuThumb', 'Cursor')
	highlight('StatusLine', colors.bg_main, colors.blue_active)
	highlight('StatusLineNC', colors.fg_inactive, colors.bg_main)
	highlight('LineNr', colors.fg_alt, colors.bg_dim)
	highlight('CursorLineNr', colors.fg_active, colors.bg_active, 'bold')
	highlight('SignColumn', colors.bg_main, colors.bg_inactive)
	link('VertSplit', 'Normal')
	highlight('DiffAdd', colors.fg_diff_added, colors.bg_diff_added)
	highlight('DiffChange', colors.fg_diff_changed, colors.bg_diff_changed)
	highlight('DiffDelete', colors.fg_diff_removed, colors.bg_diff_removed)
	highlight('DiffText', colors.fg_diff_changed, colors.bg_diff_changed)
	highlight('SpellBad', colors.fg_lang_error, colors.bg_main)
	highlight('SpellCap', colors.fg_lang_error, colors.bg_main)
end


function M.language_highlights()
	-- languages
	-- lua
	highlight('luaConstant', colors.blue_alt_other, colors.bg_main, 'bold')
	link('luaComment', 'Comment')
	link('luaStatement', 'Statement')
	link('luafunctioncall', 'Function')
	link('luaemmyfluff', 'NonText')
	link('luaTodo', 'Todo')
	link('luaVarName', 'Label')
	link('luaFunc', 'Function')
	if g.modus_faint_syntax == 1 then
		highlight('luaTableConstructor', colors.magenta_alt_faint, colors.bg_main)
	else
		highlight('luaTableConstructor', colors.magenta_alt, colors.bg_main)
	end

	-- python
	link('pythonoperator', 'Normal')

	-- css
	link('cssVendor', 'Statement')

	-- vim
	link('vimcommand', 'Conditional')
	link('vimLet', 'Conditional')
	link('vimFuncVar', 'Constant')
	link('vimCommentTitle', 'Include')
	link('vimIsCommand', 'Normal')
	link('vimFuncSID', 'Normal')
	link('vimCommentString', 'Comment')
	link('vimMapModKey', 'Normal')
	highlight('vimMapLhs', colors.bg_main, colors.bg_main)
	link('vimNotation', 'Normal')
	link('vimBracket', 'Normal')
	link('vimmap', 'Conditional')
	link('vimnotfunc', 'Conditional')
	link('nvimmap', 'Conditional')
	link('nvimplainassignment', 'Type')
	link('nvimidentifier', 'Identifier')
	link('vimvar', 'Label')

	-- markdown
	highlight('markdownh1', colors.fg_main, colors.magenta_nuanced_bg, 'bold')
	highlight('markdownh2', colors.fg_special_warm, colors.red_nuanced_bg, 'bold')
	highlight('markdownh3', colors.fg_special_cold, colors.blue_nuanced_bg, 'bold')
	highlight('markdownh4', colors.fg_special_mild, colors.cyan_nuanced_bg, 'bold')
	highlight('markdownh5', colors.fg_special_calm, colors.bg_main, 'bold')
	highlight('markdownh6', colors.yellow_nuanced_fg, colors.bg_main, 'bold')
	highlight('markdownrule', colors.fg_special_warm, colors.bg_main, 'bold')
	highlight('markdownitalic', colors.fg_special_cold, colors.bg_main, 'italic')
	highlight('markdownbold', colors.fg_main, colors.bg_main, 'bold')
	highlight('markdownbolditalic', colors.fg_main, colors.bg_main, 'bold')
	highlight('markdowncodedelimiter', colors.green_alt_other, colors.bg_main, 'bold')
	highlight('markdowncode', colors.fg_special_mild, colors.bg_dim)
	highlight('markdowncodeblock', colors.fg_special_mild, colors.bg_dim)
	highlight('markdownfootnotedefinition', colors.fg_main, colors.bg_main, 'italic')
	highlight('markdownlistmarker', colors.fg_alt, colors.bg_main, 'bold')
	highlight('markdownlinebreak', colors.cyan_refine_fg, colors.cyan_refine_bg, 'underline')
	highlight('markdownurl', colors.blue_faint, colors.bg_main)
	highlight('markdownfootnote', colors.cyan_alt_faint, colors.bg_main, 'italic')
	highlight('markdownblockquote', colors.magenta_faint, colors.bg_main, 'bold')
	highlight('markdownlinktext', colors.blue_faint, colors.bg_main, 'italic')

	-- nix
	highlight('nixattributedefinition', colors.cyan, colors.bg_main)
	highlight('nixattribute', colors.blue_alt_other, colors.bg_main)
	highlight('nixfunctioncall', colors.magenta, colors.bg_main)
end

function M.plugin_highlights()
	-- plugins
	-- lsp
	highlight('lspdiagnosticssignerror', colors.red_active, colors.bg_active, 'bold')
	highlight('lspdiagnosticsvirtualtexterror', colors.red_active, colors.bg_main, 'bold')
	highlight('lspdiagnosticsunderlineerror', colors.red_active, colors.bg_main, 'underline')
	highlight('lspdiagnosticssignwarning', colors.yellow_active, colors.bg_active, 'bold')
	highlight('lspdiagnosticsvirtualtextwarning', colors.yellow_active, colors.bg_main, 'bold')
	highlight('lspdiagnosticsunderlinewarning', colors.yellow_active, colors.bg_main, 'underline')
	highlight('lspdiagnosticssignhint', colors.green_active, colors.bg_active, 'bold')
	highlight('lspdiagnosticssigninformation', colors.green_active, colors.bg_active, 'bold')
	highlight('lspdiagnosticsvirtualtexthint', colors.green_active, colors.bg_active, 'bold')
	highlight('lspdiagnosticsunderlineinformation', colors.green_active, colors.bg_main, 'underline')

	-- treesitter
	highlight('tsannotation', colors.blue_nuanced_bg, colors.bg_main)
	link('tsboolean', 'Boolean')
	link('tscharacter', 'Character')
	link('tscomment', 'Comment')
	link('tsconditional', 'Conditional')
	link('tsconstant', 'Constant')
	link('tsconstbuiltin', 'Constant')
	link('tsconstmacro', 'Constant')
	highlight('tserror', colors.fg_main, colors.red_intense_bg, 'bold')
	link('tsexception', 'Conditional')
	link('tsfield', 'Constant')
	link('tsfloat', 'Normal')
	link('tsfunction', 'Function')
	link('tsfuncbuiltin', 'Function')
	link('tsfuncmacro', 'Function')
	link('tsinclude', 'Include')
	link('tskeyword', 'Conditional')
	link('tslabel', 'Label')
	link('tsmethod', 'Function')
	link('tsnamespace', 'Include')
	link('tsnumber', 'Normal')
	link('tsoperator', 'Normal')
	link('tsparameterreference', 'Constant')
	link('tsproperty', 'Constant')
	link('tspunctdelimiter', 'Normal')
	link('tspunctbracket', 'Normal')
	link('tspunctspecial', 'Normal')
	link('tsrepeat', 'Conditional')
	link('tsstring', 'String')
	highlight('tsstringregex', colors.fg_escape_char_construct, colors.bg_main)
	highlight('tsstringescape', colors.fg_escape_char_backslash, colors.bg_main)
	highlight('tsstrong', colors.fg_main, colors.bg_main, 'bold')
	link('tsconstructor', 'Type')
	link('tskeywordfunction', 'Type')
	if g.modus_faint_syntax == 1 then
		highlight('tsliteral', colors.blue_alt_faint, colors.bg_main, 'bold')
	else
		highlight('tsliteral', colors.blue_alt, colors.bg_main, 'bold')
	end
	link('tsparameter', 'Label')
	link('tsvariable', 'Label')
	link('tsvariablebuiltin', 'Conditional')
	link('tstag', 'Label')
	link('tstagdelimiter', 'Label')
	highlight('tstitle', colors.cyan_nuanced_fg, colors.bg_main)
	link('tstype', 'Type')
	link('tstypebuiltin', 'Type')
	highlight('tsemphasis', colors.fg_main, colors.bg_main, 'italic')
	highlight('telescopematching', colors.fg_main, colors.green_intense_bg, 'bold')

	-- startify
	link('startifyheader', 'Title')
	highlight('startifyspecial', colors.fg_special_warm, colors.bg_main, 'bold')
	highlight('startifysection', colors.fg_special_warm, colors.bg_main, 'bold')
	link('startifypath', 'Normal')
	link('startifyfile', 'Normal')
	link('startifybracket', 'Normal')
	link('startifyslash', 'Normal')
	highlight('startifyfooter', colors.fg_special_mild, colors.bg_main)

	highlight('nvimtreefoldericon', colors.blue, colors.bg_main)

	-- bufferline
	highlight('buffercurrent', colors.fg_tab_accent, colors.bg_tab_active)
	highlight('buffercurrentmod', colors.yellow_active, colors.bg_tab_active)
	highlight('buffercurrentsign', colors.fg_tab_accent, colors.bg_tab_active, 'bold')
	highlight('buffercurrenttarget', colors.magenta_active, colors.bg_tab_active, 'bold')
	highlight('buffervisible', colors.fg_main, colors.bg_tab_active)
	highlight('buffervisiblemod', colors.green_active, colors.bg_tab_active)
	highlight('buffervisiblesign', colors.fg_tab_accent, colors.bg_tab_active, 'bold')
	highlight('buffervisibletarget', colors.magenta_active, colors.bg_tab_active, 'bold')
	highlight('bufferinactive', colors.fg_main, colors.bg_tab_inactive)
	highlight('bufferinactivemod', colors.green_active, colors.bg_tab_inactive)
	highlight('bufferinactivesign', colors.fg_tab_accent, colors.bg_tab_inactive, 'bold')
	highlight('bufferinactivetarget', colors.magenta_active, colors.bg_tab_inactive, 'bold')

	-- rainbow parens
	highlight('rainbowcol1', colors.green_alt_other, colors.bg_main)
	highlight('rainbowcol2', colors.magenta_alt_other, colors.bg_main)
	highlight('rainbowcol3', colors.cyan_alt_other, colors.bg_main)
	highlight('rainbowcol4', colors.yellow_alt_other, colors.bg_main)
	highlight('rainbowcol5', colors.blue_alt_other, colors.bg_main)
	highlight('rainbowcol6', colors.green_alt, colors.bg_main)
	highlight('rainbowcol7', colors.magenta_alt_other, colors.bg_main)
end

function M.set_terminal()
	g.terminal_color_0  = "#555555"
	g.terminal_color_8  = "#222222"
	g.terminal_color_1  = colors.red_faint
	g.terminal_color_9  = colors.red_intense
	g.terminal_color_2  = colors.green_faint
	g.terminal_color_10 = colors.green_intense
	g.terminal_color_3  = colors.yellow_faint
	g.terminal_color_11 = colors.yellow_intense
	g.terminal_color_4  = colors.blue_faint
	g.terminal_color_12 = colors.blue_intense
	g.terminal_color_5  = colors.magenta_faint
	g.terminal_color_13 = colors.magenta_intense
	g.terminal_color_6  = colors.cyan_faint
	g.terminal_color_14 = colors.cyan_intense
	g.terminal_color_7  = "#ffffff"
	g.terminal_color_15 = "#dddddd"
end

function M.set_statusline()
	local gl = require('galaxyline')
	local gls = gl.section
	gl.short_line_list = {'LuaTree','vista','dbui'}

	local buffer_not_empty = function()
		if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
			return true
		end
		return false
	end

	gls.left[1] = {
		FirstElement = {
			provider = function() return '▋' end,
			highlight = {colors.bg_active, colors.bg_active}
		}
	}

	gls.left[2] = {
		ViMode = {
			provider = function()
				local mode_color = {
					n      = colors.magenta_active,
					i      = colors.green_active,
					v      = colors.cyan_active,
					[''] = colors.cyan_active,
					V      = colors.cyan_active,
					c      = colors.red_active,
					R      = colors.red_active,
					Rv     = colors.red_active,
					t      = colors.blue_active,
					['!']  = colors.blue_active,
				}
				local alias = {
					n      = 'NORMAL',
					i      = 'INSERT',
					v      = 'VISUAL',
					[''] = 'V·BLOCK',
					V      = 'V·LINE',
					c      = 'COMMAND',
					R      = 'REPLACE',
					Rv     = 'V·REPLACE',
					t      =  'TERM',
					['!']  =  'SHELL'
				}
				cmd('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
				return alias[vim.fn.mode()]
			end,
			separator = '',
			separator_highlight = {colors.bg_active,function()
				if not buffer_not_empty() then
					return colors.bg_main
				end
				return colors.bg_main
			end},
			highlight = {colors.fg_active,colors.bg_active,'bold'},
		},
	}

	gls.left[3] ={
		FileIcon = {
			provider = 'FileIcon',
			condition = buffer_not_empty,
			highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg_main},
		},
	}

	gls.left[4] = {
		FileName = {
			provider = {'FileName','FileSize'},
			condition = buffer_not_empty,
			separator = '',
			separator_highlight = {colors.bg_active,colors.bg_main},
			highlight = {colors.fg_active,colors.bg_main,'bold'}
		}
	}

	gls.left[5] = {
		GitIcon = {
			provider = function() return '  ' end,
			condition = buffer_not_empty,
			highlight = {colors.fg_active,colors.bg_active},
		}
	}
	gls.left[6] = {
		GitBranch = {
			provider = 'GitBranch',
			condition = buffer_not_empty,
			highlight = {colors.fg_active,colors.bg_active},
		}
	}

	local checkwidth = function()
		local squeeze_width  = vim.fn.winwidth(0) / 2
		if squeeze_width > 40 then
			return true
		end
		return false
	end

	gls.left[7] = {
		DiffAdd = {
			provider = 'DiffAdd',
			condition = checkwidth,
			icon = ' ',
			highlight = {colors.green_active,colors.bg_active},
		}
	}
	gls.left[8] = {
		DiffModified = {
			provider = 'DiffModified',
			condition = checkwidth,
			icon = ' ',
			highlight = {colors.yellow_active,colors.bg_active},
		}
	}
	gls.left[9] = {
		DiffRemove = {
			provider = 'DiffRemove',
			condition = checkwidth,
			icon = ' ',
			highlight = {colors.red_active,colors.bg_active},
		}
	}
	gls.left[10] = {
		LeftEnd = {
			provider = function() return '' end,
			condition = buffer_not_empty,
			highlight = {colors.bg_active,colors.bg_main}
		}
	}
	gls.left[11] = {
		DiagnosticError = {
			provider = 'DiagnosticError',
			icon = '  ',
			highlight = {colors.red_active,colors.bg_main}
		}
	}
	gls.left[12] = {
		Space = {
			provider = function () return ' ' end
		}
	}
	gls.left[13] = {
		DiagnosticWarn = {
			provider = 'DiagnosticWarn',
			icon = '  ',
			highlight = {colors.yellow_active,colors.bg_main},
		}
	}

	gls.right[1]= {
		FileFormat = {
			provider = 'FileFormat',
			separator = '',
			separator_highlight = {colors.bg_main,colors.bg_active},
			highlight = {colors.fg_active,colors.bg_active},
		}
	}
	gls.right[2] = {
		LineInfo = {
			provider = 'LineColumn',
			separator = ' | ',
			separator_highlight = {colors.fg_active,colors.bg_active},
			highlight = {colors.fg_active,colors.bg_active},
		},
	}
	gls.right[3] = {
		PerCent = {
			provider = 'LinePercent',
			separator = '',
			separator_highlight = {colors.bg_main,colors.bg_active},
			highlight = {colors.fg_active,colors.bg_main},
		}
	}
	gls.right[4] = {
		ScrollBar = {
			provider = 'ScrollBar',
			highlight = {colors.fg_active,colors.bg_main},
		}
	}

	gls.short_line_left[1] = {
		BufferType = {
			provider = { 'FileName' },
			separator = '',
			separator_highlight = {colors.bg_active,colors.bg_main},
			highlight = {colors.fg_active,colors.bg_active}
		}
	}

	gls.short_line_right[1] = {
		BufferIcon = {
			provider= 'BufferIcon',
			separator = '',
			separator_highlight = {colors.bg_active,colors.bg_main},
			highlight = {colors.fg_active,colors.bg_active}
		}
	}
end

-- now try to use libuv to make it faster.
M.core_highlights()
M.language_highlights()
M.plugin_highlights()
M.set_terminal()


if g.modus_moody_enable == 1 then
	M.set_statusline()
end

return M
