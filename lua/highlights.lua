local cmd = vim.cmd
local vim = vim
local g = vim.g
local fn = vim.fn

local settings = {
  faint_syntax = 0,
  moody_enable = 0,
}

for k,val in pairs(settings) do
  local key = "modus_" .. k
  if g[key] == nil then
    g[key] = val
  end
end

local faint = g.modus_faint_syntax
local statusline = g.modus_moody_enable

local function init(colors, Group, groups, styles, palette)
    Group.new('Normal'         , colors.fg_main         , colors.bg_main)
    Group.new('NonText'        , colors.fg_alt          , colors.bg_main)
    Group.new('NormalNC'       , colors.fg_inactive     , colors.bg_inactive)
    Group.new('Folded'         , colors.fg_special_mild , colors.bg_special_mild     , styles.none)
    Group.new('Error'          , colors.fg_main         , colors.red_intense_bg      , styles.bold)
    Group.new('ErrorMsg'       , colors.fg_main         , colors.red_intense_bg)
    Group.new('Comment'        , colors.fg_alt          , colors.none                , styles.italic)
    Group.new('Conceal'        , colors.fg_special_warm , colors.bg_dim              , styles.bold)
    Group.new('Cursor'         , groups.Normal.bg_main  , groups.Normal.fg_main      , styles.none)
    Group.new('ColorColumn'    , colors.none            , colors.bg_active           , styles.none)
    Group.new('CursorLine'     , colors.bg_hl_line      , colors.none                , styles.none)
    Group.new("Define"         , colors.fg_main         , colors.none                , styles.none)
    Group.new("Delimiter"      , colors.fg_main         , colors.none                , styles.none)
    Group.new('Float'          , colors.fg_main         , colors.none)
    Group.new("Special"        , colors.fg_main         , colors.none                , styles.none)
    Group.new("SpecialComment" , colors.fg_alt          , colors.none                , styles.none)
    Group.new("Title"          , colors.fg_special_cold , colors.none                , styles.bold)
    Group.new('Visual'         , colors.fg_main         , colors.magenta_intense_bg)
    Group.new('Whitespace'     , colors.fg_main         , colors.none                , styles.bold)
    Group.new('TabLine'        , colors.fg_main         , colors.bg_tab_inactive)
    Group.new('TabLineSel'     , colors.fg_tab_active   , colors.bg_tab_active)
    Group.new('TabLineFill'    , colors.none            , colors.bg_tab_bar)
    Group.new('Search'         , colors.fg_main         , colors.green_intense_bg)
    Group.new('EndOfBuffer'    , colors.fg_inactive     , colors.none)

    if faint == 0 then
        Group.new('Function'       , colors.magenta           , colors.none)
        Group.new('Warning'        , colors.yellow_alt        , colors.none)
        Group.new('Boolean'        , colors.blue              , colors.none                , styles.bold)
        Group.new('Character'      , colors.blue_alt          , colors.none)
        Group.new('Conditional'    , colors.magenta_alt_other , colors.none)
        Group.new('Constant'       , colors.blue_alt_other    , colors.none)
        Group.new("Directory"      , colors.blue              , colors.none                , styles.none)
        Group.new("Exception"      , colors.magenta_alt_other , colors.none                , styles.none)
        Group.new("Identifier"     , colors.blue_alt_other    , colors.none                , styles.none)
        Group.new("Include"        , colors.red_alt_other     , colors.none                , styles.none)
        Group.new('Keyword'        , colors.magenta_alt_other , colors.none)
        Group.new("Label"          , colors.cyan              , colors.none                , styles.none)
        Group.new('PreProc'        , colors.red_alt_other     , colors.none)
        Group.new("Repeat"         , colors.magenta_alt_other , colors.none                , styles.none)
        Group.new("SpecialChar"    , colors.blue_alt_other    , colors.none                , styles.none)
        Group.new("Statement"      , colors.magenta_alt_other , colors.none                , styles.none)
        Group.new("StorageClass"   , colors.magenta_alt_other , colors.none                , styles.none)
        Group.new("String"         , colors.blue_alt          , colors.none                , styles.none)
        Group.new("Structure"      , colors.magenta_alt_other , colors.none                , styles.none)
        Group.new("Tag"            , colors.magenta_active    , colors.none                , styles.none)
        Group.new("Todo"           , colors.magenta           , colors.none                , styles.bold)
        Group.new("Type"           , colors.magenta_alt       , colors.none                , styles.none)
        Group.new("Typedef"        , colors.magenta_alt       , colors.none                , styles.none)
        Group.new("Underlined"     , colors.none              , colors.blue_nuanced_bg     , styles.underline)
        Group.new('Type'           , colors.magenta_alt       , colors.none)
    else
        Group.new('Function'       , colors.magenta_faint           , colors.none)
        Group.new('Warning'        , colors.yellow_alt_faint        , colors.none)
        Group.new('Boolean'        , colors.blue_faint              , colors.none                , styles.bold)
        Group.new('Character'      , colors.blue_alt_faint          , colors.none)
        Group.new('Conditional'    , colors.magenta_alt_other_faint , colors.none)
        Group.new('Constant'       , colors.blue_alt_other_faint    , colors.none)
        Group.new('CursorLine'     , colors.bg_hl_line              , colors.none                , styles.none)
        Group.new("Directory"      , colors.blue_faint              , colors.none                , styles.none)
        Group.new("Exception"      , colors.magenta_alt_other_faint , colors.none                , styles.none)
        Group.new("Identifier"     , colors.blue_alt_other_faint    , colors.none                , styles.none)
        Group.new("Include"        , colors.red_alt_other_faint     , colors.none                , styles.none)
        Group.new('Keyword'        , colors.magenta_alt_other_faint , colors.none)
        Group.new("Label"          , colors.cyan_faint              , colors.none                , styles.none)
        Group.new('PreProc'        , colors.red_alt_other_faint     , colors.none)
        Group.new("Repeat"         , colors.magenta_alt_other_faint , colors.none                , styles.none)
        Group.new("SpecialChar"    , colors.blue_alt_other_faint    , colors.none                , styles.none)
        Group.new("Statement"      , colors.magenta_alt_other_faint , colors.none                , styles.none)
        Group.new("StorageClass"   , colors.magenta_alt_other_faint , colors.none                , styles.none)
        Group.new("String"         , colors.blue_alt_faint          , colors.none                , styles.none)
        Group.new("Structure"      , colors.magenta_alt_other_faint , colors.none                , styles.none)
        Group.new("Tag"            , colors.magenta_active          , colors.none                , styles.none)
        Group.new("Todo"           , colors.magenta_faint           , colors.none                , styles.bold)
        Group.new("Type"           , colors.magenta_alt_faint       , colors.none                , styles.none)
        Group.new("Typedef"        , colors.magenta_alt_faint       , colors.none                , styles.none)
        Group.new("Underlined"     , colors.none                    , colors.blue_nuanced_bg     , styles.underline)
        Group.new('Type'           , colors.magenta_alt_faint       , colors.none)
    end


    -- Parenthesis
    Group.new('MatchParen' , colors.fg_main     , colors.bg_paren_match)
    Group.new('Number'     , colors.fg_main     , colors.none)
    Group.new("Operator"   , groups.Normal , colors.none            , styles.none)

    -- Completion(Pmenu)
    Group.new('Pmenu'      , colors.fg_active , colors.bg_active)
    Group.new('PmenuSel'   , colors.fg_dim    , colors.bg_dim)
    Group.new('PmenuSbar'  , colors.none      , colors.bg_inactive)
    Group.new('PmenuThumb' , colors.none      , colors.fg_main)


    -- Statusline
    Group.new('StatusLine'   , colors.bg_main          , colors.blue_active)
    Group.new('StatusLineNC' , colors.fg_inactive , colors.bg_main)


    -- Line Numbers
    Group.new('LineNr'       , colors.fg_alt    , colors.bg_dim)
    Group.new('CursorLineNr' , colors.fg_active , colors.bg_active    , styles.bold)
    Group.new('CursorLine'   , colors.none      , colors.bg_inactive)
    Group.new('SignColumn'   , colors.none      , colors.bg_inactive)
    Group.new('VertSplit'    , colors.fg_main   , colors.none)

    -- Lua
    Group.new('luaConstant'     , groups.Constant  , colors.none    , styles.bold)
    Group.new('luaComment'      , groups.Comment   , groups.Comment , groups.Comment)
    Group.new('luaStatement'    , groups.Statement , colors.none)
    Group.new('luafunctioncall' , groups.Function  , colors.none)
    Group.new('luaemmyfluff'    , groups.Comment   , colors.none)
    Group.new('luaTodo'         , groups.Todo      , colors.none  , styles.bold)

    if faint == 0 then
        Group.new('luaVarName' , colors.cyan       , colors.none)
        Group.new('luaFunc'    , groups.Function   , colors.none)
    else
        Group.new('luaVarName' , colors.cyan_faint , colors.none)
        Group.new('luaFunc'    , groups.Function   , colors.none)
    end

    Group.new('luaTableConstructor' , groups.Typedef , colors.none)

    -- Python
    Group.new('pythonoperator'  , groups.Operator , groups.Operator , styles.none)


    -- vim/nvim
    Group.new('vimcommand'       , groups.Statement   , colors.none)
    Group.new('vimLet'           , groups.vimcommand  , colors.none)
    Group.new('vimFuncVar'       , groups.identifier  , colors.none)
    Group.new('vimCommentTitle'  , groups.PreProc     , colors.none)
    Group.new('vimIsCommand'     , colors.none        , colors.none)
    Group.new('vimFuncSID'       , groups.Special     , colors.none)
    Group.new('vimCommentString' , groups.Comment     , colors.none)
    Group.new('vimMapModKey'     , groups.vimFuncSID  , colors.none)
    Group.new('vimMapLhs'        , colors.none        , colors.none)
    Group.new('vimNotation'      , colors.fg_main     , colors.none)
    Group.new('vimBracket'       , groups.Delimiter   , colors.none)
    Group.new('vimMap'           , groups.vimcommand  , colors.none)
    Group.new('vimnotfunc'       , groups.Conditional , colors.none)
    Group.new('nvimMap'          , groups.vimMap      , colors.none)

    if faint == 0 then
        Group.new('NvimPlainAssignment' , colors.magenta_alt , colors.none)
        Group.new('NvimIdentifier'      , colors.cyan_alt    , colors.none)
        Group.new('vimVar'              , colors.cyan        , colors.none)
    else
        Group.new('NvimPlainAssignment' , colors.magenta_alt_faint , colors.none)
        Group.new('NvimIdentifier'      , colors.cyan_alt_faint    , colors.none)
        Group.new('vimVar'              , colors.cyan_faint        , colors.none)
    end


    -- Diff
    Group.new("DiffAdd"    , colors.fg_diff_added   , colors.bg_diff_added   , styles.none)
    Group.new("DiffChange" , colors.fg_diff_changed , colors.bg_diff_changed , styles.none)
    Group.new("DiffDelete" , colors.fg_diff_removed , colors.bg_diff_removed , styles.none)
    Group.new("DiffText"   , colors.fg_diff_changed , colors.bg_diff_changed , styles.none)

    -- built_in LSP
    Group.new("LspDiagnosticsSignError"            , colors.red_active    , colors.bg_active , styles.bold)
    Group.new("LspDiagnosticsVirtualTextError"     , colors.red_active    , colors.bg_main   , styles.bold)
    Group.new("LspDiagnosticsUnderlineError"       , colors.red_active    , colors.bg_main   , styles.underline)

    Group.new("LspDiagnosticsSignWarning"          , colors.yellow_active , colors.bg_active , styles.bold)
    Group.new("LspDiagnosticsVirtualTextWarning"   , colors.yellow_active , colors.bg_main   , styles.bold)
    Group.new("LspDiagnosticsUnderlineWarning"     , colors.yellow_active , colors.bg_main   , styles.underline)

    Group.new("LspDiagnosticsSignHint"             , colors.green_active  , colors.bg_active , styles.bold)
    Group.new("LspDiagnosticsSignInformation"      , colors.green_active  , colors.bg_active , styles.bold)
    Group.new("LspDiagnosticsVirtualTextHint"      , colors.green_active  , colors.bg_active , styles.bold)
    Group.new("LspDiagnosticsUnderlineInformation" , colors.green_active  , colors.bg_main   , styles.underline)

    -- Spellings
    Group.new("SpellBad" , colors.fg_lang_error , colors.none , styles.none)
    Group.new("SpellCap" , colors.fg_lang_error , colors.none , styles.none)



    -- Markdown
    --[[Not using the underline as I have not figured out how to apply it correctly]]--

    Group.new("markdownh1"                 , colors.fg_main         , colors.magenta_nuanced_bg , styles.bold)
    Group.new("markdownh2"                 , colors.fg_special_warm , colors.red_nuanced_bg     , styles.bold)
    Group.new("markdownh3"                 , colors.fg_special_cold , colors.blue_nuanced_bg    , styles.bold)
    Group.new("markdownh4"                 , colors.fg_special_mild , colors.cyan_nuanced_bg    , styles.bold)
    Group.new("markdownh5"                 , colors.fg_special_calm , colors.none               , styles.bold)
    Group.new("markdownh6"                 , colors.yellow_nuanced  , colors.none               , styles.bold)
    Group.new("markdownRule"               , groups.markdownH2      , colors.none               , styles.bold)
    Group.new("markdownItalic"             , colors.fg_special_cold , colors.none               , styles.italic)
    Group.new("markdownBold"               , colors.fg_main         , colors.none               , styles.bold)
    Group.new("markdownBoldItalic"         , colors.fg_main         , colors.none               , styles.bold + styles.italic)
    Group.new("markdownCodeDelimiter"      , colors.green_alt_other , colors.none               , styles.bold)
    Group.new("markdownCode"               , colors.fg_special_mild , colors.bg_dim             , styles.none)
    Group.new("markdownCodeBlock"          , colors.fg_special_mild , colors.bg_dim             , styles.none)
    Group.new("markdownFootnoteDefinition" , colors.fg_main         , colors.none               , styles.italic)
    Group.new("markdownListMarker"         , colors.fg_alt          , colors.none               , styles.bold)
    Group.new("markdownLineBreak"          , colors.cyan_refine_fg  , colors.cyan_refine_bg     , styles.underline)

    if faint == 0 then
        Group.new("markdownUrl"        , colors.blue     , colors.none , styles.none)
        Group.new("markdownFootnote"   , colors.cyan_alt , colors.none , styles.italic)
        Group.new("markdownBlockquote" , colors.magenta  , colors.none , styles.bold)
        Group.new("markdownLinkText"   , colors.blue     , colors.none , styles.italic)
    else
        Group.new("markdownUrl"        , colors.blue_faint     , colors.none , styles.none)
        Group.new("markdownFootnote"   , colors.cyan_alt_faint , colors.none , styles.italic)
        Group.new("markdownBlockquote" , colors.magenta_faint  , colors.none , styles.bold)
        Group.new("markdownLinkText"   , colors.blue_faint     , colors.none , styles.italic)
    end



    -- Nix
    Group.new("nixAttributeDefinition" , groups.Label      , groups.Label      , styles.none)
    Group.new("nixAttribute"           , groups.Identifier , groups.Identifier , styles.none)
    Group.new("nixFunctionCall"        , groups.Function   , groups.Function   , styles.none)


    -- TreeSitter

    Group.new("TSError"          , groups.Error                    , groups.Error     , styles.bold)
    Group.new("TSPunctDelimiter" , colors.fg_main                  , colors.none)
    Group.new("TSPunctBracket"   , colors.fg_main                  , colors.none)
    Group.new("TSConstant"       , groups.Constant                 , groups.Constant  , groups.Constant)
    Group.new("TSConstBuiltin"   , groups.Constant                 , groups.Constant  , groups.Constant)
    Group.new("TSConstMacro"     , groups.Constant                 , groups.Constant  , groups.Constant)
    Group.new("TSString"         , groups.String                   , groups.String    , groups.String)
    Group.new("TSStringRegex"    , colors.fg_escape_char_construct , colors.none)
    Group.new("TSStringEscape"   , colors.fg_escape_char_backslash , colors.none)
    Group.new("TSCharacter"      , groups.Character                , groups.Character , groups.Character)
    Group.new("TSNumber"         , groups.Number                   , groups.Number    , groups.Number)
    Group.new("TSBoolean"        , groups.Boolean                  , groups.Boolean   , groups.Boolean)
    Group.new("TSFloat"          , groups.Number                   , groups.Number    , groups.Number)
    Group.new("TSFunction"       , groups.Function                 , groups.Function  , groups.Function)
    Group.new("TSFuncBuiltin"    , groups.Function                 , groups.Function  , groups.Function)
    Group.new("TSFuncMacro"      , groups.Function                 , groups.Function  , groups.Function)

    if faint == 0 then
        Group.new("TSParameter"       , colors.cyan              , colors.none  , styles.none)
        Group.new("TSConstructor"     , colors.magenta_alt       , colors.none)
        Group.new("TSKeywordFunction" , colors.magenta_alt       , colors.none  , styles.none)
        Group.new("TSLiteral"         , colors.blue_alt          , colors.none  , styles.bold)
        Group.new("TSVariable"        , colors.cyan              , colors.none  , styles.none)
        Group.new("TSVariableBuiltin" , colors.magenta_alt_other , colors.none  , styles.none)
    else
        Group.new("TSParameter"       , colors.cyan_faint              , colors.none  , styles.none)
        Group.new("TSConstructor"     , colors.magenta_alt_faint       , colors.none)
        Group.new("TSKeywordFunction" , colors.magenta_alt_faint       , colors.none  , styles.none)
        Group.new("TSLiteral"         , colors.blue_alt_faint          , colors.none  , styles.bold)
        Group.new("TSVariable"        , colors.cyan_faint              , colors.none  , styles.none)
        Group.new("TSVariableBuiltin" , colors.magenta_alt_other_faint , colors.none  , styles.none)
    end

    Group.new("TSParameterReference" , groups.TSParameter     , groups.TSParameter , groups.TSParameter)
    Group.new("TSMethod"             , groups.Function        , groups.Function    , groups.Function)
    Group.new("TSConditional"        , groups.Conditional     , groups.Conditional , groups.Conditional)
    Group.new("TSRepeat"             , groups.Repeat          , groups.Repeat      , groups.Repeat)
    Group.new("TSLabel"              , groups.Label           , groups.Label       , groups.Label)
    Group.new("TSOperator"           , groups.Operator        , groups.Operator    , groups.Operator)
    Group.new("TSKeyword"            , groups.Keyword         , groups.Keyword     , groups.Keyword)
    Group.new("TSException"          , groups.Exception       , groups.Exception   , groups.Exception)
    Group.new("TSType"               , groups.Type            , groups.Type        , styles.none)
    Group.new("TSTypeBuiltin"        , groups.Type            , groups.Type        , styles.none)
    Group.new("TSStructure"          , groups.Structure       , groups.Structure   , groups.Structure)
    Group.new("TSInclude"            , groups.Include         , groups.Include     , groups.Include)
    Group.new("TSAnnotation"         , colors.blue_nuanced_bg , colors.none)
    Group.new("TSStrong"             , colors.fg_main         , colors.bg_main     , styles.bold)
    Group.new("TSTitle"              , colors.cyan_nuanced    , colors.none)


    -- Telescope
    Group.new("TelescopeMatching" , colors.fg_main , colors.green_intense_bg , styles.bold)

    -- Startify
    Group.new("StartifyHeader"  , colors.fg_special_cold , colors.none , styles.bold)
    Group.new("StartifySpecial" , colors.fg_special_warm , colors.none , styles.bold)
    Group.new("StartifySection" , colors.fg_special_warm , colors.none , styles.bold)
    Group.new("StartifyPath"    , colors.fg_main         , colors.none , styles.none)
    Group.new("StartifyFile"    , colors.fg_main         , colors.none , styles.none)
    Group.new("StartifyBracket" , colors.fg_main         , colors.none , styles.none)
    Group.new("StartifySlash"   , colors.fg_main         , colors.none , styles.none)
    Group.new("StartifyFooter"  , colors.fg_special_mild , colors.none , styles.none)

    -- LuaTree
    Group.new("NvimTreeFolderIcon" , colors.blue , colors.none , styles.none)

    -- BarBar

    Group.new("BufferCurrent"       , colors.fg_tab_active  , colors.bg_tab_active , styles.none)
    Group.new("BufferCurrentMod"    , colors.yellow_active  , colors.bg_tab_active , styles.none)
    Group.new("BufferCurrentSign"   , colors.fg_tab_active  , colors.bg_tab_active , styles.bold)
    Group.new("BufferCurrentTarget" , colors.magenta_active , colors.bg_tab_active , styles.bold)

    Group.new("BufferVisible"       , colors.fg_main        , colors.bg_tab_active , styles.none)
    Group.new("BufferVisibleMod"    , colors.green_active   , colors.bg_tab_active , styles.none)
    Group.new("BufferVisibleSign"   , colors.fg_tab_active  , colors.bg_tab_active , styles.bold)
    Group.new("BufferVisibleTarget" , colors.magenta_active , colors.bg_tab_active , styles.bold)

    Group.new("BufferInactive"       , colors.fg_main        , colors.bg_tab_inactive , styles.none)
    Group.new("BufferInactiveMod"    , colors.green_active   , colors.bg_tab_inactive , styles.none)
    Group.new("BufferInactiveSign"   , colors.fg_tab_active  , colors.bg_tab_inactive , styles.bold)
    Group.new("BufferInactiveTarget" , colors.magenta_active , colors.bg_tab_inactive , styles.bold)

    -- Terminal colors
    vim.g.terminal_color_0  = "#555555"
    vim.g.terminal_color_8  = "#222222"
    vim.g.terminal_color_1  = palette.red_faint
    vim.g.terminal_color_9  = palette.red_intense
    vim.g.terminal_color_2  = palette.green_faint
    vim.g.terminal_color_10 = palette.green_intense
    vim.g.terminal_color_3  = palette.yellow_faint
    vim.g.terminal_color_11 = palette.yellow_intense
    vim.g.terminal_color_4  = palette.blue_faint
    vim.g.terminal_color_12 = palette.blue_intense
    vim.g.terminal_color_5  = palette.magenta_faint
    vim.g.terminal_color_13 = palette.magenta_intense
    vim.g.terminal_color_6  = palette.cyan_faint
    vim.g.terminal_color_14 = palette.cyan_intense
    vim.g.terminal_color_7  = "#ffffff"
    vim.g.terminal_color_15 = "#dddddd"

    -- Galaxyline

    if statusline == 1 then
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
                highlight = {palette.bg_active, palette.bg_active}
            }
        }

        gls.left[2] = {
            ViMode = {
                provider = function()
                    local mode_color = {
                        n      = palette.magenta_active,
                        i      = palette.green_active,
                        v      = palette.cyan_active,
                        [''] = palette.cyan_active,
                        V      = palette.cyan_active,
                        c      = palette.red_active,
                        R      = palette.red_active,
                        Rv     = palette.red_active,
                        t      = palette.blue_active,
                        ['!']  = palette.blue_active,
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
                separator_highlight = {palette.bg_active,function()
                    if not buffer_not_empty() then
                        return palette.bg_main
                    end
                    return palette.bg_main
                end},
                highlight = {palette.fg_active,palette.bg_active,'bold'},
            },
        }

        gls.left[3] ={
            FileIcon = {
                provider = 'FileIcon',
                condition = buffer_not_empty,
                highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,palette.bg_main},
            },
        }

        gls.left[4] = {
            FileName = {
                provider = {'FileName','FileSize'},
                condition = buffer_not_empty,
                separator = '',
                separator_highlight = {palette.bg_active,palette.bg_main},
                highlight = {palette.fg_active,palette.bg_main,'bold'}
            }
        }

        gls.left[5] = {
            GitIcon = {
                provider = function() return '  ' end,
                condition = buffer_not_empty,
                highlight = {palette.fg_active,palette.bg_active},
            }
        }
        gls.left[6] = {
            GitBranch = {
                provider = 'GitBranch',
                condition = buffer_not_empty,
                highlight = {palette.fg_active,palette.bg_active},
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
                highlight = {palette.green_active,palette.bg_active},
            }
        }
        gls.left[8] = {
            DiffModified = {
                provider = 'DiffModified',
                condition = checkwidth,
                icon = ' ',
                highlight = {palette.yellow_active,palette.bg_active},
            }
        }
        gls.left[9] = {
            DiffRemove = {
                provider = 'DiffRemove',
                condition = checkwidth,
                icon = ' ',
                highlight = {palette.red_active,palette.bg_active},
            }
        }
        gls.left[10] = {
            LeftEnd = {
                provider = function() return '' end,
                condition = buffer_not_empty,
                highlight = {palette.bg_active,palette.bg_main}
            }
        }
        gls.left[11] = {
            DiagnosticError = {
                provider = 'DiagnosticError',
                icon = '  ',
                highlight = {palette.red_active,palette.bg_main}
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
                highlight = {palette.yellow_active,palette.bg_main},
            }
        }

        gls.right[1]= {
            FileFormat = {
                provider = 'FileFormat',
                separator = '',
                separator_highlight = {palette.bg_main,palette.bg_active},
                highlight = {palette.fg_active,palette.bg_active},
            }
        }
        gls.right[2] = {
            LineInfo = {
                provider = 'LineColumn',
                separator = ' | ',
                separator_highlight = {palette.fg_active,palette.bg_active},
                highlight = {palette.fg_active,palette.bg_active},
            },
        }
        gls.right[3] = {
            PerCent = {
                provider = 'LinePercent',
                separator = '',
                separator_highlight = {palette.bg_main,palette.bg_active},
                highlight = {palette.fg_active,palette.bg_main},
            }
        }
        gls.right[4] = {
            ScrollBar = {
                provider = 'ScrollBar',
                highlight = {palette.fg_active,palette.bg_main},
            }
        }

        gls.short_line_left[1] = {
            BufferType = {
                provider = { 'FileName' },
                separator = '',
                separator_highlight = {palette.bg_active,palette.bg_main},
                highlight = {palette.fg_active,palette.bg_active}
            }
        }

        gls.short_line_right[1] = {
            BufferIcon = {
                provider= 'BufferIcon',
                separator = '',
                separator_highlight = {palette.bg_active,palette.bg_main},
                highlight = {palette.fg_active,palette.bg_active}
            }
        }

    end
end

return {
    init = init,
}
