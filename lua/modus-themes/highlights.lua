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

	-- this will apply the highlights
	local highlight = function(group, foreground, background, style)
		cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group, foreground, background, style))
	end

	-- link function will link 2 groups
	local link = function(target, source)
		cmd(string.format('hi! link %s %s', target, source))
	end

	highlight('Normal', colors.fg_main, colors.bg_main, 'none')
  highlight('NonText' , colors.fg_alt , colors.bg_main , 'none')
  highlight('NormalNC' , colors.fg_inactive , colors.bg_inactive , 'none')
  highlight('Folded' , colors.fg_special_mild , colors.bg_special_mild , 'none')
  highlight('Error' , colors.fg_main , colors.red_intense_bg , 'none')
  link('ErrorMsg' , 'Error')
  highlight('Comment' , yellow_comments() , colors.bg_main , 'italic')
  highlight('Conceal' , colors.fg_special_warm , colors.bg_dim , 'none')
  highlight('Cursor' , colors.bg_main , colors.fg_main , 'none')
  link('lCursor' , 'Cursor')
  link('CursorIM' , 'Cursor')
  highlight('ColorColumn' , colors.bg_main , colors.bg_active , 'none')
  highlight('CursorLine' , 'none', colors.bg_hl_line, 'none')
  link('Define' , 'Normal')
  link('Delimiter' , 'Normal')
  link('Float' , 'Normal')
  link('Special' , 'Normal')
  link('SpecialComment' , 'Comment')
  highlight('Title' , colors.fg_special_cold , colors.bg_main , 'bold')
  highlight('Visual' , colors.fg_main , colors.magenta_intense_bg , 'none')
  link('Whitespace' , 'NonText')
  highlight('TabLine' , colors.fg_main , colors.bg_tab_inactive , 'none')
  highlight('TabLineSel' , colors.fg_tab_active , colors.bg_tab_active , 'none')
  highlight('TabLineFill' , colors.bg_main , colors.bg_tab_bar , 'none')
  highlight('Search' , colors.fg_main , colors.green_intense_bg , 'none')
  highlight('EndOfBuffer' , colors.fg_inactive , colors.bg_main , 'none')
  highlight('Function' , faint_syntax('magenta') , colors.bg_main , 'none')
  highlight('Warning' , faint_syntax('yellow_alt') , colors.bg_main , 'none')
  highlight('Boolean' , faint_syntax('blue') , colors.bg_main , 'bold')
  highlight('Character' , faint_syntax('blue_alt') , colors.bg_main , 'none')
  highlight('Conditional' , faint_syntax('magenta_alt_other') , colors.bg_main , 'none')
  highlight('Constant' , faint_syntax('blue_alt_other') , colors.bg_main , 'none')
  highlight('Directory' , faint_syntax('blue') , colors.bg_main , 'none')
  link('Exception' , 'Conditional')
  link('Identifier' , 'Constant')
  highlight('Include' , faint_syntax('red_alt_other') , colors.bg_main , 'none')
  link('Keyword' , 'Conditional')
  highlight('Label' , faint_syntax('cyan') , colors.bg_main , 'none')
  link('PreProc' , 'Include')
  link('Repeat' , 'Conditional')
  link('SpecialChar' , 'Constant')
  link('Statement' , 'Conditional')
  link('StorageClass' , 'Conditional')
  highlight('String' , green_strings() , colors.bg_main , 'none')
  link('Structure' , 'Conditional')
  highlight('Tag' , faint_syntax('magenta_active') , colors.bg_main , 'none')
  highlight('Todo' , faint_syntax('magenta') , colors.bg_main , 'bold')
  highlight('Type' , faint_syntax('magenta_alt') , colors.bg_main , 'none')
  link('Typedef' , 'Type')
  highlight('Underlined' , colors.fg_main , colors.bg_main , 'underline')
  link('Type' , 'Type')
  highlight('MatchParen' , colors.fg_main , colors.bg_paren_match , 'none')
  link('Number' , 'Normal')
  link('Operator' , 'Normal')
  highlight('Pmenu' , colors.fg_active , colors.bg_active , 'none')
  highlight('PmenuSel' , colors.fg_dim , colors.bg_dim , 'none')
  highlight('PmenuSbar' , colors.bg_main , colors.bg_inactive , 'none')
  link('PmenuThumb' , 'Cursor')
  highlight('StatusLine' , colors.bg_main , colors.blue_active , 'none')
  highlight('StatusLineNC' , colors.fg_inactive , colors.bg_main , 'none')
  highlight('LineNr' , colors.fg_alt , colors.bg_dim , 'none')
  highlight('CursorLineNr' , colors.fg_active , colors.bg_active , 'bold')
  highlight('SignColumn' , colors.bg_main , colors.bg_inactive , 'none')
  link('VertSplit' , 'Normal')
  highlight('DiffAdd' , colors.fg_diff_added , colors.bg_diff_added , 'none')
  highlight('DiffChange' , colors.fg_diff_changed , colors.bg_diff_changed , 'none')
  highlight('DiffDelete' , colors.fg_diff_removed , colors.bg_diff_removed , 'none')
  highlight('DiffText' , colors.fg_diff_changed , colors.bg_diff_changed , 'none')
  highlight('SpellBad' , colors.fg_lang_error , colors.bg_main , 'none')
  highlight('SpellCap' , colors.fg_lang_error , colors.bg_main , 'none')
  highlight('luaConstant' , colors.blue_alt_other , colors.bg_main , 'bold')
  link('luaComment' , 'Comment')
  highlight('luaStatement' , faint_syntax('magenta_alt_other'), colors.bg_main , 'none')
  highlight('luafunctioncall' , faint_syntax('magenta'), colors.bg_main , 'none')
  link('luaemmyfluff' , 'NonText')
  highlight('luaTodo' , faint_syntax('magenta'), colors.bg_main , 'bold')
  highlight('luaVarName' , faint_syntax('cyan'), colors.bg_main , 'none')
  highlight('luaFunc' , faint_syntax('magenta'), colors.bg_main , 'none')
  highlight('luaTableConstructor' , faint_syntax('magenta_alt'), colors.bg_main , 'none')
  link('pythonoperator' , 'Normal')
  link('vimcommand' , 'Conditional')
  link('vimLet' , 'Conditional')
  link('vimFuncVar' , 'Constant')
  link('vimCommentTitle' , 'Include')
  link('vimIsCommand' , 'Normal')
  link('vimFuncSID' , 'Normal')
  link('vimCommentString' , 'Comment')
  link('vimMapModKey' , 'Normal')
  highlight('vimMapLhs' , colors.bg_main , colors.bg_main , 'none')
  link('vimNotation' , 'Normal')
  link('vimBracket' , 'Normal')
  link('vimmap' , 'Conditional')
  link('vimnotfunc' , 'Conditional')
  link('nvimmap' , 'Conditional')
  link('nvimplainassignment' , 'Type')
  highlight('nvimidentifier' , faint_syntax('cyan_alt') , colors.bg_main , 'none')
  link('vimvar' , 'Label')
  highlight('lspdiagnosticssignerror' , colors.red_active , colors.bg_active , 'bold')
  highlight('lspdiagnosticsvirtualtexterror' , colors.red_active , colors.bg_main , 'bold')
  highlight('lspdiagnosticsunderlineerror' , colors.red_active , colors.bg_main , 'underline')
  highlight('lspdiagnosticssignwarning' , colors.yellow_active , colors.bg_active , 'bold')
  highlight('lspdiagnosticsvirtualtextwarning' , colors.yellow_active , colors.bg_main , 'bold')
  highlight('lspdiagnosticsunderlinewarning' , colors.yellow_active , colors.bg_main , 'underline')
  highlight('lspdiagnosticssignhint' , colors.green_active , colors.bg_active , 'bold')
  highlight('lspdiagnosticssigninformation' , colors.green_active , colors.bg_active , 'bold')
  highlight('lspdiagnosticsvirtualtexthint' , colors.green_active , colors.bg_active , 'bold')
  highlight('lspdiagnosticsunderlineinformation' , colors.green_active , colors.bg_main , 'underline')
  highlight('markdownh1' , colors.fg_main , colors.magenta_nuanced_bg , 'bold')
  highlight('markdownh2' , colors.fg_special_warm , colors.red_nuanced_bg , 'bold')
  highlight('markdownh3' , colors.fg_special_cold , colors.blue_nuanced_bg , 'bold')
  highlight('markdownh4' , colors.fg_special_mild , colors.cyan_nuanced_bg , 'bold')
  highlight('markdownh5' , colors.fg_special_calm , colors.bg_main , 'bold')
  highlight('markdownh6' , colors.yellow_nuanced_fg , colors.bg_main , 'bold')
  highlight('markdownrule' , colors.fg_special_warm , colors.bg_main , 'bold')
  highlight('markdownitalic' , colors.fg_special_cold , colors.bg_main , 'italic')
  highlight('markdownbold' , colors.fg_main , colors.bg_main , 'bold')
  highlight('markdownbolditalic' , colors.fg_main , colors.bg_main , 'bold')
  highlight('markdowncodedelimiter' , colors.green_alt_other , colors.bg_main , 'bold')
  highlight('markdowncode' , colors.fg_special_mild , colors.bg_dim , 'none')
  highlight('markdowncodeblock' , colors.fg_special_mild , colors.bg_dim , 'none')
  highlight('markdownfootnotedefinition' , colors.fg_main , colors.bg_main , 'italic')
  highlight('markdownlistmarker' , colors.fg_alt , colors.bg_main , 'bold')
  highlight('markdownlinebreak' , colors.cyan_refine_fg , colors.cyan_refine_bg , 'underline')
  highlight('markdownurl' , colors.blue_faint , colors.bg_main , 'none')
  highlight('markdownfootnote' , colors.cyan_alt_faint , colors.bg_main , 'italic')
  highlight('markdownblockquote' , colors.magenta_faint , colors.bg_main , 'bold')
  highlight('markdownlinktext' , colors.blue_faint , colors.bg_main, 'italic')
  highlight('nixattributedefinition' , colors.cyan , colors.bg_main , 'none')
  highlight('nixattribute' , colors.blue_alt_other , colors.bg_main , 'none')
  highlight('nixfunctioncall' , colors.magenta , colors.bg_main , 'none')
  highlight('tsannotation' , colors.blue_nuanced_bg , colors.bg_main , 'none')
  link('tsboolean' , 'Boolean')
  link('tscharacter' , 'Character')
  link('tscomment' , 'Comment')
  link('tsconditional' , 'Conditional')
  link('tsconstant' , 'Constant')
  link('tsconstbuiltin' , 'Constant')
  link('tsconstmacro' , 'Constant')
  highlight('tserror' , colors.fg_main , colors.red_intense_bg , 'bold')
  link('tsexception' , 'Conditional')
  link('tsfield' , 'Constant')
  link('tsfloat' , 'Normal')
  link('tsfunction' , 'Function')
  link('tsfuncbuiltin' , 'Function')
  link('tsfuncmacro' , 'Function')
  link('tsinclude' , 'Include')
  link('tskeyword' , 'Conditional')
  link('tslabel' , 'Label')
  link('tsmethod' , 'Function')
  link('tsnamespace' , 'Include')
  link('tsnumber' , 'Normal')
  link('tsoperator' , 'Normal')
  link('tsparameterreference' , 'Constant')
  link('tsproperty' , 'Constant')
  link('tspunctdelimiter' , 'Normal')
  link('tspunctbracket' , 'Normal')
  link('tspunctspecial' , 'Normal')
  link('tsrepeat' , 'Conditional')
  link('tsstring' , 'String')
  highlight('tsstringregex' , colors.fg_escape_char_construct , colors.bg_main , 'none')
  highlight('tsstringescape' , colors.fg_escape_char_backslash , colors.bg_main , 'none')
  highlight('tsstrong' , colors.fg_main , colors.bg_main , 'bold')
  link('tsconstructor' , 'Type')
  link('tskeywordfunction' , 'Type')
  highlight('tsliteral' , faint_syntax('blue_alt') , colors.bg_main , 'bold')
  link('tsparameter' , 'Label')
  link('tsvariable' , 'Label')
  link('tsvariablebuiltin' , 'Conditional')
  link('tstag' , 'Label')
  link('tstagdelimiter' , 'Label')
  highlight('tstitle' , colors.cyan_nuanced_fg , colors.bg_main , 'none')
  link('tstype' , 'Type')
  link('tstypebuiltin' , 'Type')
  highlight('tsemphasis' , colors.fg_main , colors.bg_main , 'italic')
  highlight('telescopematching' , colors.fg_main , colors.green_intense_bg , 'bold')
  link('startifyheader' , 'Title')
  highlight('startifyspecial' , colors.fg_special_warm , colors.bg_main , 'bold')
  highlight('startifysection' , colors.fg_special_warm , colors.bg_main , 'bold')
  link('startifypath' , 'Normal')
  link('startifyfile' , 'Normal')
  link('startifybracket' , 'Normal')
  link('startifyslash' , 'Normal')
  highlight('startifyfooter' , colors.fg_special_mild , colors.bg_main , 'none')
  highlight('nvimtreefoldericon' , colors.blue , colors.bg_main , 'none')
  highlight('buffercurrent' , colors.fg_tab_active , colors.bg_tab_active , 'none')
  highlight('buffercurrentmod' , colors.yellow_active , colors.bg_tab_active , 'none')
  highlight('buffercurrentsign' , colors.fg_tab_active , colors.bg_tab_active , 'bold')
  highlight('buffercurrenttarget' , colors.magenta_active , colors.bg_tab_active , 'bold')
  highlight('buffervisible' , colors.fg_main , colors.bg_tab_active , 'none')
  highlight('buffervisiblemod' , colors.green_active , colors.bg_tab_active , 'none')
  highlight('buffervisiblesign' , colors.fg_tab_active , colors.bg_tab_active , 'bold')
  highlight('buffervisibletarget' , colors.magenta_active , colors.bg_tab_active , 'bold')
  highlight('bufferinactive' , colors.fg_main , colors.bg_tab_inactive , 'none')
  highlight('bufferinactivemod' , colors.green_active , colors.bg_tab_inactive , 'none')
  highlight('bufferinactivesign' , colors.fg_tab_active , colors.bg_tab_inactive , 'bold')
  highlight('bufferinactivetarget' , colors.magenta_active , colors.bg_tab_inactive , 'bold')
  highlight('rainbowcol1', colors.green_alt_other , colors.bg_main , 'none')
  highlight('rainbowcol2', colors.magenta_alt_other , colors.bg_main , 'none')
  highlight('rainbowcol3', colors.cyan_alt_other , colors.bg_main , 'none')
  highlight('rainbowcol4', colors.yellow_alt_other , colors.bg_main , 'none')
  highlight('rainbowcol5', colors.blue_alt_other , colors.bg_main , 'none')
  highlight('rainbowcol6', colors.green_alt , colors.bg_main , 'none')
  highlight('rainbowcol7', colors.magenta_alt_other , colors.bg_main , 'none')
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
