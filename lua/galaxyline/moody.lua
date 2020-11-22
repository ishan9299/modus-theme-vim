local vim = vim
vim.cmd('packadd! galaxyline')
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}
local background = vim.o.bg
local colors

if background == 'light' then
  local palette = {
    bg_main         = '#ffffff',
    bg_active       = '#d7d7d7',
    fg_active       = '#0a0a0a',

    red_active      = '#930000',
    green_active    = '#005300',
    yellow_active   = '#703700',
    blue_active     = '#0033c0',
    magenta_active  = '#6320a0',
    cyan_active     = '#004882',
  }
  colors = palette
elseif background == 'dark' then
  local palette = {
    bg_main   = '#000000',
    bg_active = '#2f2f2f',
    fg_active = '#f5f5f5',

    red_active     = '#ffa49e',
    green_active   = '#70e030',
    yellow_active  = '#efdf00',
    blue_active    = '#00ccff',
    magenta_active = '#d0acff',
    cyan_active    = '#00ddc0',
  }
  colors = palette
end


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
        R      = colors.purple_active,
        Rv     = colors.purple_active,
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
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return alias[vim.fn.mode()]
    end,
    separator = '',
    separator_highlight = {colors.bg_active,function()
      if not buffer_not_empty() then
        return colors.magenta_active
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
    -- separator = '',
    -- separator_highlight = {colors.bg,colors.bg_main},
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
    provider = 'FileTypeName',
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

