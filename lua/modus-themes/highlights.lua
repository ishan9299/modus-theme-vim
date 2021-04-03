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

    local syntax = {
        -- core
        Normal = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        NonText = {fg=colors.fg_alt , bg=colors.bg_main , style='NONE'},
        NormalNC = {fg=colors.fg_inactive , bg=colors.bg_inactive , style='NONE'},
        Folded = {fg=colors.fg_special_mild , bg=colors.bg_special_mild , style='NONE'},
        Error = {fg=colors.fg_main , bg=colors.red_intense_bg , style='NONE'},
        ErrorMsg = {fg=colors.fg_main , bg=colors.red_intense_bg , style='NONE'},
        Comment = {fg=yellow_comments() , bg=colors.bg_main , style='NONE'},
        Conceal = {fg=colors.fg_special_warm , bg=colors.bg_dim , style='NONE'},
        Cursor = {fg=colors.bg_main , bg=colors.fg_main , style='NONE'},
        ColorColumn = {fg=colors.bg_main , bg=colors.bg_active , style='NONE'},
        CursorLine = {fg='NONE', bg=colors.bg_hl_line, style='NONE'},
        Define = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        Delimiter = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        Float = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        Special = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        SpecialComment = {fg=yellow_comments() , bg=colors.bg_main , style='NONE'},
        Title = {fg=colors.fg_special_cold , bg=colors.bg_main , style='bold'},
        Visual = {fg=colors.fg_main , bg=colors.magenta_intense_bg , style='NONE'},
        Whitespace = {fg=colors.fg_alt , bg=colors.bg_main , style='NONE'},
        TabLine = {fg=colors.fg_main , bg=colors.bg_tab_inactive , style='NONE'},
        TabLineSel = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='NONE'},
        TabLineFill = {fg=colors.bg_main , bg=colors.bg_tab_bar , style='NONE'},
        Search = {fg=colors.fg_main , bg=colors.green_intense_bg , style='NONE'},
        EndOfBuffer = {fg=colors.fg_inactive , bg=colors.bg_main , style='NONE'},
        Function = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='NONE'},
        Warning = {fg=faint_syntax('yellow_alt') , bg=colors.bg_main , style='NONE'},
        Boolean = {fg=faint_syntax('blue') , bg=colors.bg_main , style='bold'},
        Character = {fg=faint_syntax('blue_alt') , bg=colors.bg_main , style='NONE'},
        Conditional = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        Constant = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        Directory = {fg=faint_syntax('blue') , bg=colors.bg_main , style='NONE'},
        Exception = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        Identifier = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        Include = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='NONE'},
        Keyword = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        Label = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        PreProc = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='NONE'},
        Repeat = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        SpecialChar = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        Statement = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        StorageClass = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        String = {fg=green_strings() , bg=colors.bg_main , style='NONE'},
        Structure = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        Tag = {fg=faint_syntax('magenta_active') , bg=colors.bg_main , style='NONE'},
        Todo = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='bold'},
        Type = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        Typedef = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        Underlined = {fg=colors.bg_main , bg=colors.blue_nuanced_bg , style='underline'},
        Type = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        MatchParen = {fg=colors.fg_main , bg=colors.bg_paren_match , style='NONE'},
        Number = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        Operator = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        Pmenu = {fg=colors.fg_active , bg=colors.bg_active , style='NONE'},
        PmenuSel = {fg=colors.fg_dim , bg=colors.bg_dim , style='NONE'},
        PmenuSbar = {fg=colors.bg_main , bg=colors.bg_inactive , style='NONE'},
        PmenuThumb = {fg=colors.bg_main , bg=colors.fg_main , style='NONE'},
        StatusLine = {fg=colors.bg_main , bg=colors.blue_active , style='NONE'},
        StatusLineNC = {fg=colors.fg_inactive , bg=colors.bg_main , style='NONE'},
        LineNr = {fg=colors.fg_alt , bg=colors.bg_dim , style='NONE'},
        CursorLineNr = {fg=colors.fg_active , bg=colors.bg_active , style='bold'},
        SignColumn = {fg=colors.bg_main , bg=colors.bg_inactive , style='NONE'},
        VertSplit = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        DiffAdd = {fg=colors.fg_diff_added , bg=colors.bg_diff_added , style='NONE'},
        DiffChange = {fg=colors.fg_diff_changed , bg=colors.bg_diff_changed , style='NONE'},
        DiffDelete = {fg=colors.fg_diff_removed , bg=colors.bg_diff_removed , style='NONE'},
        DiffText = {fg=colors.fg_diff_changed , bg=colors.bg_diff_changed , style='NONE'},
        SpellBad = {fg=colors.fg_lang_error , bg=colors.bg_main , style='NONE'},
        SpellCap = {fg=colors.fg_lang_error , bg=colors.bg_main , style='NONE'},

        -- lua
        luaConstant = {fg=colors.blue_alt_other , bg=colors.bg_main , style='bold'},
        luaComment = {fg=yellow_comments() , bg=colors.bg_main , style='NONE'},
        luaStatement = {fg=faint_syntax('magenta_alt_other'), bg=colors.bg_main , style='NONE'},
        luafunctioncall = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='NONE'},
        luaemmyfluff = {fg=colors.fg_alt , bg=colors.bg_main , style='NONE'},
        luaTodo = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='bold'},
        luaVarName = {fg=faint_syntax('cyan'), bg=colors.bg_main , style='NONE'},
        luaFunc = {fg=faint_syntax('magenta'), bg=colors.bg_main , style='NONE'},
        luaTableConstructor = {fg=faint_syntax('magenta_alt'), bg=colors.bg_main , style='NONE'},

        -- python
        pythonoperator = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},

        -- vim
        vimcommand = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        vimLet = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        vimFuncVar = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        vimCommentTitle = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='NONE'},
        vimIsCommand = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        vimFuncSID = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        vimCommentString = {fg=yellow_comments() , bg=colors.bg_main , style='NONE'},
        vimMapModKey = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        vimMapLhs = {fg=colors.bg_main , bg=colors.bg_main , style='NONE'},
        vimNotation = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        vimBracket = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        vimMap = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        vimnotfunc = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        nvimMap = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        NvimPlainAssignment = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        NvimIdentifier = {fg=faint_syntax('cyan_alt') , bg=colors.bg_main , style='NONE'},
        vimVar = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},

        -- Lspconfig
        LspDiagnosticsSignError = {fg=colors.red_active , bg=colors.bg_active , style='bold'},
        LspDiagnosticsVirtualTextError = {fg=colors.red_active , bg=colors.bg_main , style='bold'},
        LspDiagnosticsUnderlineError = {fg=colors.red_active , bg=colors.bg_main , style='underline'},
        LspDiagnosticsSignWarning = {fg=colors.yellow_active , bg=colors.bg_active , style='bold'},
        LspDiagnosticsVirtualTextWarning = {fg=colors.yellow_active , bg=colors.bg_main , style='bold'},
        LspDiagnosticsUnderlineWarning = {fg=colors.yellow_active , bg=colors.bg_main , style='underline'},
        LspDiagnosticsSignHint = {fg=colors.green_active , bg=colors.bg_active , style='bold'},
        LspDiagnosticsSignInformation = {fg=colors.green_active , bg=colors.bg_active , style='bold'},
        LspDiagnosticsVirtualTextHint = {fg=colors.green_active , bg=colors.bg_active , style='bold'},
        LspDiagnosticsUnderlineInformation = {fg=colors.green_active , bg=colors.bg_main , style='underline'},

        -- Markdown
        markdownh1 = {fg=colors.fg_main , bg=colors.magenta_nuanced_bg , style='bold'},
        markdownh2 = {fg=colors.fg_special_warm , bg=colors.red_nuanced_bg , style='bold'},
        markdownh3 = {fg=colors.fg_special_cold , bg=colors.blue_nuanced_bg , style='bold'},
        markdownh4 = {fg=colors.fg_special_mild , bg=colors.cyan_nuanced_bg , style='bold'},
        markdownh5 = {fg=colors.fg_special_calm , bg=colors.bg_main , style='bold'},
        markdownh6 = {fg=colors.yellow_nuanced_fg , bg=colors.bg_main , style='bold'},
        markdownRule = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'},
        markdownItalic = {fg=colors.fg_special_cold , bg=colors.bg_main , style='italic'},
        markdownBold = {fg=colors.fg_main , bg=colors.bg_main , style='bold'},
        markdownBoldItalic = {fg=colors.fg_main , bg=colors.bg_main , style='bold'},
        markdownCodeDelimiter = {fg=colors.green_alt_other , bg=colors.bg_main , style='bold'},
        markdownCode = {fg=colors.fg_special_mild , bg=colors.bg_dim , style='NONE'},
        markdownCodeBlock = {fg=colors.fg_special_mild , bg=colors.bg_dim , style='NONE'},
        markdownFootnoteDefinition = {fg=colors.fg_main , bg=colors.bg_main , style='italic'},
        markdownListMarker = {fg=colors.fg_alt , bg=colors.bg_main , style='bold'},
        markdownLineBreak = {fg=colors.cyan_refine_fg , bg=colors.cyan_refine_bg , style='underline'},
        markdownUrl = {fg=colors.blue_faint , bg=colors.bg_main , style='NONE'},
        markdownFootnote = {fg=colors.cyan_alt_faint , bg=colors.bg_main , style='italic'},
        markdownBlockquote = {fg=colors.magenta_faint , bg=colors.bg_main , style='bold'},
        markdownLinkText = {fg=colors.blue_faint , bg=colors.bg_main, style='italic'},

        -- nix
        nixAttributeDefinition = {fg=colors.cyan , bg=colors.bg_main , style='NONE'},
        nixAttribute = {fg=colors.blue_alt_other , bg=colors.bg_main , style='NONE'},
        nixFunctionCall = {fg=colors.magenta , bg=colors.bg_main , style='NONE'},

        -- Treesitter
        TSAnnotation = {fg=colors.blue_nuanced_bg , bg=colors.bg_main , style='NONE'},
        TSBoolean = {fg=faint_syntax('blue') , bg=colors.bg_main , style='NONE'},
        TSCharacter = {fg=faint_syntax('blue_alt') , bg=colors.bg_main , style='NONE'},
        TSComment = {fg=yellow_comments() , bg=colors.bg_main , style='NONE'},
        TSConditional = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        TSConstant = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSConstBuiltin = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSConstMacro = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSError = {fg=colors.fg_main , bg=colors.red_intense_bg , style='bold'},
        TSException = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        TSField = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSFloat = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSFunction = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='NONE'},
        TSFuncBuiltin = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='NONE'},
        TSFuncMacro = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='NONE'},
        TSInclude = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='NONE'},
        TSKeyword = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        TSLabel = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        TSMethod = {fg=faint_syntax('magenta') , bg=colors.bg_main , style='NONE'},
        TSNamespace = {fg=faint_syntax('red_alt_other') , bg=colors.bg_main , style='NONE'},
        TSNumber = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSOperator = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSParameterReference = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSProperty = {fg=faint_syntax('blue_alt_other') , bg=colors.bg_main , style='NONE'},
        TSPunctDelimiter = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSPunctBracket = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSPunctSpecial = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        TSRepeat = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        TSString = {fg=green_strings() , bg=colors.bg_main , style='NONE'},
        TSStringRegex = {fg=colors.fg_escape_char_construct , bg=colors.bg_main , style='NONE'},
        TSStringEscape = {fg=colors.fg_escape_char_backslash , bg=colors.bg_main , style='NONE'},
        TSStrong = {fg=colors.fg_main , bg=colors.bg_main , style='bold'},
        TSConstructor = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        TSKeywordFunction = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        TSLiteral = {fg=faint_syntax('blue_alt') , bg=colors.bg_main , style='bold'},
        TSParameter = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        TSVariable = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        TSVariableBuiltin = {fg=faint_syntax('magenta_alt_other') , bg=colors.bg_main , style='NONE'},
        TSTag = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        TSTagDelimiter = {fg=faint_syntax('cyan') , bg=colors.bg_main , style='NONE'},
        TSTitle = {fg=colors.cyan_nuanced_fg , bg=colors.bg_main , style='NONE'},
        TSType = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        TSTypeBuiltin = {fg=faint_syntax('magenta_alt') , bg=colors.bg_main , style='NONE'},
        TSEmphasis = {fg=colors.fg_main , bg=colors.bg_main , style='italic'},

        -- Telescope
        TelescopeMatching = {fg=colors.fg_main , bg=colors.green_intense_bg , style='bold'},

        -- Startify
        StartifyHeader = {fg=colors.fg_special_cold , bg=colors.bg_main , style='bold'},
        StartifySpecial = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'},
        StartifySection = {fg=colors.fg_special_warm , bg=colors.bg_main , style='bold'},
        StartifyPath = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        StartifyFile = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        StartifyBracket = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        StartifySlash = {fg=colors.fg_main , bg=colors.bg_main , style='NONE'},
        StartifyFooter = {fg=colors.fg_special_mild , bg=colors.bg_main , style='NONE'},

        -- tree
        NvimTreeFolderIcon = {fg=colors.blue , bg=colors.bg_main , style='NONE'},

        BufferCurrent = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='NONE'},
        BufferCurrentMod = {fg=colors.yellow_active , bg=colors.bg_tab_active , style='NONE'},
        BufferCurrentSign = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='bold'},
        BufferCurrentTarget = {fg=colors.magenta_active , bg=colors.bg_tab_active , style='bold'},
        BufferVisible = {fg=colors.fg_main , bg=colors.bg_tab_active , style='NONE'},
        BufferVisibleMod = {fg=colors.green_active , bg=colors.bg_tab_active , style='NONE'},
        BufferVisibleSign = {fg=colors.fg_tab_active , bg=colors.bg_tab_active , style='bold'},
        BufferVisibleTarget = {fg=colors.magenta_active , bg=colors.bg_tab_active , style='bold'},
        BufferInactive = {fg=colors.fg_main , bg=colors.bg_tab_inactive , style='NONE'},
        BufferInactiveMod = {fg=colors.green_active , bg=colors.bg_tab_inactive , style='NONE'},
        BufferInactiveSign = {fg=colors.fg_tab_active , bg=colors.bg_tab_inactive , style='bold'},
        BufferInactiveTarget = {fg=colors.magenta_active , bg=colors.bg_tab_inactive , style='bold'},

        -- Rainbow Parenthesis
        rainbowcol1 = {fg=colors.green_alt_other , bg=colors.bg_main , style='NONE'},
        rainbowcol2 = {fg=colors.magenta_alt_other , bg=colors.bg_main , style='NONE'},
        rainbowcol3 = {fg=colors.cyan_alt_other , bg=colors.bg_main , style='NONE'},
        rainbowcol4 = {fg=colors.yellow_alt_other , bg=colors.bg_main , style='NONE'},
        rainbowcol5 = {fg=colors.blue_alt_other , bg=colors.bg_main , style='NONE'},
        rainbowcol6 = {fg=colors.green_alt , bg=colors.bg_main , style='NONE'},
        rainbowcol7 = {fg=colors.magenta_alt_other , bg=colors.bg_main , style='NONE'}
    }

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
