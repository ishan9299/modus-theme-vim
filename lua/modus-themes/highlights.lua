local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn

cmd('hi clear')

if o.bg == 'dark' then
	colors = require('modus-themes.modus_vivendi').setup()
else
	colors = require('modus-themes.modus_operandi').setup()
end

if fn.exists("syntax_on") then
	cmd('syntax reset')
end

local settings = {
	modus_faint_syntax = 0,
	modus_moody_line = 0,
	modus_yellow_comments = 0,
	modus_green_strings = 0
}

for key,val in pairs(settings) do
	if g[key] == nil then
		g[key] = val
	end
end

local setup = function(group, colors)
	cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group, colors.fg, colors.bg, colors.style))
end

function M.load_syntax()

	local yellow_comments = function()
		if vim.g.modus_faint_syntax == 0 then
			return colors.fg_alt
		else
			return colors.yellow_faint
		end
	end

	local green_strings = function()
		if vim.g.modus_green_strings == 0 then
			return colors.blue_alt
		else
			return colors.green_alt
		end
	end

	local faint_syntax = function(key)
		if vim.g.modus_faint_syntax == 1 then
			key = key .. '_faint'
			return colors[key]
		else
			return colors[key]
		end
	end

	local syntax = {}
	-- core
	syntax['Normal'] = {fg=colors.fg_main , bg=colors.bg_main , style='none'}
	syntax['NonText'] = {fg=colors.fg_alt , bg=colors.bg_main , style='none'}
	syntax['NormalNC'] = {fg=colors.fg_inactive , bg=colors.bg_inactive , style='none'}
	syntax['Folded'] = {fg=colors.fg_special_mild , bg=colors.bg_special_mild , style='none'}
	syntax['Error'] = {fg=colors.fg_main , bg=colors.red_intense_bg , style='none'}
	syntax['ErrorMsg'] = syntax['Error']
	syntax['Comment'] = {fg=yellow_comments() , bg=colors.bg_main , style='none'}
	syntax['Conceal'] = {fg=colors.fg_special_warm , bg=colors.bg_dim , style='none'}
	syntax['Cursor'] = {fg=colors.bg_main , bg=colors.fg_main , style='none'}
	syntax['lCursor'] = syntax['Cursor']
	syntax['CursorIM'] = syntax['Cursor']
	syntax['ColorColumn'] = {fg=colors.bg_main , bg=colors.bg_active , style='none'}
	syntax['CursorLine'] = {fg='none', bg=colors.bg_hl_line, style='none'}
	syntax['Define'] = syntax['Normal']
	syntax['Delimiter'] = syntax['Normal']
	syntax['Float'] = syntax['Normal']
	syntax['Special'] = syntax['Normal']
	syntax['SpecialComment'] = syntax['Comment']
	syntax['Title'] = {fg=colors.fg_special_cold , bg=colors.bg_main , style='bold'}
	syntax['Visual'] = {fg=colors.fg_main , bg=colors.magenta_intense_bg , style='none'}
	syntax['Whitespace'] = syntax['NonText']
	syntax['TabLine'] = {fg=colors.fg_main , bg=colors.bg_tab_inactive , style='none'}
	syntax['TabLineSel'] = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='none'}
	syntax['TabLineFill'] = {fg=colors.bg_main , bg=colors.bg_tab_bar , style='none'}
	syntax['Search'] = {fg=colors.fg_main , bg=colors.green_intense_bg , style='none'}
	syntax['EndOfBuffer'] = {fg=colors.fg_inactive , bg=colors.bg_main , style='none'}
	syntax['Function'] = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='none'}
	syntax['Warning'] = {fg=faint_syntax('yellow_alt') , bg=colors.bg_main , style='none'}
	syntax['Boolean'] = {fg=faint_syntax('blue') , bg=colors.bg_main , style='bold'}
	syntax['Character'] = {fg=faint_syntax('blue_alt') , bg=colors.bg_main , style='none'}
	syntax['Conditional'] = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='none'}
	syntax['Constant'] = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='none'}
	syntax['Directory'] = {fg=faint_syntax('blue') , bg=colors.bg_main , style='none'}
	syntax['Exception'] = syntax['Conditional']
	syntax['Identifier'] = syntax['Constant']
	syntax['Include'] = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='none'}
	syntax['Keyword'] = syntax['Conditional']
	syntax['Label'] = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='none'}
	syntax['PreProc'] = syntax['Include']
	syntax['Repeat'] = syntax['Conditional']
	syntax['SpecialChar'] = syntax['Constant']
	syntax['Statement'] = syntax['Conditional']
	syntax['StorageClass'] = syntax['Conditional']
	syntax['String'] = {fg=green_strings() , bg=colors.bg_main , style='none'}
	syntax['Structure'] = syntax['Conditional']
	syntax['Tag'] = {fg=faint_syntax('magenta_active') , bg=colors.bg_main , style='none'}
	syntax['Todo'] = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='bold'}
	syntax['Type'] = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='none'}
	syntax['Typedef'] = syntax['Type']
	syntax['Underlined'] = {fg=colors.fg_main , bg=colors.bg_main , style='underline'}
	syntax['Type'] = syntax['Type']
	syntax['MatchParen'] = {fg=colors.fg_main , bg=colors.bg_paren_match , style='none'}
	syntax['Number'] = syntax['Normal']
	syntax['Operator'] = syntax['Normal']
	syntax['Pmenu'] = {fg=colors.fg_active , bg=colors.bg_active , style='none'}
	syntax['PmenuSel'] = {fg=colors.fg_dim , bg=colors.bg_dim , style='none'}
	syntax['PmenuSbar'] = {fg=colors.bg_main , bg=colors.bg_inactive , style='none'}
	syntax['PmenuThumb'] = syntax['Cursor']
	syntax['StatusLine'] = {fg=colors.bg_main , bg=colors.blue_active , style='none'}
	syntax['StatusLineNC'] = {fg=colors.fg_inactive , bg=colors.bg_main , style='none'}
	syntax['LineNr'] = {fg=colors.fg_alt , bg=colors.bg_dim , style='none'}
	syntax['CursorLineNr'] = {fg=colors.fg_active , bg=colors.bg_active , style='bold'}
	syntax['SignColumn'] = {fg=colors.bg_main , bg=colors.bg_inactive , style='none'}
	syntax['VertSplit'] = syntax['Normal']
	syntax['DiffAdd'] = {fg=colors.fg_diff_added , bg=colors.bg_diff_added , style='none'}
	syntax['DiffChange'] = {fg=colors.fg_diff_changed , bg=colors.bg_diff_changed , style='none'}
	syntax['DiffDelete'] = {fg=colors.fg_diff_removed , bg=colors.bg_diff_removed , style='none'}
	syntax['DiffText'] = {fg=colors.fg_diff_changed , bg=colors.bg_diff_changed , style='none'}
	syntax['SpellBad'] = {fg=colors.fg_lang_error , bg=colors.bg_main , style='none'}
	syntax['SpellCap'] = {fg=colors.fg_lang_error , bg=colors.bg_main , style='none'}

	-- lua
	syntax['luaConstant'] = {fg=colors.blue_alt_other , bg=colors.bg_main , style='bold'}
	syntax['luaComment'] = syntax['Comment']
	syntax['luaStatement'] = {fg=faint_syntax('magenta_alt_other'), bg=colors.bg_main , style='none'}
	syntax['luafunctioncall'] = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='none'}
	syntax['luaemmyfluff'] = syntax['NonText']
	syntax['luaTodo'] = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='bold'}
	syntax['luaVarName'] = {fg=faint_syntax('cyan'), bg=colors.bg_main , style='none'}
	syntax['luaFunc'] = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='none'}
	syntax['luaTableConstructor'] = {fg=faint_syntax('magenta_alt'), bg=colors.bg_main , style='none'}

	-- python
	syntax['pythonoperator'] = syntax['Normal']

	-- vim
	syntax['vimcommand'] = syntax['Conditional']
	syntax['vimLet'] = syntax['Conditional']
	syntax['vimFuncVar'] = syntax['Constant']
	syntax['vimCommentTitle'] = syntax['Include']
	syntax['vimIsCommand'] = syntax['Normal']
	syntax['vimFuncSID'] = syntax['Normal']
	syntax['vimCommentString'] = syntax['Comment']
	syntax['vimMapModKey'] = syntax['Normal']
	syntax['vimMapLhs'] = {fg=colors.bg_main , bg=colors.bg_main , style='none'}
	syntax['vimNotation'] = syntax['Normal']
	syntax['vimBracket'] = syntax['Normal']
	syntax['vimmap'] = syntax['Conditional']
	syntax['vimnotfunc'] = syntax['Conditional']
	syntax['nvimmap'] = syntax['Conditional']
	syntax['nvimplainassignment'] = syntax['Type']
	syntax['nvimidentifier'] = {fg=faint_syntax('cyan_alt') , bg=colors.bg_main , style='none'}
	syntax['vimvar'] = syntax['Label']

	-- lspconfig
	syntax['lspdiagnosticssignerror'] = {fg=colors.red_active , bg=colors.bg_active , style='bold'}
	syntax['lspdiagnosticsvirtualtexterror'] = {fg=colors.red_active , bg=colors.bg_main , style='bold'}
	syntax['lspdiagnosticsunderlineerror'] = {fg=colors.red_active , bg=colors.bg_main , style='underline'}
	syntax['lspdiagnosticssignwarning'] = {fg=colors.yellow_active , bg=colors.bg_active , style='bold'}
	syntax['lspdiagnosticsvirtualtextwarning'] = {fg=colors.yellow_active , bg=colors.bg_main , style='bold'}
	syntax['lspdiagnosticsunderlinewarning'] = {fg=colors.yellow_active , bg=colors.bg_main , style='underline'}
	syntax['lspdiagnosticssignhint'] = {fg=colors.green_active , bg=colors.bg_active , style='bold'}
	syntax['lspdiagnosticssigninformation'] = {fg=colors.green_active , bg=colors.bg_active , style='bold'}
	syntax['lspdiagnosticsvirtualtexthint'] = {fg=colors.green_active , bg=colors.bg_active , style='bold'}
	syntax['lspdiagnosticsunderlineinformation'] = {fg=colors.green_active , bg=colors.bg_main , style='underline'}

	-- markdown
	syntax['markdownh1'] = {fg=colors.fg_main , bg=colors.magenta_nuanced_bg , style='bold'}
	syntax['markdownh2'] = {fg=colors.fg_special_warm , bg=colors.red_nuanced_bg , style='bold'}
	syntax['markdownh3'] = {fg=colors.fg_special_cold , bg=colors.blue_nuanced_bg , style='bold'}
	syntax['markdownh4'] = {fg=colors.fg_special_mild , bg=colors.cyan_nuanced_bg , style='bold'}
	syntax['markdownh5'] = {fg=colors.fg_special_calm , bg=colors.bg_main , style='bold'}
	syntax['markdownh6'] = {fg=colors.yellow_nuanced_fg , bg=colors.bg_main , style='bold'}
	syntax['markdownrule'] = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'}
	syntax['markdownitalic'] = {fg=colors.fg_special_cold , bg=colors.bg_main , style='italic'}
	syntax['markdownbold'] = {fg=colors.fg_main , bg=colors.bg_main , style='bold'}
	syntax['markdownbolditalic'] = {fg=colors.fg_main , bg=colors.bg_main , style='bold'}
	syntax['markdowncodedelimiter'] = {fg=colors.green_alt_other , bg=colors.bg_main , style='bold'}
	syntax['markdowncode'] = {fg=colors.fg_special_mild , bg=colors.bg_dim , style='none'}
	syntax['markdowncodeblock'] = {fg=colors.fg_special_mild , bg=colors.bg_dim , style='none'}
	syntax['markdownfootnotedefinition'] = {fg=colors.fg_main , bg=colors.bg_main , style='italic'}
	syntax['markdownlistmarker'] = {fg=colors.fg_alt , bg=colors.bg_main , style='bold'}
	syntax['markdownlinebreak'] = {fg=colors.cyan_refine_fg , bg=colors.cyan_refine_bg , style='underline'}
	syntax['markdownurl'] = {fg=colors.blue_faint , bg=colors.bg_main , style='none'}
	syntax['markdownfootnote'] = {fg=colors.cyan_alt_faint , bg=colors.bg_main , style='italic'}
	syntax['markdownblockquote'] = {fg=colors.magenta_faint , bg=colors.bg_main , style='bold'}
	syntax['markdownlinktext'] = {fg=colors.blue_faint , bg=colors.bg_main, style='italic'}

	-- nix
	syntax['nixattributedefinition'] = {fg=colors.cyan , bg=colors.bg_main , style='none'}
	syntax['nixattribute'] = {fg=colors.blue_alt_other , bg=colors.bg_main , style='none'}
	syntax['nixfunctioncall'] = {fg=colors.magenta , bg=colors.bg_main , style='none'}

	-- treesitter
	syntax['tsannotation'] = {fg=colors.blue_nuanced_bg , bg=colors.bg_main , style='none'}
	syntax['tsboolean'] = syntax['Boolean']
	syntax['tscharacter'] = syntax['Character']
	syntax['tscomment'] = syntax['Comment']
	syntax['tsconditional'] = syntax['Conditional']
	syntax['tsconstant'] = syntax['Constant']
	syntax['tsconstbuiltin'] = syntax['Constant']
	syntax['tsconstmacro'] = syntax['Constant']
	syntax['tserror'] = {fg=colors.fg_main , bg=colors.red_intense_bg , style='bold'}
	syntax['tsexception'] = syntax['Conditional']
	syntax['tsfield'] = syntax['Constant']
	syntax['tsfloat'] = syntax['Normal']
	syntax['tsfunction'] = syntax['Function']
	syntax['tsfuncbuiltin'] = syntax['Function']
	syntax['tsfuncmacro'] = syntax['Function']
	syntax['tsinclude'] = syntax['Include']
	syntax['tskeyword'] = syntax['Conditional']
	syntax['tslabel'] = syntax['Label']
	syntax['tsmethod'] = syntax['Function']
	syntax['tsnamespace'] = syntax['Include']
	syntax['tsnumber'] = syntax['Normal']
	syntax['tsoperator'] = syntax['Normal']
	syntax['tsparameterreference'] = syntax['Constant']
	syntax['tsproperty'] = syntax['Constant']
	syntax['tspunctdelimiter'] = syntax['Normal']
	syntax['tspunctbracket'] = syntax['Normal']
	syntax['tspunctspecial'] = syntax['Normal']
	syntax['tsrepeat'] = syntax['Conditional']
	syntax['tsstring'] = syntax['String']
	syntax['tsstringregex'] = {fg=colors.fg_escape_char_construct , bg=colors.bg_main , style='none'}
	syntax['tsstringescape'] = {fg=colors.fg_escape_char_backslash , bg=colors.bg_main , style='none'}
	syntax['tsstrong'] = {fg=colors.fg_main , bg=colors.bg_main , style='bold'}
	syntax['tsconstructor'] = syntax['Type']
	syntax['tskeywordfunction'] = syntax['Type']
	syntax['tsliteral'] = {fg=faint_syntax('blue_alt') , bg=colors.bg_main , style='bold'}
	syntax['tsparameter'] = syntax['Label']
	syntax['tsvariable'] = syntax['Label']
	syntax['tsvariablebuiltin'] = syntax['Conditional']
	syntax['tstag'] = syntax['Label']
	syntax['tstagdelimiter'] = syntax['Label']
	syntax['tstitle'] = {fg=colors.cyan_nuanced_fg , bg=colors.bg_main , style='none'}
	syntax['tstype'] = syntax['Type']
	syntax['tstypebuiltin'] = syntax['Type']
	syntax['tsemphasis'] = {fg=colors.fg_main , bg=colors.bg_main , style='italic'}

	-- telescope
	syntax['telescopematching'] = {fg=colors.fg_main , bg=colors.green_intense_bg , style='bold'}

	-- startify
	syntax['startifyheader'] = syntax['Title']
	syntax['startifyspecial'] = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'}
	syntax['startifysection'] = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'}
	syntax['startifypath'] = syntax['Normal']
	syntax['startifyfile'] = syntax['Normal']
	syntax['startifybracket'] = syntax['Normal']
	syntax['startifyslash'] = syntax['Normal']
	syntax['startifyfooter'] = {fg=colors.fg_special_mild , bg=colors.bg_main , style='none'}

	-- tree
	syntax['nvimtreefoldericon'] = {fg=colors.blue , bg=colors.bg_main , style='none'}

	syntax['buffercurrent'] = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='none'}
	syntax['buffercurrentmod'] = {fg=colors.yellow_active , bg=colors.bg_tab_active , style='none'}
	syntax['buffercurrentsign'] = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='bold'}
	syntax['buffercurrenttarget'] = {fg=colors.magenta_active , bg=colors.bg_tab_active , style='bold'}
	syntax['buffervisible'] = {fg=colors.fg_main , bg=colors.bg_tab_active , style='none'}
	syntax['buffervisiblemod'] = {fg=colors.green_active , bg=colors.bg_tab_active , style='none'}
	syntax['buffervisiblesign'] = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='bold'}
	syntax['buffervisibletarget'] = {fg=colors.magenta_active , bg=colors.bg_tab_active , style='bold'}
	syntax['bufferinactive'] = {fg=colors.fg_main , bg=colors.bg_tab_inactive , style='none'}
	syntax['bufferinactivemod'] = {fg=colors.green_active , bg=colors.bg_tab_inactive , style='none'}
	syntax['bufferinactivesign'] = {fg=colors.fg_tab_active , bg=colors.bg_tab_inactive , style='bold'}
	syntax['bufferinactivetarget'] = {fg=colors.magenta_active , bg=colors.bg_tab_inactive , style='bold'}

	-- rainbow parenthesis
	syntax['rainbowcol1'] = {fg=colors.green_alt_other , bg=colors.bg_main , style='none'}
	syntax['rainbowcol2'] = {fg=colors.magenta_alt_other , bg=colors.bg_main , style='none'}
	syntax['rainbowcol3'] = {fg=colors.cyan_alt_other , bg=colors.bg_main , style='none'}
	syntax['rainbowcol4'] = {fg=colors.yellow_alt_other , bg=colors.bg_main , style='none'}
	syntax['rainbowcol5'] = {fg=colors.blue_alt_other , bg=colors.bg_main , style='none'}
	syntax['rainbowcol6'] = {fg=colors.green_alt , bg=colors.bg_main , style='none'}
	syntax['rainbowcol7'] = {fg=colors.magenta_alt_other , bg=colors.bg_main , style='none'}


	for group, colors in pairs(syntax) do
		setup(group, colors)
	end
end

function M.set_terminal()
	vim.g.terminal_color_0  = "#555555"
	vim.g.terminal_color_8  = "#222222"
	vim.g.terminal_color_1  = colors.red_faint
	vim.g.terminal_color_9  = colors.red_intense
	vim.g.terminal_color_2  = colors.green_faint
	vim.g.terminal_color_10 = colors.green_intense
	vim.g.terminal_color_3  = colors.yellow_faint
	vim.g.terminal_color_11 = colors.yellow_intense
	vim.g.terminal_color_4  = colors.blue_faint
	vim.g.terminal_color_12 = colors.blue_intense
	vim.g.terminal_color_5  = colors.magenta_faint
	vim.g.terminal_color_13 = colors.magenta_intense
	vim.g.terminal_color_6  = colors.cyan_faint
	vim.g.terminal_color_14 = colors.cyan_intense
	vim.g.terminal_color_7  = "#ffffff"
	vim.g.terminal_color_15 = "#dddddd"
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

M.load_syntax()
M.set_terminal()

if vim.g.modus_moody_line == 1 then
	M.set_statusline()
end

return M
