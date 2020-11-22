--[[
--Note that the colorscheme set for markdown here conflicts with the plasticboy-markdown plugin
--The pandoc syntax also conflicts with it.
]]--

-- vim: fdm=marker

-- This only works on 0.5
--[[
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.api.nvim_command('syntax reset')
end
vim.o.bg = 'light'
vim.g.colors_name = 'modus-operandi'

-- Set the faint off by default
local flag = vim.fn.exists('g:modus_faint_syntax')
if flag == 0 then
  vim.api.nvim_set_var('modus_faint_syntax', 0)
end
--]]

local faint = vim.api.nvim_get_var('modus_faint_syntax')

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new("bg"     , "#ffffff")
Color.new("fg"     , "#000000")
Color.new("bg_alt" , "#f0f0f0")
Color.new("fg_alt" , "#505050")
Color.new("bg_dim" , "#f8f8f8")
Color.new("fg_dim" , "#282828")

-- specifically for on/off states (e.g. `statusline`)
--
-- must be combined with themselves

Color.new("bg_active"   , "#d7d7d7")
Color.new("fg_active"   , "#0a0a0a")
Color.new("bg_inactive" , "#efefef")
Color.new("fg_inactive" , "#404148")

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg,bg}_{alt,dim}

Color.new("bg_special_cold" , "#dde3f4")
Color.new("fg_special_cold" , "#093060")
Color.new("bg_special_mild" , "#c4ede0")
Color.new("fg_special_mild" , "#184034")
Color.new("bg_special_warm" , "#f0e0d4")
Color.new("fg_special_warm" , "#5d3026")
Color.new("bg_special_calm" , "#f8ddea")
Color.new("fg_special_calm" , "#61284f")

-- styles for the main constructs
--
-- must be combined with: `bg', `bg_alt', `bg_dim'

Color.new("red"     , "#a60000")
Color.new("green"   , "#005e00")
Color.new("yellow"  , "#813e00")
Color.new("blue"    , "#0030a6")
Color.new("magenta" , "#721045")
Color.new("cyan"    , "#00538b")

-- styles for common, but still specialised constructs
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt"     , "#972500")
Color.new("green_alt"   , "#315b00")
Color.new("yellow_alt"  , "#70480f")
Color.new("blue_alt"    , "#223fbf")
Color.new("magenta_alt" , "#8f0075")
Color.new("cyan_alt"    , "#30517f")

-- same purpose as above, just slight differences
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt_other"     , "#a0132f")
Color.new("green_alt_other"   , "#145c33")
Color.new("yellow_alt_other"  , "#863927")
Color.new("blue_alt_other"    , "#0000bb")
Color.new("magenta_alt_other" , "#5317ac")
Color.new("cyan_alt_other"    , "#005a5f")

-- styles for desaturated foreground text, intended for use with
-- the `modus_operandi_theme_faint_syntax' option
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_faint"     , "#7f1010")
Color.new("green_faint"   , "#104410")
Color.new("yellow_faint"  , "#5f4400")
Color.new("blue_faint"    , "#002f88")
Color.new("magenta_faint" , "#752f50")
Color.new("cyan_faint"    , "#12506f")

Color.new("red_alt_faint"     , "#702f00")
Color.new("green_alt_faint"   , "#30440f")
Color.new("yellow_alt_faint"  , "#5d5000")
Color.new("blue_alt_faint"    , "#003f78")
Color.new("magenta_alt_faint" , "#702565")
Color.new("cyan_alt_faint"    , "#354f6f")

Color.new("red_alt_other_faint"     , "#7f002f")
Color.new("green_alt_other_faint"   , "#0f443f")
Color.new("yellow_alt_other_faint"  , "#5e3a20")
Color.new("blue_alt_other_faint"    , "#1f2f6f")
Color.new("magenta_alt_other_faint" , "#5f3f7f")
Color.new("cyan_alt_other_faint"    , "#2e584f")

-- styles for elements that should be very subtle, yet accented
--
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds

Color.new("red_nuanced"     , "#5f0000")
Color.new("green_nuanced"   , "#004000")
Color.new("yellow_nuanced"  , "#3f3000")
Color.new("blue_nuanced"    , "#201f55")
Color.new("magenta_nuanced" , "#541f4f")
Color.new("cyan_nuanced"    , "#0f3360")

-- styles for slightly accented background
--
-- must be combined with any of the above foreground values

Color.new("red_nuanced_bg"     , "#fff1f0")
Color.new("green_nuanced_bg"   , "#ecf7ed")
Color.new("yellow_nuanced_bg"  , "#fff3da")
Color.new("blue_nuanced_bg"    , "#f3f3ff")
Color.new("magenta_nuanced_bg" , "#fdf0ff")
Color.new("cyan_nuanced_bg"    , "#ebf6fa")

-- styles for elements that should draw attention to themselves
--
-- must be combined with: `bg_main'

Color.new("red_intense"     , "#b60000")
Color.new("green_intense"   , "#006800")
Color.new("yellow_intense"  , "#904200")
Color.new("blue_intense"    , "#1111ee")
Color.new("magenta_intense" , "#7000e0")
Color.new("cyan_intense"    , "#205b93")

-- styles for background elements that should be visible yet
-- subtle
--
-- must be combined with: `fg_dim'

Color.new("red_subtle_bg"     , "#f2b0a2")
Color.new("green_subtle_bg"   , "#aecf90")
Color.new("yellow_subtle_bg"  , "#e4c340")
Color.new("blue_subtle_bg"    , "#b5d0ff")
Color.new("magenta_subtle_bg" , "#f0d3ff")
Color.new("cyan_subtle_bg"    , "#c0efff")

-- styles for background elements that should be visible and
-- distinguishable
--
-- must be combined with: `fg_main'

Color.new("red_intense_bg"     , "#ff8892")
Color.new("green_intense_bg"   , "#5ada88")
Color.new("yellow_intense_bg"  , "#f5df23")
Color.new("blue_intense_bg"    , "#6aaeff")
Color.new("magenta_intense_bg" , "#d5baff")
Color.new("cyan_intense_bg"    , "#42cbd4")

-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
--
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds

Color.new("red_refine_bg"     , "#ffcccc")
Color.new("red_refine_fg"     , "#780000")
Color.new("green_refine_bg"   , "#aceaac")
Color.new("green_refine_fg"   , "#004c00")
Color.new("yellow_refine_bg"  , "#fff29a")
Color.new("yellow_refine_fg"  , "#604000")
Color.new("blue_refine_bg"    , "#8ac7ff")
Color.new("blue_refine_fg"    , "#002288")
Color.new("magenta_refine_bg" , "#ffccff")
Color.new("magenta_refine_fg" , "#770077")
Color.new("cyan_refine_bg"    , "#8eecf4")
Color.new("cyan_refine_fg"    , "#004850")

-- styles that are meant exclusively for the statusline
--
-- must be combined with: `bg_active', `bg_inactive'

Color.new("red_active"     , "#930000")
Color.new("green_active"   , "#005300")
Color.new("yellow_active"  , "#703700")
Color.new("blue_active"    , "#0033c0")
Color.new("magenta_active" , "#6320a0")
Color.new("cyan_active"    , "#004882")

-- styles that are meant exclusively for the fringes
--
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'

Color.new("red_fringe_bg"     , "#ff9a9a")
Color.new("green_fringe_bg"   , "#86cf86")
Color.new("yellow_fringe_bg"  , "#e0c050")
Color.new("blue_fringe_bg"    , "#82afff")
Color.new("magenta_fringe_bg" , "#f0a3ff")
Color.new("cyan_fringe_bg"    , "#00d6e0")


-- styles reserved for specific faces
--
-- `bg_hl_line' is between `bg_dim' and `bg_alt' , so it should
-- work with all accents that cover those two, plus `bg_main'
--
-- `bg_header' is between `bg_active' and `bg_inactive', so it
-- can be combined with any of the "active" values, plus the
-- "special" and base foreground colours
--
-- `bg_paren_match', `bg_paren_match_intense' , `bg_region' and
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

--- {{{1
Color.new("bg_hl_line"             , "#f2eff3")
Color.new("bg_paren_match"         , "#e0af82")
Color.new("bg_paren_match_intense" , "#70af9f")
Color.new("bg_region"              , "#bcbcbc")

Color.new("bg_tab_bar"      , "#d5d5d5")
Color.new("bg_tab_active"   , "#f6f6f6")
Color.new("bg_tab_inactive" , "#bdbdbd")
Color.new("fg_tab_active"   , "#30169e")

Color.new("fg_escape_char_construct" , "#8b1030")
Color.new("fg_escape_char_backslash" , "#654d0f")

Color.new("fg_lang_error"   , "#9f004f")
Color.new("fg_lang_warning" , "#604f0f")
Color.new("fg_lang_note"    , "#4040ae")

Color.new("fg_window_divider_inner" , "#888888")
Color.new("fg_window_divider_outer" , "#585858")

Color.new("fg_unfocused" , "#56576d")

Color.new("bg_header" , "#e5e5e5")
Color.new("fg_header" , "#2a2a2a")

Color.new("bg_whitespace" , "#fff8fc")
Color.new("fg_whitespace" , "#645060")

Color.new("bg_diff_heading" , "#b7c2dd")
Color.new("fg_diff_heading" , "#043355")
Color.new("bg_diff_added"   , "#d4fad4")
Color.new("fg_diff_added"   , "#004500")
Color.new("bg_diff_changed" , "#fcefcf")
Color.new("fg_diff_changed" , "#524200")
Color.new("bg_diff_removed" , "#ffe8ef")
Color.new("fg_diff_removed" , "#691616")

-- Will add this if I find a plugin
-- Color.new("bg_diff_focus_added" , "#bbeabb")
-- Color.new("fg_diff_focus_added" , "#002c00")
-- Color.new("bg_diff_focus_changed" , "#ecdfbf")
-- Color.new("fg_diff_focus_changed" , "#392900")
-- Color.new("bg_diff_focus_removed" , "#efcbcf")
-- Color.new("fg_diff_focus_removed" , "#4a0000")

Color.new("bg_mark_sel" , "#a0f0cf")
Color.new("fg_mark_sel" , "#005040")
Color.new("bg_mark_del" , "#ffccbb")
Color.new("fg_mark_del" , "#840040")
Color.new("bg_mark_alt" , "#f5d88f")
Color.new("fg_mark_alt" , "#782900")

-- }}}

-- base colors {{{
Group.new('Normal'         , colors.fg              , colors.bg)
Group.new('NormalNC'       , colors.fg_inactive     , colors.bg_inactive)
Group.new('Folded'         , colors.fg_special_mild , colors.bg_special_mild     , styles.none)
Group.new('Error'          , colors.fg              , colors.red_intense_bg      , styles.bold)
Group.new('ErrorMsg'       , colors.fg              , colors.red_intense_bg)
Group.new('Comment'        , colors.fg_alt          , colors.none                , styles.italic)
Group.new('Conceal'        , colors.fg_special_warm , colors.bg_dim              , styles.bold)
Group.new('Cursor'         , groups.Normal.bg       , groups.Normal.fg           , styles.NONE)
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

if faint == 0 then
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
  Group.new('Conditional'    , colors.magenta_alt_other_faint , colors.none)
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
Group.new('StatusLine'   , colors.bg          , colors.blue_active)
Group.new('StatusLineNC' , colors.fg_inactive , colors.bg)


-- Line Numbers
Group.new('LineNr'       , colors.fg_alt    , colors.bg_dim)
Group.new('CursorLineNr' , colors.fg_active , colors.bg_active    , styles.bold)
Group.new('CursorLine'   , colors.none      , colors.bg_inactive)
Group.new('SignColumn'   , colors.none      , colors.bg_inactive)
Group.new('VertSplit'    , colors.fg        , colors.none)

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

if faint == 0 then
  Group.new('NvimPlainAssignment' , colors.magenta_alt , colors.none)
  Group.new('NvimIdentifier'      , colors.cyan_alt    , colors.none)
  Group.new('vimVar'              , colors.cyan        , colors.none)
else
  Group.new('NvimPlainAssignment' , colors.magenta_alt_faint , colors.none)
  Group.new('NvimIdentifier'      , colors.cyan_alt_faint    , colors.none)
  Group.new('vimVar'              , colors.cyan_faint        , colors.none)
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

-- }}}

-- Nix
Group.new("nixAttributeDefinition" , groups.Label      , groups.Label      , styles.none)
Group.new("nixAttribute"           , groups.Identifier , groups.Identifier , styles.none)
Group.new("nixFunctionCall"        , groups.Function   , groups.Function   , styles.none)


-- TreeSitter

Group.new("TSError"          , groups.Error                    , groups.Error     , styles.bold)
Group.new("TSPunctDelimiter" , colors.fg                       , colors.bg)
Group.new("TSPunctBracket"   , colors.fg                       , colors.bg)
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
Group.new("TSStrong"             , colors.fg              , colors.bg          , styles.bold)
Group.new("TSTitle"              , colors.cyan_nuanced    , colors.none)


-- Telescope
Group.new("TelescopeMatching" , colors.fg , colors.green_intense_bg , styles.bold)

-- Startify
Group.new("StartifyHeader"  , colors.fg_special_cold , colors.none , styles.bold)
Group.new("StartifySpecial" , colors.fg_special_warm , colors.none , styles.bold)
Group.new("StartifySection" , colors.fg_special_warm , colors.none , styles.bold)
Group.new("StartifyPath"    , colors.fg              , colors.none , styles.none)
Group.new("StartifyFile"    , colors.fg              , colors.none , styles.none)
Group.new("StartifyBracket" , colors.fg              , colors.none , styles.none)
Group.new("StartifySlash"   , colors.fg              , colors.none , styles.none)
Group.new("StartifyFooter"  , colors.fg_special_mild , colors.none , styles.none)

-- Galaxyline
require('galaxyline.moody')
