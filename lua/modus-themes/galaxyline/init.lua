local M = {}

function M.set_statusline(colors)
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

return M
