local Color,colors, Group, groups, styles = require("colorbuddy").setup()
local dark_palette = {

    bg_main     = "#000000",
    fg_main     = "#ffffff",
    bg_alt = "#181a20",
    fg_alt = "#a8a8a8",
    bg_dim = "#110b11",
    fg_dim = "#e0e6f0",

    bg_active   = "#2f2f2f",
    fg_active   = "#f5f5f5",
    bg_inactive = "#202020",
    fg_inactive = "#bebebe",

    bg_special_cold = "#203448",
    fg_special_cold = "#c6eaff",
    bg_special_mild = "#00322e",
    fg_special_mild = "#bfebe0",
    bg_special_warm = "#382f27",
    fg_special_warm = "#f8dec0",
    bg_special_calm = "#392a48",
    fg_special_calm = "#fbd6f4",

    red     = "#ff8059",
    green   = "#44bc44",
    yellow  = "#eecc00",
    blue    = "#29aeff",
    magenta = "#feacd0",
    cyan    = "#00d3d0",

    red_alt     = "#f4923b",
    green_alt   = "#80d200",
    yellow_alt  = "#cfdf30",
    blue_alt    = "#72a4ff",
    magenta_alt = "#f78fe7",
    cyan_alt    = "#4ae8fc",

    red_alt_other     = "#ff9977",
    green_alt_other   = "#00cd68",
    yellow_alt_other  = "#f0ce43",
    blue_alt_other    = "#00bdfa",
    magenta_alt_other = "#b6a0ff",
    cyan_alt_other    = "#6ae4b9",

    red_faint               = "#ffa0a0",
    green_faint             = "#88cf88",
    yellow_faint            = "#d2b580",
    blue_faint              = "#92baff",
    magenta_faint           = "#e0b2d6",
    cyan_faint              = "#a0bfdf",

    red_alt_faint           = "#f5aa80",
    green_alt_faint         = "#a8cf88",
    yellow_alt_faint        = "#cabf77",
    blue_alt_faint          = "#a4b0ff",
    magenta_alt_faint       = "#ef9fe4",
    cyan_alt_faint          = "#90c4ed",

    red_alt_other_faint     = "#ff9fbf",
    green_alt_other_faint   = "#88cfaf",
    yellow_alt_other_faint  = "#d0ba95",
    blue_alt_other_faint    = "#8fc5ff",
    magenta_alt_other_faint = "#d0b4ff",
    cyan_alt_other_faint    = "#a4d0bb",

    red_nuanced     = "#ffcccc",
    green_nuanced   = "#b8e2b8",
    yellow_nuanced  = "#dfdfb0",
    blue_nuanced    = "#bfd9ff",
    magenta_nuanced = "#e5cfef",
    cyan_nuanced    = "#a8e5e5",

    red_nuanced_bg     = "#2c0614",
    green_nuanced_bg   = "#001904",
    yellow_nuanced_bg  = "#221000",
    blue_nuanced_bg    = "#0f0e39",
    magenta_nuanced_bg = "#230631",
    cyan_nuanced_bg    = "#041529",

    red_intense     = "#fb6859",
    green_intense   = "#00fc50",
    yellow_intense  = "#ffdd00",
    blue_intense    = "#00a2ff",
    magenta_intense = "#ff8bd4",
    cyan_intense    = "#30ffc0",

    red_subtle_bg     = "#762422",
    green_subtle_bg   = "#2f4a00",
    yellow_subtle_bg  = "#604200",
    blue_subtle_bg    = "#10387c",
    magenta_subtle_bg = "#49366e",
    cyan_subtle_bg    = "#00415e",

    red_intense_bg     = "#a4202a",
    green_intense_bg   = "#006800",
    yellow_intense_bg  = "#874900",
    blue_intense_bg    = "#2a40b8",
    magenta_intense_bg = "#7042a2",
    cyan_intense_bg    = "#005f88",

    red_refine_bg     = "#77002a",
    red_refine_fg     = "#ffb9ab",
    green_refine_bg   = "#00422a",
    green_refine_fg   = "#9ff0cf",
    yellow_refine_bg  = "#693200",
    yellow_refine_fg  = "#e2d980",
    blue_refine_bg    = "#242679",
    blue_refine_fg    = "#8ec6ff",
    magenta_refine_bg = "#71206a",
    magenta_refine_fg = "#ffcaf0",
    cyan_refine_bg    = "#004065",
    cyan_refine_fg    = "#8ae4f2",

    red_active     = "#ffa49e",
    green_active   = "#70e030",
    yellow_active  = "#efdf00",
    blue_active    = "#00ccff",
    magenta_active = "#d0acff",
    cyan_active    = "#00ddc0",

    red_fringe_bg     = "#8f0040",
    green_fringe_bg   = "#006000",
    yellow_fringe_bg  = "#6f4a00",
    blue_fringe_bg    = "#3a30ab",
    magenta_fringe_bg = "#692089",
    cyan_fringe_bg    = "#0068a0",

    bg_hl_line             = "#151823",
    bg_paren_match         = "#5f362f",
    bg_paren_match_intense = "#255650",
    bg_region              = "#3c3c3c",

    bg_tab_bar      = "#2c2c2c",
    bg_tab_active   = "#0e0e0e",
    bg_tab_inactive = "#3d3d3d",
    fg_tab_active   = "#5ac3cf",

    fg_escape_char_construct = "#e7a59a",
    fg_escape_char_backslash = "#abab00",

    fg_lang_error   = "#ef8690",
    fg_lang_warning = "#b0aa00",
    fg_lang_note    = "#9d9def",

    fg_window_divider_inner = "#646464",
    fg_window_divider_outer = "#969696",

    fg_unfocused = "#93959b",

    bg_header = "#212121",
    fg_header = "#dddddd",

    bg_whitespace = "#170016",
    fg_whitespace = "#a4959f",

    bg_diff_heading = "#304466",
    fg_diff_heading = "#dadffe",
    bg_diff_added   = "#0a280a",
    fg_diff_added   = "#94ba94",
    bg_diff_changed = "#2a2000",
    fg_diff_changed = "#b0ba9f",
    bg_diff_removed = "#40160f",
    fg_diff_removed = "#c6adaa",

    bg_mark_sel = "#002f2f",
    fg_mark_sel = "#60cfa2",
    bg_mark_del = "#5a0000",
    fg_mark_del = "#ff99aa",
    bg_mark_alt = "#3f2210",
    fg_mark_alt = "#f0aa20",
}

Color.new("bg_main" , dark_palette.bg_main)
Color.new("fg_main" , dark_palette.fg_main)
Color.new("bg_alt"  , dark_palette.bg_alt)
Color.new("fg_alt"  , dark_palette.fg_alt)
Color.new("bg_dim"  , dark_palette.bg_dim)
Color.new("fg_dim"  , dark_palette.fg_dim)

-- specifically for on/off states (e.g. `statusline`)
-- must be combined with themselves

Color.new("bg_active"   , dark_palette.bg_active)
Color.new("fg_active"   , dark_palette.fg_active)
Color.new("bg_inactive" , dark_palette.bg_inactive)
Color.new("fg_inactive" , dark_palette.fg_inactive)

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg_main,bg_main}_{alt,dim}

Color.new("bg_special_cold" , dark_palette.bg_special_cold)
Color.new("fg_special_cold" , dark_palette.fg_special_cold)
Color.new("bg_special_mild" , dark_palette.bg_special_mild)
Color.new("fg_special_mild" , dark_palette.fg_special_mild)
Color.new("bg_special_warm" , dark_palette.bg_special_warm)
Color.new("fg_special_warm" , dark_palette.fg_special_warm)
Color.new("bg_special_calm" , dark_palette.bg_special_calm)
Color.new("fg_special_calm" , dark_palette.fg_special_calm)

-- styles for the main constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red"     , dark_palette.red)
Color.new("green"   , dark_palette.green)
Color.new("yellow"  , dark_palette.yellow)
Color.new("blue"    , dark_palette.blue)
Color.new("magenta" , dark_palette.magenta)
Color.new("cyan"    , dark_palette.cyan)

-- styles for common, but still specialised constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt"     , dark_palette.red_alt)
Color.new("green_alt"   , dark_palette.green_alt)
Color.new("yellow_alt"  , dark_palette.yellow_alt)
Color.new("blue_alt"    , dark_palette.blue_alt)
Color.new("magenta_alt" , dark_palette.magenta_alt)
Color.new("cyan_alt"    , dark_palette.cyan_alt)

-- same purpose as above, just slight differences
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt_other"     , dark_palette.red_alt_other)
Color.new("green_alt_other"   , dark_palette.green_alt_other)
Color.new("yellow_alt_other"  , dark_palette.yellow_alt_other)
Color.new("blue_alt_other"    , dark_palette.blue_alt_other)
Color.new("magenta_alt_other" , dark_palette.magenta_alt_other)
Color.new("cyan_alt_other"    , dark_palette.cyan_alt_other)

-- styles for desaturated foreground text, intended for use with
-- the `modus_operandi_theme_faint_syntax' option
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_faint"     , dark_palette.red_faint)
Color.new("green_faint"   , dark_palette.green_faint)
Color.new("yellow_faint"  , dark_palette.yellow_faint)
Color.new("blue_faint"    , dark_palette.blue_faint)
Color.new("magenta_faint" , dark_palette.magenta_faint)
Color.new("cyan_faint"    , dark_palette.cyan_faint)

Color.new("red_alt_faint"     , dark_palette.red_alt_faint)
Color.new("green_alt_faint"   , dark_palette.green_alt_faint)
Color.new("yellow_alt_faint"  , dark_palette.yellow_alt_faint)
Color.new("blue_alt_faint"    , dark_palette.blue_alt_faint)
Color.new("magenta_alt_faint" , dark_palette.magenta_alt_faint)
Color.new("cyan_alt_faint"    , dark_palette.cyan_alt_faint)

Color.new("red_alt_other_faint"     , dark_palette.red_alt_other_faint)
Color.new("green_alt_other_faint"   , dark_palette.green_alt_other_faint)
Color.new("yellow_alt_other_faint"  , dark_palette.yellow_alt_other_faint)
Color.new("blue_alt_other_faint"    , dark_palette.blue_alt_other_faint)
Color.new("magenta_alt_other_faint" , dark_palette.magenta_alt_other_faint)
Color.new("cyan_alt_other_faint"    , dark_palette.cyan_alt_other_faint)

-- styles for elements that should be very subtle, yet accented
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds

Color.new("red_nuanced"     , dark_palette.red_nuanced)
Color.new("green_nuanced"   , dark_palette.green_nuanced)
Color.new("yellow_nuanced"  , dark_palette.yellow_nuanced)
Color.new("blue_nuanced"    , dark_palette.blue_nuanced)
Color.new("magenta_nuanced" , dark_palette.magenta_nuanced)
Color.new("cyan_nuanced"    , dark_palette.cyan_nuanced)

-- styles for slightly accented background
-- must be combined with any of the above foreground values

Color.new("red_nuanced_bg"     , dark_palette.red_nuanced_bg)
Color.new("green_nuanced_bg"   , dark_palette.green_nuanced_bg)
Color.new("yellow_nuanced_bg"  , dark_palette.yellow_nuanced_bg)
Color.new("blue_nuanced_bg"    , dark_palette.blue_nuanced_bg)
Color.new("magenta_nuanced_bg" , dark_palette.magenta_nuanced_bg)
Color.new("cyan_nuanced_bg"    , dark_palette.cyan_nuanced_bg)

-- styles for elements that should draw attention to themselves
-- must be combined with: `bg_main'

Color.new("red_intense"     , dark_palette.red_intense)
Color.new("green_intense"   , dark_palette.green_intense)
Color.new("yellow_intense"  , dark_palette.yellow_intense)
Color.new("blue_intense"    , dark_palette.blue_intense)
Color.new("magenta_intense" , dark_palette.magenta_intense)
Color.new("cyan_intense"    , dark_palette.cyan_intense)

-- styles for background elements that should be visible yet
-- subtle
-- must be combined with: `fg_dim'

Color.new("red_subtle_bg"     , dark_palette.red_subtle_bg)
Color.new("green_subtle_bg"   , dark_palette.green_subtle_bg)
Color.new("yellow_subtle_bg"  , dark_palette.yellow_subtle_bg)
Color.new("blue_subtle_bg"    , dark_palette.blue_subtle_bg)
Color.new("magenta_subtle_bg" , dark_palette.magenta_subtle_bg)
Color.new("cyan_subtle_bg"    , dark_palette.cyan_subtle_bg)

-- styles for background elements that should be visible and
-- distinguishable
-- must be combined with: `fg_main'

Color.new("red_intense_bg"     , dark_palette.red_intense_bg)
Color.new("green_intense_bg"   , dark_palette.green_intense_bg)
Color.new("yellow_intense_bg"  , dark_palette.yellow_intense_bg)
Color.new("blue_intense_bg"    , dark_palette.blue_intense_bg)
Color.new("magenta_intense_bg" , dark_palette.magenta_intense_bg)
Color.new("cyan_intense_bg"    , dark_palette.cyan_intense_bg)

-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds

Color.new("red_refine_bg"     , dark_palette.red_refine_bg)
Color.new("red_refine_fg"     , dark_palette.red_refine_fg)
Color.new("green_refine_bg"   , dark_palette.green_refine_bg)
Color.new("green_refine_fg"   , dark_palette.green_refine_fg)
Color.new("yellow_refine_bg"  , dark_palette.yellow_refine_bg)
Color.new("yellow_refine_fg"  , dark_palette.yellow_refine_fg)
Color.new("blue_refine_bg"    , dark_palette.blue_refine_bg)
Color.new("blue_refine_fg"    , dark_palette.blue_refine_fg)
Color.new("magenta_refine_bg" , dark_palette.magenta_refine_bg)
Color.new("magenta_refine_fg" , dark_palette.magenta_refine_fg)
Color.new("cyan_refine_bg"    , dark_palette.cyan_refine_bg)
Color.new("cyan_refine_fg"    , dark_palette.cyan_refine_fg)

-- styles that are meant exclusively for the statusline
-- must be combined with: `bg_active', `bg_inactive'

Color.new("red_active"     , dark_palette.red_active)
Color.new("green_active"   , dark_palette.green_active)
Color.new("yellow_active"  , dark_palette.yellow_active)
Color.new("blue_active"    , dark_palette.blue_active)
Color.new("magenta_active" , dark_palette.magenta_active)
Color.new("cyan_active"    , dark_palette.cyan_active)

-- styles that are meant exclusively for the fringes
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'

Color.new("red_fringe_bg"     , dark_palette.red_fringe_bg)
Color.new("green_fringe_bg"   , dark_palette.green_fringe_bg)
Color.new("yellow_fringe_bg"  , dark_palette.yellow_fringe_bg)
Color.new("blue_fringe_bg"    , dark_palette.blue_fringe_bg)
Color.new("magenta_fringe_bg" , dark_palette.magenta_fringe_bg)
Color.new("cyan_fringe_bg"    , dark_palette.cyan_fringe_bg)

--[[
styles reserved for specific faces

`bg_hl_line' is between `bg_dim' and `bg_alt' , so it should
work with all accents that cover those two, plus `bg_main'

`bg_header' is between `bg_active' and `bg_inactive', so it
can be combined with any of the "active" values, plus the
"special" and base foreground colours

`bg_paren_match', `bg_paren_match_intense' , `bg_region' and
`bg_tab_active' must be combined with `fg_main', while
`bg_tab_inactive' should be combined with `fg_dim'

`bg_tab_bar' is only intended for the bar that holds the tabs and
can only be combined with `fg_main'

`fg_tab_active' is meant to be combined with `bg_tab_active',
though only for styling special elements, such as underlining
the current tab

`fg_escape_char_construct' and `fg_escape_char_backslash' can
be combined `bg_main', `bg_dim', `bg_alt'

`fg_lang_error', `fg_lang_warning', `fg_lang_note' can be
combined with `bg_main', `bg_dim', `bg_alt'

`fg_mark_sel', `fg_mark_del', `fg_mark_alt' can be combined
with `bg_main', `bg_dim', `bg_alt', `bg_hl_line'

`fg_unfocused' must be combined with `fg_main'

the window divider colours apply to faces with just an fg_main value

all pairs are combinable with themselves
--]]

Color.new("bg_hl_line"             , dark_palette.bg_hl_line)
Color.new("bg_paren_match"         , dark_palette.bg_paren_match)
Color.new("bg_paren_match_intense" , dark_palette.bg_paren_match_intense)
Color.new("bg_region"              , dark_palette.bg_region)

Color.new("bg_tab_bar"      , dark_palette.bg_tab_bar)
Color.new("bg_tab_active"   , dark_palette.bg_tab_active)
Color.new("bg_tab_inactive" , dark_palette.bg_tab_inactive)
Color.new("fg_tab_active"   , dark_palette.fg_tab_active)

Color.new("fg_escape_char_construct" , dark_palette.fg_escape_char_construct)
Color.new("fg_escape_char_backslash" , dark_palette.fg_escape_char_backslash)

Color.new("fg_lang_error"   , dark_palette.fg_lang_error)
Color.new("fg_lang_warning" , dark_palette.fg_lang_warning)
Color.new("fg_lang_note"    , dark_palette.fg_lang_note)

Color.new("fg_window_divider_inner" , dark_palette.fg_window_divider_inner)
Color.new("fg_window_divider_outer" , dark_palette.fg_window_divider_outer)

Color.new("fg_unfocused" , dark_palette.fg_unfocused)

Color.new("bg_header" , dark_palette.bg_header)
Color.new("fg_header" , dark_palette.fg_header)

Color.new("bg_whitespace" , dark_palette.bg_whitespace)
Color.new("fg_whitespace" , dark_palette.fg_whitespace)

Color.new("bg_diff_heading" , dark_palette.bg_diff_heading)
Color.new("fg_diff_heading" , dark_palette.fg_diff_heading)
Color.new("bg_diff_added"   , dark_palette.bg_diff_added)
Color.new("fg_diff_added"   , dark_palette.fg_diff_added)
Color.new("bg_diff_changed" , dark_palette.bg_diff_changed)
Color.new("fg_diff_changed" , dark_palette.fg_diff_changed)
Color.new("bg_diff_removed" , dark_palette.bg_diff_removed)
Color.new("fg_diff_removed" , dark_palette.fg_diff_removed)

Color.new("bg_mark_sel" , dark_palette.bg_mark_sel)
Color.new("fg_mark_sel" , dark_palette.fg_mark_sel)
Color.new("bg_mark_del" , dark_palette.bg_mark_del)
Color.new("fg_mark_del" , dark_palette.fg_mark_del)
Color.new("bg_mark_alt" , dark_palette.bg_mark_alt)
Color.new("fg_mark_alt" , dark_palette.fg_mark_alt)

-- Terminal colors
vim.g.terminal_color_0  = "#555555"
vim.g.terminal_color_8  = "#222222"
vim.g.terminal_color_1  = "#ffa0a0"
vim.g.terminal_color_9  = "#fb6859"
vim.g.terminal_color_2  = "#88cf88"
vim.g.terminal_color_10 = "#00fc50"
vim.g.terminal_color_3  = "#d2b580"
vim.g.terminal_color_11 = "#ffdd00"
vim.g.terminal_color_4  = "#92baff"
vim.g.terminal_color_12 = "#00a2ff"
vim.g.terminal_color_5  = "#e0b2d6"
vim.g.terminal_color_13 = "#ff8bd4"
vim.g.terminal_color_6  = "#a0bfdf"
vim.g.terminal_color_14 = "#30ffc0"
vim.g.terminal_color_7  = "#ffffff"
vim.g.terminal_color_15 = "#dddddd"

require('highlights').init(colors, Group, groups, styles, dark_palette)
