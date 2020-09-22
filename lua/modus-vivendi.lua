--[[
--Note that the colorscheme set for markdown here conflicts with the plasticboy-markdown plugin
--The pandoc syntax also conflicts with it.
]]--

-- vim: fdm=marker

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new("bg"     , "#000000")
Color.new("fg"     , "#ffffff")
Color.new("bg_alt" , "#181a20")
Color.new("fg_alt" , "#a8a8a8")
Color.new("bg_dim" , "#110b11")
Color.new("fg_dim" , "#e0e6f0")

-- specifically for on/off states (e.g. `mode_line')
--
-- must be combined with themselves

Color.new("bg_active"   , "#2f2f2f")
Color.new("fg_active"   , "#f5f5f5")
Color.new("bg_inactive" , "#202020")
Color.new("fg_inactive" , "#bebebe")

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg,bg}_{main,alt,dim}

Color.new("bg_special_cold" , "#203448")
Color.new("fg_special_cold" , "#c6eaff")
Color.new("bg_special_mild" , "#00322e")
Color.new("fg_special_mild" , "#bfebe0")
Color.new("bg_special_warm" , "#382f27")
Color.new("fg_special_warm" , "#f8dec0")
Color.new("bg_special_calm" , "#392a48")
Color.new("fg_special_calm" , "#fbd6f4")

-- styles for the main constructs
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red"     , "#ff8059")
Color.new("green"   , "#44bc44")
Color.new("yellow"  , "#eecc00")
Color.new("blue"    , "#29aeff")
Color.new("magenta" , "#feacd0")
Color.new("cyan"    , "#00d3d0")

-- styles for common, but still specialised constructs
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt"     , "#f4923b")
Color.new("green_alt"   , "#80d200")
Color.new("yellow_alt"  , "#cfdf30")
Color.new("blue_alt"    , "#72a4ff")
Color.new("magenta_alt" , "#f78fe7")
Color.new("cyan_alt"    , "#4ae8fc")

-- same purpose as above, just slight differences
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt_other"     , "#ff9977")
Color.new("green_alt_other"   , "#00cd68")
Color.new("yellow_alt_other"  , "#f0ce43")
Color.new("blue_alt_other"    , "#00bdfa")
Color.new("magenta_alt_other" , "#b6a0ff")
Color.new("cyan_alt_other"    , "#6ae4b9")

-- styles for desaturated foreground text, intended for use with
-- the `modus_vivendi_theme_faint_syntax' option
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_faint"               , "#ffa0a0")
Color.new("green_faint"             , "#88cf88")
Color.new("yellow_faint"            , "#d2b580")
Color.new("blue_faint"              , "#92baff")
Color.new("magenta_faint"           , "#e0b2d6")
Color.new("cyan_faint"              , "#a0bfdf")

Color.new("red_alt_faint"           , "#f5aa80")
Color.new("green_alt_faint"         , "#a8cf88")
Color.new("yellow_alt_faint"        , "#cabf77")
Color.new("blue_alt_faint"          , "#a4b0ff")
Color.new("magenta_alt_faint"       , "#ef9fe4")
Color.new("cyan_alt_faint"          , "#90c4ed")

Color.new("red_alt_other_faint"     , "#ff9fbf")
Color.new("green_alt_other_faint"   , "#88cfaf")
Color.new("yellow_alt_other_faint"  , "#d0ba95")
Color.new("blue_alt_other_faint"    , "#8fc5ff")
Color.new("magenta_alt_other_faint" , "#d0b4ff")
Color.new("cyan_alt_other_faint"    , "#a4d0bb")

-- styles for elements that should be very subtle, yet accented
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds

Color.new("red_nuanced"     , "#ffcccc")
Color.new("green_nuanced"   , "#b8e2b8")
Color.new("yellow_nuanced"  , "#dfdfb0")
Color.new("blue_nuanced"    , "#bfd9ff")
Color.new("magenta_nuanced" , "#e5cfef")
Color.new("cyan_nuanced"    , "#a8e5e5")

-- styles for slightly accented background
--
-- must be combined with any of the above foreground values

Color.new("red_nuanced_bg"     , "#2c0614")
Color.new("green_nuanced_bg"   , "#001904")
Color.new("yellow_nuanced_bg"  , "#221000")
Color.new("blue_nuanced_bg"    , "#0f0e39")
Color.new("magenta_nuanced_bg" , "#230631")
Color.new("cyan_nuanced_bg"    , "#041529")

-- styles for elements that should draw attention to themselves
--
-- must be combined with: `bg_main'

Color.new("red_intense"     , "#fb6859")
Color.new("green_intense"   , "#00fc50")
Color.new("yellow_intense"  , "#ffdd00")
Color.new("blue_intense"    , "#00a2ff")
Color.new("magenta_intense" , "#ff8bd4")
Color.new("cyan_intense"    , "#30ffc0")

-- styles for background elements that should be visible yet
-- subtle
--
-- must be combined with: `fg_dim'

Color.new("red_subtle_bg"     , "#762422")
Color.new("green_subtle_bg"   , "#2f4a00")
Color.new("yellow_subtle_bg"  , "#604200")
Color.new("blue_subtle_bg"    , "#10387c")
Color.new("magenta_subtle_bg" , "#49366e")
Color.new("cyan_subtle_bg"    , "#00415e")

-- styles for background elements that should be visible and
-- distinguishable
--
-- must be combined with: `fg_main'

Color.new("red_intense_bg"     , "#a4202a")
Color.new("green_intense_bg"   , "#006800")
Color.new("yellow_intense_bg"  , "#874900")
Color.new("blue_intense_bg"    , "#2a40b8")
Color.new("magenta_intense_bg" , "#7042a2")
Color.new("cyan_intense_bg"    , "#005f88")

-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
--
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds

Color.new("red_refine_bg"     , "#77002a")
Color.new("red_refine_fg"     , "#ffb9ab")
Color.new("green_refine_bg"   , "#00422a")
Color.new("green_refine_fg"   , "#9ff0cf")
Color.new("yellow_refine_bg"  , "#693200")
Color.new("yellow_refine_fg"  , "#e2d980")
Color.new("blue_refine_bg"    , "#242679")
Color.new("blue_refine_fg"    , "#8ec6ff")
Color.new("magenta_refine_bg" , "#71206a")
Color.new("magenta_refine_fg" , "#ffcaf0")
Color.new("cyan_refine_bg"    , "#004065")
Color.new("cyan_refine_fg"    , "#8ae4f2")

-- styles that are meant exclusively for the statusline
--
-- must be combined with: `bg_active', `bg_inactive'

Color.new("red_active"     , "#ffa49e")
Color.new("green_active"   , "#70e030")
Color.new("yellow_active"  , "#efdf00")
Color.new("blue_active"    , "#00ccff")
Color.new("magenta_active" , "#d0acff")
Color.new("cyan_active"    , "#00ddc0")

-- styles that are meant exclusively for the fringes
--
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'

Color.new("red_fringe_bg"     , "#8f0040")
Color.new("green_fringe_bg"   , "#006000")
Color.new("yellow_fringe_bg"  , "#6f4a00")
Color.new("blue_fringe_bg"    , "#3a30ab")
Color.new("magenta_fringe_bg" , "#692089")
Color.new("cyan_fringe_bg"    , "#0068a0")

-- styles reserved for specific faces
--
-- `bg_hl_line' is between `bg_dim' and `bg_alt', so it should
-- work with all accents that cover those two, plus `bg_main'
--
-- `bg_header' is between `bg_active' and `bg_inactive', so it
-- can be combined with any of the "active" values, plus the
-- "special" and base foreground colours
--
-- `bg_paren_match', `bg_paren_match_intense', `bg_region' and
-- `bg_tab_active' must be combined with `fg_main', while
-- `bg_tab_inactive' should be combined with `fg_dim'
--
-- `bg_tab_bar' is only intended for the bar that holds the tabs and
-- can only be combined with `fg_main'
--
-- `fg_tab_active' is meant to be combined with `bg_tab_active',
-- though only for styling special elements, such as underlining
-- the current tab
--
-- `fg_escape_char_construct' and `fg_escape_char_backslash' can
-- be combined `bg_main', `bg_dim', `bg_alt'
--
-- `fg_lang_error', `fg_lang_warning', `fg_lang_note' can be
-- combined with `bg_main', `bg_dim', `bg_alt'
--
-- `fg_mark_sel', `fg_mark_del', `fg_mark_alt' can be combined
-- with `bg_main', `bg_dim', `bg_alt', `bg_hl_line'
--
-- `fg_unfocused' must be combined with `fg_main'
--
-- the window divider colours apply to faces with just an fg value
--
-- all pairs are combinable with themselves

Color.new("bg_hl_line"             , "#151823")
Color.new("bg_paren_match"         , "#5f362f")
Color.new("bg_paren_match_intense" , "#255650")
Color.new("bg_region"              , "#3c3c3c")

Color.new("bg_tab_bar"      , "#2c2c2c")
Color.new("bg_tab_active"   , "#0e0e0e")
Color.new("bg_tab_inactive" , "#3d3d3d")
Color.new("fg_tab_active"   , "#5ac3cf")

Color.new("fg_escape_char_construct" , "#e7a59a")
Color.new("fg_escape_char_backslash" , "#abab00")

Color.new("fg_lang_error"   , "#ef8690")
Color.new("fg_lang_warning" , "#b0aa00")
Color.new("fg_lang_note"    , "#9d9def")

Color.new("fg_window_divider_inner" , "#646464")
Color.new("fg_window_divider_outer" , "#969696")

Color.new("fg_unfocused" , "#93959b")

Color.new("bg_header" , "#212121")
Color.new("fg_header" , "#dddddd")

Color.new("bg_whitespace" , "#170016")
Color.new("fg_whitespace" , "#a4959f")

Color.new("bg_diff_heading" , "#304466")
Color.new("fg_diff_heading" , "#dadffe")
Color.new("bg_diff_added"   , "#0a280a")
Color.new("fg_diff_added"   , "#94ba94")
Color.new("bg_diff_changed" , "#2a2000")
Color.new("fg_diff_changed" , "#b0ba9f")
Color.new("bg_diff_removed" , "#40160f")
Color.new("fg_diff_removed" , "#c6adaa")

-- Might added if there is a plugin
-- Color.new("bg_diff_focus_added"   , "#203d20")
-- Color.new("fg_diff_focus_added"   , "#b4ddb4")
-- Color.new("bg_diff_focus_changed" , "#4a3a10")
-- Color.new("fg_diff_focus_changed" , "#d0daaf")
-- Color.new("bg_diff_focus_removed" , "#5e2526")
-- Color.new("fg_diff_focus_removed" , "#eebdba")

Color.new("bg_mark_sel" , "#002f2f")
Color.new("fg_mark_sel" , "#60cfa2")
Color.new("bg_mark_del" , "#5a0000")
Color.new("fg_mark_del" , "#ff99aa")
Color.new("bg_mark_alt" , "#3f2210")
Color.new("fg_mark_alt" , "#f0aa20")

-- base colors {{{
Group.new('Normal'         , colors.fg              , colors.bg)
Group.new('NormalNC'       , colors.fg_inactive     , colors.bg_inactive)
Group.new('Folded'         , colors.fg_special_mild , colors.bg_special_mild     , styles.none)
Group.new('Error'          , colors.fg              , colors.red_intense_bg      , styles.bold)
Group.new('ErrorMsg'       , colors.fg              , colors.red_intense_bg)
Group.new('Comment'        , colors.fg_alt          , colors.none                , styles.italic)
Group.new('Conceal'        , colors.fg_special_warm , colors.bg_dim              , styles.bold)
Group.new('CursorLine'     , colors.bg_hl_line      , colors.none                , styles.NONE)
Group.new("Define"         , colors.fg              , colors.none                , styles.NONE)
Group.new("Delimiter"      , colors.fg              , colors.none                , styles.NONE)
Group.new('Float'          , colors.fg              , colors.none)
Group.new("Special"        , colors.fg              , colors.none                , styles.NONE)
Group.new("SpecialComment" , colors.fg_alt          , colors.none                , styles.NONE)
Group.new("Title"          , colors.fg_special_cold , colors.none                , styles.bold)
Group.new('Visual'         , colors.fg              , colors.magenta_intense_bg)
Group.new('Whitespace'     , colors.fg              , colors.none                , styles.bold)
Group.new('TabLine'        , colors.fg_dim          , colors.bg_tab_inactive)
Group.new('TabLineSel'     , colors.fg              , colors.bg_tab_active)
Group.new('Search'         , colors.fg              , colors.green_intense_bg)
Group.new('EndOfBuffer'    , colors.fg_inactive     , colors.none)

if vim.g.modus_faint_syntax == 1 then
  Group.new('Function'       , colors.magenta           , colors.none)
  Group.new('Warning'        , colors.yellow_alt        , colors.none)
  Group.new('Boolean'        , colors.blue              , colors.none                , styles.bold)
  Group.new('Character'      , colors.blue_alt          , colors.none)
  Group.new('Conditional'    , colors.magenta_alt_other , colors.none)
  Group.new('Constant'       , colors.blue_alt_other    , colors.none)
  Group.new("Directory"      , colors.blue              , colors.none                , styles.none)
  Group.new("Exception"      , colors.magenta_alt_other , colors.none                , styles.NONE)
  Group.new("Identifier"     , colors.blue_alt_other    , colors.none                , styles.NONE)
  Group.new("Include"        , colors.red_alt_other     , colors.none                , styles.NONE)
  Group.new('Keyword'        , colors.magenta_alt_other , colors.none)
  Group.new("Label"          , colors.cyan              , colors.none                , styles.NONE)
  Group.new('PreProc'        , colors.red_alt_other     , colors.none)
  Group.new("Repeat"         , colors.magenta_alt_other , colors.none                , styles.NONE)
  Group.new("SpecialChar"    , colors.blue_alt_other    , colors.none                , styles.NONE)
  Group.new("Statement"      , colors.magenta_alt_other , colors.none                , styles.NONE)
  Group.new("StorageClass"   , colors.magenta_alt_other , colors.none                , styles.NONE)
  Group.new("String"         , colors.blue_alt          , colors.none                , styles.NONE)
  Group.new("Structure"      , colors.magenta_alt_other , colors.none                , styles.NONE)
  Group.new("Tag"            , colors.magenta_active    , colors.none                , styles.NONE)
  Group.new("Todo"           , colors.magenta           , colors.none                , styles.bold)
  Group.new("Type"           , colors.magenta_alt       , colors.none                , styles.NONE)
  Group.new("Typedef"        , colors.magenta_alt       , colors.none                , styles.NONE)
  Group.new("Underlined"     , colors.none              , colors.blue_nuanced_bg     , styles.underline)
  Group.new('Type'           , colors.magenta_alt       , colors.none)
else
  Group.new('Function'       , colors.magenta_faint           , colors.none)
  Group.new('Warning'        , colors.yellow_alt_faint        , colors.none)
  Group.new('Boolean'        , colors.blue_faint              , colors.none                , styles.bold)
  Group.new('Character'      , colors.blue_alt_faint          , colors.none)
  Group.new('Conditional'    , colors.magenta_alt_other       , colors.none)
  Group.new('Constant'       , colors.blue_alt_other_faint    , colors.none)
  Group.new('CursorLine'     , colors.bg_hl_line              , colors.none                , styles.NONE)
  Group.new("Directory"      , colors.blue_faint              , colors.none                , styles.none)
  Group.new("Exception"      , colors.magenta_alt_other_faint , colors.none                , styles.NONE)
  Group.new("Identifier"     , colors.blue_alt_other_faint    , colors.none                , styles.NONE)
  Group.new("Include"        , colors.red_alt_other_faint     , colors.none                , styles.NONE)
  Group.new('Keyword'        , colors.magenta_alt_other_faint , colors.none)
  Group.new("Label"          , colors.cyan_faint              , colors.none                , styles.NONE)
  Group.new('PreProc'        , colors.red_alt_other_faint     , colors.none)
  Group.new("Repeat"         , colors.magenta_alt_other_faint , colors.none                , styles.NONE)
  Group.new("SpecialChar"    , colors.blue_alt_other_faint    , colors.none                , styles.NONE)
  Group.new("Statement"      , colors.magenta_alt_other_faint , colors.none                , styles.NONE)
  Group.new("StorageClass"   , colors.magenta_alt_other_faint , colors.none                , styles.NONE)
  Group.new("String"         , colors.blue_alt_faint          , colors.none                , styles.NONE)
  Group.new("Structure"      , colors.magenta_alt_other_faint , colors.none                , styles.NONE)
  Group.new("Tag"            , colors.magenta_active          , colors.none                , styles.NONE)
  Group.new("Todo"           , colors.magenta_faint           , colors.none                , styles.bold)
  Group.new("Type"           , colors.magenta_alt_faint       , colors.none                , styles.NONE)
  Group.new("Typedef"        , colors.magenta_alt_faint       , colors.none                , styles.NONE)
  Group.new("Underlined"     , colors.none                    , colors.blue_nuanced_bg     , styles.underline)
  Group.new('Type'           , colors.magenta_alt_faint       , colors.none)
end
-- }}}

-- Parenthesis {{{
Group.new('MatchParen' , colors.fg     , colors.bg_paren_match)
Group.new('Number'     , colors.fg     , colors.none)
Group.new("Operator"   , groups.Normal , colors.none            , styles.NONE)

-- Completion(Pmenu)
Group.new('Pmenu'      , colors.fg_active , colors.bg_active)
Group.new('PmenuSel'   , colors.fg_dim    , colors.bg_dim)
Group.new('PmenuSbar'  , colors.none      , colors.bg_inactive)
Group.new('PmenuThumb' , colors.none      , colors.fg)


-- Statusline
Group.new('StatusLine'   , colors.fg_alt            , colors.bg_active)
Group.new('StatusLineNC' , colors.bg_region         , colors.bg_active)


-- Line Numbers
Group.new('LineNr'       , colors.fg_alt    , colors.bg_dim)
Group.new('CursorLineNr' , colors.fg_active , colors.bg_active    , styles.bold)
Group.new('CursorLine'   , colors.none      , colors.bg_inactive)
Group.new('SignColumn'   , colors.none      , colors.bg_inactive)
Group.new('VertSplit'    , colors.fg        , colors.none)

-- Lua
Group.new('luaConstant'     , groups.Constant  , colors.none  , styles.bold)
Group.new('luaStatement'    , groups.Statement , colors.none)
Group.new('luafunctioncall' , groups.Function  , colors.none)
Group.new('luaemmyfluff'    , groups.Comment   , colors.none)
Group.new('luaTodo'         , groups.Todo      , colors.none  , styles.bold)

if vim.g.modus_faint_syntax == 0 then
  Group.new('luaVarName'  , colors.cyan       , colors.none)
else
  Group.new('luaVarName'  , colors.cyan_faint , colors.none)
end

Group.new('luaTableConstructor' , groups.Typedef , colors.none)

-- Python
Group.new('pythonoperator'  , groups.Operator , groups.Operator , styles.none)
-- }}}

-- vim/nvim {{{
Group.new('vimcommand'       , groups.Statement   , colors.none)
Group.new('vimLet'           , groups.vimcommand  , colors.none)
Group.new('vimFuncVar'       , groups.identifier  , colors.none)
Group.new('vimCommentTitle'  , groups.PreProc     , colors.none)
Group.new('vimIsCommand'     , colors.none        , colors.none)
Group.new('vimFuncSID'       , groups.Special     , colors.none)
Group.new('vimCommentString' , groups.Comment     , colors.none)
Group.new('vimMapModKey'     , groups.vimFuncSID  , colors.none)
Group.new('vimMapLhs'        , colors.none        , colors.none)
Group.new('vimNotation'      , colors.fg          , colors.none)
Group.new('vimBracket'       , groups.Delimiter   , colors.none)
Group.new('vimMap'           , groups.vimcommand  , colors.none)
Group.new('vimnotfunc'       , groups.Conditional , colors.none)
Group.new('nvimMap'          , groups.vimMap      , colors.none)

if vim.g.modus_faint_syntax == 0 then
  Group.new('NvimPlainAssignment' , colors.magenta_alt , colors.none)
  Group.new('NvimIdentifier'      , colors.cyan_alt    , colors.none)
else
  Group.new('NvimPlainAssignment' , colors.magenta_alt_faint , colors.none)
  Group.new('NvimIdentifier'      , colors.cyan_alt_faint    , colors.none)
end

--- }}}

-- Diff {{{
Group.new("DiffAdd"    , colors.fg_diff_added   , colors.bg_diff_added          , styles.none)
Group.new("DiffChange" , colors.fg_diff_changed , colors.bg_diff_changed        , styles.none)
Group.new("DiffDelete" , colors.fg_diff_removed , colors.bg_diff_removed        , styles.none)
Group.new("DiffText"   , colors.fg_diff_changed , colors.bg_diff_changed , styles.none)

-- built_in LSP
Group.new("lspdiagnosticswarning"     , colors.yellow_active , colors.bg_active , styles.NONE)
Group.new("lspdiagnosticserror"       , colors.red_active      , colors.bg_active , styles.NONE)
Group.new("lspdiagnosticshint"        , colors.green_active    , colors.bg_active , styles.NONE)
Group.new("LSPDiagnosticsInformation" , colors.blue_active     , colors.bg_active , styles.NONE)

-- Spellings
Group.new("SpellBad" , colors.fg_lang_error , colors.none , styles.none)
Group.new("SpellCap" , colors.fg_lang_error , colors.none , styles.none)

-- }}}

-- Markdown {{{
--[[Not using the underline as I have not figured out how to apply it correctly]]--

Group.new("markdownh1"                 , colors.fg              , colors.magenta_nuanced_bg , styles.bold)
Group.new("markdownh2"                 , colors.fg_special_warm , colors.red_nuanced_bg     , styles.bold)
Group.new("markdownh3"                 , colors.fg_special_cold , colors.blue_nuanced_bg    , styles.bold)
Group.new("markdownh4"                 , colors.fg_special_mild , colors.cyan_nuanced_bg    , styles.bold)
Group.new("markdownh5"                 , colors.fg_special_calm , colors.none               , styles.bold)
Group.new("markdownh6"                 , colors.yellow_nuanced  , colors.none               , styles.bold)
Group.new("markdownRule"               , groups.markdownH2      , colors.none               , styles.bold)
Group.new("markdownItalic"             , colors.fg_special_cold , colors.none               , styles.italic)
Group.new("markdownBold"               , colors.fg              , colors.none               , styles.bold)
Group.new("markdownBoldItalic"         , colors.fg              , colors.none               , styles.bold + styles.italic)
Group.new("markdownCodeDelimiter"      , colors.green_alt_other , colors.none               , styles.bold)
Group.new("markdownCode"               , colors.fg_special_mild , colors.bg_dim             , styles.none)
Group.new("markdownCodeBlock"          , colors.fg_special_mild , colors.bg_dim             , styles.none)
Group.new("markdownFootnoteDefinition" , colors.fg              , colors.none               , styles.italic)
Group.new("markdownListMarker"         , colors.fg_alt          , colors.none               , styles.bold)
Group.new("markdownLineBreak"          , colors.cyan_refine_fg  , colors.cyan_refine_bg     , styles.underline)

if vim.g.modus_faint_syntax == 0 then
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

-- }}}

-- TreeSitter

Group.new("TSError"              , groups.Error                    , groups.Error        , styles.bold)
Group.new("TSPunctDelimiter"     , colors.fg                       , colors.bg)
Group.new("TSPunctBracket"       , colors.fg                       , colors.bg)
Group.new("TSConstant"           , groups.Constant                 , groups.Constant)
Group.new("TSConstBuiltin"       , groups.Constant                 , groups.Constant)
Group.new("TSConstMacro"         , groups.Constant                 , groups.Constant)
Group.new("TSString"             , groups.String                   , groups.String)
Group.new("TSStringRegex"        , colors.fg_escape_char_construct , colors.none)
Group.new("TSStringEscape"       , colors.fg_escape_char_backslash , colors.none)
Group.new("TSCharacter"          , groups.Character                , groups.Character)
Group.new("TSNumber"             , groups.Number                   , groups.Number)
Group.new("TSBoolean"            , groups.Boolean                  , groups.Boolean)
Group.new("TSFloat"              , groups.Number                   , groups.Number)
Group.new("TSFunction"           , groups.Function                 , groups.Function)
Group.new("TSFuncBuiltin"        , groups.Function                 , groups.Function)
Group.new("TSFuncMacro"          , groups.Function                 , groups.Function)

if vim.g.modus_faint_syntax == 0 then
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

Group.new("TSParameterReference" , groups.TSParameter     , groups.TSParameter)
Group.new("TSMethod"             , groups.Function        , groups.Function)
Group.new("TSConditional"        , groups.Conditional     , groups.Conditional)
Group.new("TSRepeat"             , groups.Repeat          , groups.Repeat)
Group.new("TSLabel"              , groups.Label           , groups.Label)
Group.new("TSOperator"           , groups.Operator        , groups.Operator)
Group.new("TSKeyword"            , groups.Keyword         , groups.Keyword)
Group.new("TSException"          , groups.Exception       , groups.Exception)
Group.new("TSType"               , groups.Type            , groups.Type         , styles.none)
Group.new("TSTypeBuiltin"        , groups.Type            , groups.Type         , styles.none)
Group.new("TSStructure"          , groups.Structure       , groups.Structure)
Group.new("TSInclude"            , groups.Include         , groups.Include)
Group.new("TSAnnotation"         , colors.blue_nuanced_bg , colors.none)
Group.new("TSStrong"             , colors.fg              , colors.bg           , styles.bold)
Group.new("TSTitle"              , colors.cyan_nuanced    , colors.none)
