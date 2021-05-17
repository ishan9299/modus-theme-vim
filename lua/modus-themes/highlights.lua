local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local colors

local settings = {
	modus_faint_syntax = 0,
	modus_moody_enable = 0,
	modus_yellow_comments = 0,
	modus_green_strings = 0,
	modus_termtrans_enable = 0,
	modus_cursorline_intense = 0,
	modus_italic_strings = 0,
}

for key,val in pairs(settings) do
	if g[key] == nil then
		g[key] = val
	end
end

cmd('hi clear')

if o.bg == 'dark' then
	colors = require('modus-themes.modus_vivendi').setup()
else
	colors = require('modus-themes.modus_operandi').setup()
end

if fn.exists('syntax_on') then
	cmd('syntax reset')
end

-- this will apply the highlights
local highlighter = function(group, color)
	color.bg = color.bg or colors.none
	local g_background = color.bg[1] -- gui color
	local c_background = color.bg[2] -- cterm color
	local g_foreground = color.fg[1] -- gui color
	local c_foreground = color.fg[2] -- cterm color
	local style = color.style or 'none'
	cmd(string.format(
	'hi %s guifg=%s guibg=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s',
	group, g_foreground, g_background, style, c_foreground, c_background, style
	))
end

function M.core_highlights()
	local syntax = {}
	if vim.g.modus_termtrans_enable == 1 then
		syntax['Normal'] = {fg=colors.fg_main}
		syntax['Folded'] = {fg=colors.fg_special_mild}
		syntax['LineNr'] = {fg=colors.fg_alt}
		syntax['CursorLineNr'] = {fg=colors.fg_active, style='bold'}
		syntax['SignColumn'] = {fg=colors.bg_main}
	else
		syntax['Normal'] = {fg=colors.fg_main, bg=colors.bg_main}
		syntax['Folded'] = {fg=colors.fg_special_mild, bg=colors.bg_special_mild}
		syntax['LineNr'] = {fg=colors.fg_alt, bg=colors.bg_dim}
		syntax['CursorLineNr'] = {fg=colors.fg_active, bg=colors.bg_active, style='bold'}
		syntax['SignColumn'] = {fg=colors.bg_main, bg=colors.bg_inactive}
	end
	syntax['NonText'] = {fg=colors.fg_alt}
	syntax['NormalNC'] = {fg=colors.fg_inactive, bg=colors.bg_inactive}
	syntax['ErrorMsg'] = {fg=colors.fg_main, bg=colors.red_intense_bg}
	syntax['Conceal'] = {fg=colors.fg_special_warm, bg=colors.bg_dim}
	syntax['Cursor'] = {fg=colors.bg_main, bg=colors.fg_main}
	syntax['lCursor'] = syntax['Cursor']
	syntax['CursorIM'] = syntax['Cursor']
	syntax['ColorColumn'] = {fg=colors.fg_main, bg=colors.bg_active}
	if vim.g.modus_cursorline_intense == 0 then
		syntax['CursorLine'] = {fg=colors.none, bg=colors.bg_hl_line}
	else
		syntax['CursorLine'] = {fg=colors.none, bg=colors.bg_hl_line_intense}
	end
	syntax['FoldColumn'] = {fg=colors.fg_active, bg=colors.bg_active}
	syntax['IncSearch'] = syntax['Search']
	syntax['Substitute'] = syntax['Search']
	-- syntax['ModeMsg'] = {}
	-- syntax['MsgArea'] = {}
	-- syntax['MsgSeparator'] = {}
	-- syntax['MoreMsg'] = {}
	-- syntax['NormalFloat'] = {}
	-- syntax['Question'] = {}
	-- syntax['QuickFixLine'] = {}
	-- syntax['SpecialKey'] = {}
	syntax['Menu'] = syntax['Pmenu']
	syntax['Scrollbar'] = syntax['PmenuSbar']
	-- syntax['Tooltip'] = {}
	syntax['Directory'] = {fg=colors.blue}
	syntax['Title'] = {fg=colors.fg_special_cold, style='bold'}
	syntax['Visual'] = {fg=colors.fg_main, bg=colors.magenta_intense_bg}
	syntax['Whitespace'] = syntax['NonText']
	syntax['TabLine'] = {fg=colors.fg_main, bg=colors.bg_tab_inactive}
	syntax['TabLineSel'] = {fg=colors.fg_tab_accent, bg=colors.bg_tab_active}
	syntax['TabLineFill'] = {fg=colors.bg_main, bg=colors.bg_tab_bar}
	syntax['Search'] = {fg=colors.fg_main, bg=colors.green_intense_bg}
	syntax['EndOfBuffer'] = {fg=colors.fg_inactive}
	syntax['MatchParen'] = {fg=colors.fg_main, bg=colors.bg_paren_match}
	syntax['Pmenu'] = {fg=colors.fg_active, bg=colors.bg_active}
	syntax['PmenuSel'] = {fg=colors.fg_dim, bg=colors.bg_dim}
	syntax['PmenuSbar'] = {fg=colors.bg_main, bg=colors.bg_inactive}
	syntax['PmenuThumb'] = syntax['Cursor']
	syntax['StatusLine'] = {fg=colors.bg_main, bg=colors.blue_active}
	syntax['StatusLineNC'] = {fg=colors.fg_inactive}
	syntax['VertSplit'] = syntax['Normal']
	syntax['DiffAdd'] = {fg=colors.fg_diff_added, bg=colors.bg_diff_added}
	syntax['DiffChange'] = {fg=colors.fg_diff_changed, bg=colors.bg_diff_changed}
	syntax['DiffDelete'] = {fg=colors.fg_diff_removed, bg=colors.bg_diff_removed}
	syntax['DiffText'] = {fg=colors.fg_diff_changed, bg=colors.bg_diff_changed}
	syntax['SpellBad'] = {fg=colors.fg_lang_error}
	syntax['SpellCap'] = {fg=colors.fg_lang_error}
	-- syntax['SpellLocal'] = {}
	-- syntax['SpellRare'] = {}
	syntax['WarningMsg'] = {fg=colors.yellow_alt}

	-- syntax
	if g.modus_yellow_comments == 1 then
		syntax['Comment'] = {fg=colors.fg_comment_yellow, style='italic'}
	else
		syntax['Comment'] = {fg=colors.fg_alt, style='italic'}
	end
	if g.modus_green_strings == 1 then
		if g.modus_italic_strings == 1 then
			syntax['String'] = {fg=colors.green_alt, style='italic'}
		else
			syntax['String'] = {fg=colors.green_alt}
		end
	else
		if g.modus_italic_strings == 1 then
			syntax['String'] = {fg=colors.blue_alt, style='italic'}
		else
			syntax['String'] = {fg=colors.blue_alt}
		end
	end
	syntax['Number'] = {fg=colors.fg_main}
	syntax['Float'] = {fg=colors.fg_main}
	syntax['Operator'] = {fg=colors.fg_main}
	if g.modus_faint_syntax == 1 then
		syntax['Identifier'] = {fg=colors.cyan_faint}
		syntax['Function'] = {fg=colors.magenta_faint}
		syntax['Boolean'] = {fg=colors.blue_faint, style='bold'}
		syntax['Character'] = {fg=colors.blue_alt_faint}
		syntax['Conditional'] = {fg=colors.magenta_alt_other_faint}
		syntax['Constant'] = {fg=colors.blue_alt_other_faint}
		syntax['Include'] = {fg=colors.red_alt_other_faint}
		syntax['Label'] = {fg=colors.cyan_faint}
		syntax['Todo'] = {fg=colors.magenta_faint, style='bold'}
		syntax['Type'] = {fg=colors.cyan_alt_other_faint}
	else
		syntax['Identifier'] = {fg=colors.cyan}
		syntax['Function'] = {fg=colors.magenta}
		syntax['Boolean'] = {fg=colors.blue, style='bold'}
		syntax['Character'] = {fg=colors.blue_alt}
		syntax['Conditional'] = {fg=colors.magenta_alt_other}
		syntax['Constant'] = {fg=colors.blue_alt_other}
		syntax['Include'] = {fg=colors.red_alt_other}
		syntax['Label'] = {fg=colors.cyan}
		syntax['Todo'] = {fg=colors.magenta, style='bold'}
		syntax['Type'] = {fg=colors.cyan_alt_other}
	end

	syntax['PreCondit'] = syntax['Include']
	syntax['Statement'] = syntax['Conditional']
	syntax['Repeat'] = syntax['Conditional']
	syntax['Keyword'] = syntax['Conditional']
	syntax['Exception'] = syntax['Conditional']
	syntax['PreProc'] = syntax['Include']
	syntax['Define'] = syntax['Include']
	syntax['Macro'] = syntax['Include']
	syntax['StorageClass'] = syntax['Conditional']
	syntax['Structure'] = syntax['Conditional']
	syntax['Typedef'] = syntax['Type']
	-- syntax['Special'] = {}
	-- syntax['SpecialChar'] = {}
	syntax['Tag'] = {fg=colors.magenta_active}
	syntax['Delimiter'] = {fg=colors.fg_main}
	-- syntax['SpecialComment'] = {}
	-- syntax['Debug'] = {}
	syntax['Underlined'] = {fg=colors.fg_main, style='underline'}
	-- syntax['Ignore'] = {}
	-- syntax['Error'] = {}

	-- languages
	-- lua
	syntax['luaConstant'] = {fg=colors.blue_alt_other, style='bold'}
	syntax['luaComment'] = syntax['Comment']
	syntax['luaStatement'] = syntax['Statement']
	syntax['luafunctioncall'] = syntax['Function']
	syntax['luaemmyfluff'] = syntax['NonText']
	syntax['luaTodo'] = syntax['Todo']
	syntax['luaVarName'] = syntax['Label']
	syntax['luaFunc'] = syntax['Function']
	if g.modus_faint_syntax == 1 then
		syntax['luaTableConstructor'] = {fg=colors.magenta_alt_faint}
	else
		syntax['luaTableConstructor'] = {fg=colors.magenta_alt}
	end

	-- python
	syntax['pythonoperator'] = {fg=colors.fg_main}

	-- css
	syntax['cssVendor'] = syntax['Statement']

	-- vim
	syntax['vimcommand'] = syntax['Conditional']
	syntax['vimLet'] = syntax['Conditional']
	syntax['vimFuncVar'] = syntax['Constant']
	syntax['vimCommentTitle'] = syntax['Include']
	syntax['vimIsCommand'] = {fg=colors.fg_main}
	syntax['vimFuncSID'] = {fg=colors.fg_main}
	syntax['vimCommentString'] = syntax['Comment']
	syntax['vimMapModKey'] = {fg=colors.fg_main}
	syntax['vimMapLhs'] = {fg=colors.fg_main}
	syntax['vimNotation'] = {fg=colors.fg_main}
	syntax['vimBracket'] = {fg=colors.fg_main}
	syntax['vimmap'] = syntax['Conditional']
	syntax['vimnotfunc'] = syntax['Conditional']
	syntax['nvimmap'] = syntax['Conditional']
	syntax['nvimplainassignment'] = syntax['Type']
	syntax['nvimidentifier'] = syntax['Identifier']
	syntax['vimvar'] = syntax['Label']

	-- TODO some options to highlight headers
	-- markdown
	syntax['markdownh1'] = {fg=colors.fg_main, bg=colors.magenta_nuanced_bg, style='bold'}
	syntax['markdownh2'] = {fg=colors.fg_special_warm, bg=colors.red_nuanced_bg, style='bold'}
	syntax['markdownh3'] = {fg=colors.fg_special_cold, bg=colors.blue_nuanced_bg, style='bold'}
	syntax['markdownh4'] = {fg=colors.fg_special_mild, bg=colors.cyan_nuanced_bg, style='bold'}
	syntax['markdownh5'] = {fg=colors.fg_special_calm, style='bold'}
	syntax['markdownh6'] = {fg=colors.yellow_nuanced_fg, style='bold'}
	syntax['markdownrule'] = {fg=colors.fg_special_warm, style='bold'}
	syntax['markdownitalic'] = {fg=colors.fg_special_cold, style='italic'}
	syntax['markdownbold'] = {fg=colors.fg_main, style='bold'}
	syntax['markdownbolditalic'] = {fg=colors.fg_main, style='bold'}
	syntax['markdowncodedelimiter'] = {fg=colors.green_alt_other, style='bold'}
	syntax['markdowncode'] = {fg=colors.fg_special_mild, bg=colors.bg_dim}
	syntax['markdowncodeblock'] = {fg=colors.fg_special_mild, bg=colors.bg_dim}
	syntax['markdownfootnotedefinition'] = {fg=colors.fg_main, style='italic'}
	syntax['markdownlistmarker'] = {fg=colors.fg_alt, style='bold'}
	syntax['markdownlinebreak'] = {fg=colors.cyan_refine_fg, bg=colors.cyan_refine_bg, style='underline'}
	syntax['markdownurl'] = {fg=colors.blue_faint}
	syntax['markdownfootnote'] = {fg=colors.cyan_alt_faint, style='italic'}
	syntax['markdownblockquote'] = {fg=colors.magenta_faint, style='bold'}
	syntax['markdownlinktext'] = {fg=colors.blue_faint, style='italic'}

	-- nix
	syntax['nixattributedefinition'] = {fg=colors.cyan}
	syntax['nixattribute'] = {fg=colors.blue_alt_other}
	syntax['nixfunctioncall'] = {fg=colors.magenta}

	-- plugins
	-- lsp
	syntax['lspdiagnosticssignerror'] = {fg=colors.red_active, bg=colors.bg_active, style='bold'}
	syntax['lspdiagnosticsvirtualtexterror'] = {fg=colors.red_active, style='bold'}
	syntax['lspdiagnosticsunderlineerror'] = {fg=colors.red_active, style='underline'}
	syntax['lspdiagnosticssignwarning'] = {fg=colors.yellow_active, bg=colors.bg_active, style='bold'}
	syntax['lspdiagnosticsvirtualtextwarning'] = {fg=colors.yellow_active, style='bold'}
	syntax['lspdiagnosticsunderlinewarning'] = {fg=colors.yellow_active, style='underline'}
	syntax['lspdiagnosticssignhint'] = {fg=colors.green_active, bg=colors.bg_active, style='bold'}
	syntax['lspdiagnosticssigninformation'] = {fg=colors.green_active, bg=colors.bg_active, style='bold'}
	syntax['lspdiagnosticsvirtualtexthint'] = {fg=colors.green_active, bg=colors.bg_active, style='bold'}
	syntax['lspdiagnosticsunderlineinformation'] = {fg=colors.green_active, style='underline'}

	-- treesitter
	syntax['tsannotation'] = {fg=colors.blue_nuanced_bg}
	syntax['tsboolean'] = syntax['Boolean']
	syntax['tscharacter'] = syntax['Character']
	syntax['tscomment'] = syntax['Comment']
	syntax['tsconditional'] = syntax['Conditional']
	syntax['tsconstant'] = syntax['Constant']
	syntax['tsconstbuiltin'] = syntax['Constant']
	syntax['tsconstmacro'] = syntax['Constant']
	syntax['tserror'] = {fg=colors.fg_main, bg=colors.red_intense_bg, style='bold'}
	syntax['tsexception'] = syntax['Conditional']
	syntax['tsfield'] = {fg=colors.fg_main}
	syntax['tsfloat'] = {fg=colors.fg_main}
	syntax['tsfunction'] = syntax['Function']
	syntax['tsfuncbuiltin'] = syntax['Function']
	syntax['tsfuncmacro'] = syntax['Function']
	syntax['tsinclude'] = syntax['Include']
	syntax['tskeyword'] = syntax['Conditional']
	syntax['tslabel'] = syntax['Label']
	syntax['tsmethod'] = syntax['Function']
	syntax['tsnamespace'] = syntax['Include']
	syntax['tsnumber'] = {fg=colors.fg_main}
	syntax['tsoperator'] = {fg=colors.fg_main}
	syntax['tsparameterreference'] = syntax['Constant']
	syntax['tsproperty'] = syntax['tsfield']
	syntax['tspunctdelimiter'] = {fg=colors.fg_main}
	syntax['tspunctbracket'] = {fg=colors.fg_main}
	syntax['tspunctspecial'] = {fg=colors.fg_main}
	syntax['tsrepeat'] = syntax['Conditional']
	syntax['tsstring'] = syntax['String']
	syntax['tsstringregex'] = {fg=colors.fg_escape_char_construct}
	syntax['tsstringescape'] = {fg=colors.fg_escape_char_backslash}
	syntax['tsstrong'] = {fg=colors.fg_main, style='bold'}
	syntax['tsconstructor'] = syntax['Type']
	syntax['tskeywordfunction'] = syntax['Type']
	if g.modus_faint_syntax == 1 then
		syntax['tsliteral'] = {fg=colors.blue_alt_faint, style='bold'}
	else
		syntax['tsliteral'] = {fg=colors.blue_alt, style='bold'}
	end
	syntax['tsparameter'] = syntax['Label']
	syntax['tsvariable'] = syntax['Label']
	syntax['tsvariablebuiltin'] = syntax['Conditional']
	syntax['tstag'] = syntax['Label']
	syntax['tstagdelimiter'] = syntax['Label']
	syntax['tstitle'] = {fg=colors.cyan_nuanced_fg}
	syntax['tstype'] = syntax['Type']
	syntax['tstypebuiltin'] = syntax['Type']
	syntax['tsemphasis'] = {fg=colors.fg_main, style='italic'}
	syntax['telescopematching'] = {fg=colors.fg_main, bg=colors.green_intense_bg, style='bold'}

	-- startify
	syntax['startifyheader'] = syntax['Title']
	syntax['startifyspecial'] = {fg=colors.fg_special_warm, style='bold'}
	syntax['startifysection'] = {fg=colors.fg_special_warm, style='bold'}
	syntax['startifypath'] = {fg=colors.fg_main}
	syntax['startifyfile'] = {fg=colors.fg_main}
	syntax['startifybracket'] = {fg=colors.fg_main}
	syntax['startifyslash'] = {fg=colors.fg_main}
	syntax['startifyfooter'] = {fg=colors.fg_special_mild}

	syntax['nvimtreefoldericon'] = {fg=colors.blue}

	-- bufferline
	syntax['buffercurrent'] = {fg=colors.fg_tab_accent, bg=colors.bg_tab_active}
	syntax['buffercurrentmod'] = {fg=colors.yellow_active, bg=colors.bg_tab_active}
	syntax['buffercurrentsign'] = {fg=colors.fg_tab_accent, bg=colors.bg_tab_active, style='bold'}
	syntax['buffercurrenttarget'] = {fg=colors.magenta_active, bg=colors.bg_tab_active, style='bold'}
	syntax['buffervisible'] = {fg=colors.fg_main, bg=colors.bg_tab_active}
	syntax['buffervisiblemod'] = {fg=colors.green_active, bg=colors.bg_tab_active}
	syntax['buffervisiblesign'] = {fg=colors.fg_tab_accent, bg=colors.bg_tab_active, style='bold'}
	syntax['buffervisibletarget'] = {fg=colors.magenta_active, bg=colors.bg_tab_active, style='bold'}
	syntax['bufferinactive'] = {fg=colors.fg_main, bg=colors.bg_tab_inactive}
	syntax['bufferinactivemod'] = {fg=colors.green_active, bg=colors.bg_tab_inactive}
	syntax['bufferinactivesign'] = {fg=colors.fg_tab_accent, bg=colors.bg_tab_inactive, style='bold'}
	syntax['bufferinactivetarget'] = {fg=colors.magenta_active, bg=colors.bg_tab_inactive, style='bold'}

	-- rainbow parens
	syntax['rainbowcol1'] = {fg=colors.green_alt_other}
	syntax['rainbowcol2'] = {fg=colors.magenta_alt_other}
	syntax['rainbowcol3'] = {fg=colors.cyan_alt_other}
	syntax['rainbowcol4'] = {fg=colors.yellow_alt_other}
	syntax['rainbowcol5'] = {fg=colors.blue_alt_other}
	syntax['rainbowcol6'] = {fg=colors.green_alt}
	syntax['rainbowcol7'] = {fg=colors.magenta_alt_other}

	-- gitsigns
	syntax['GitSignsAdd'] = syntax['DiffAdd']
	syntax['GitSignsChange'] = syntax['DiffChange']
	syntax['GitSignsDelete'] = syntax['DiffDelete']

	for group, highlights in pairs(syntax) do
		highlighter(group, highlights)
	end
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
			highlight = {colors.bg_active[1], colors.bg_active[1]}
		}
	}

	gls.left[2] = {
		ViMode = {
			provider = function()
				local mode_color = {
					n      = colors.magenta_active[1],
					i      = colors.green_active[1],
					v      = colors.cyan_active[1],
					[''] = colors.cyan_active[1],
					V      = colors.cyan_active[1],
					c      = colors.red_active[1],
					R      = colors.red_active[1],
					Rv     = colors.red_active[1],
					t      = colors.blue_active[1],
					['!']  = colors.blue_active[1],
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
			separator_highlight = {colors.bg_active[1],function()
				if not buffer_not_empty() then
					return colors.bg_main[1]
				end
				return colors.bg_main[1]
			end},
			highlight = {colors.fg_active[1],colors.bg_active[1],'bold'},
		},
	}

	gls.left[3] ={
		FileIcon = {
			provider = 'FileIcon',
			condition = buffer_not_empty,
			highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg_main[1]},
		},
	}

	gls.left[4] = {
		FileName = {
			provider = {'FileName','FileSize'},
			condition = buffer_not_empty,
			separator = '',
			separator_highlight = {colors.bg_active[1],colors.bg_main[1]},
			highlight = {colors.fg_active[1],colors.bg_main[1],'bold'}
		}
	}

	gls.left[5] = {
		GitIcon = {
			provider = function() return '  ' end,
			condition = buffer_not_empty,
			highlight = {colors.fg_active[1],colors.bg_active[1]},
		}
	}
	gls.left[6] = {
		GitBranch = {
			provider = 'GitBranch',
			condition = buffer_not_empty,
			highlight = {colors.fg_active[1],colors.bg_active[1]},
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
			highlight = {colors.green_active[1],colors.bg_active[1]},
		}
	}
	gls.left[8] = {
		DiffModified = {
			provider = 'DiffModified',
			condition = checkwidth,
			icon = ' ',
			highlight = {colors.yellow_active[1],colors.bg_active[1]},
		}
	}
	gls.left[9] = {
		DiffRemove = {
			provider = 'DiffRemove',
			condition = checkwidth,
			icon = ' ',
			highlight = {colors.red_active[1],colors.bg_active[1]},
		}
	}
	gls.left[10] = {
		LeftEnd = {
			provider = function() return '' end,
			condition = buffer_not_empty,
			highlight = {colors.bg_active[1],colors.bg_main[1]}
		}
	}
	gls.left[11] = {
		DiagnosticError = {
			provider = 'DiagnosticError',
			icon = '  ',
			highlight = {colors.red_active[1],colors.bg_main[1]}
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
			highlight = {colors.yellow_active[1],colors.bg_main[1]},
		}
	}

	gls.right[1]= {
		FileFormat = {
			provider = 'FileFormat',
			separator = '',
			separator_highlight = {colors.bg_main[1],colors.bg_active[1]},
			highlight = {colors.fg_active[1],colors.bg_active[1]},
		}
	}
	gls.right[2] = {
		LineInfo = {
			provider = 'LineColumn',
			separator = ' | ',
			separator_highlight = {colors.fg_active[1],colors.bg_active[1]},
			highlight = {colors.fg_active[1],colors.bg_active[1]},
		},
	}
	gls.right[3] = {
		PerCent = {
			provider = 'LinePercent',
			separator = '',
			separator_highlight = {colors.bg_main[1],colors.bg_active[1]},
			highlight = {colors.fg_active[1],colors.bg_main[1]},
		}
	}
	gls.right[4] = {
		ScrollBar = {
			provider = 'ScrollBar',
			highlight = {colors.fg_active[1],colors.bg_main[1]},
		}
	}

	gls.short_line_left[1] = {
		BufferType = {
			provider = { 'FileName' },
			separator = '',
			separator_highlight = {colors.bg_active[1],colors.bg_main[1]},
			highlight = {colors.fg_active[1],colors.bg_active[1]}
		}
	}

	gls.short_line_right[1] = {
		BufferIcon = {
			provider= 'BufferIcon',
			separator = '',
			separator_highlight = {colors.bg_active[1],colors.bg_main[1]},
			highlight = {colors.fg_active[1],colors.bg_active[1]}
		}
	}
end

-- TODO
-- now try to use libuv to make it faster.
M.core_highlights()
M.set_terminal()

if g.modus_moody_enable == 1 and o.termguicolors == true then
	M.set_statusline()
end

return M
