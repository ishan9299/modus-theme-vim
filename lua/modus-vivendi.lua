local Color,colors, Group, groups, styles = require("colorbuddy").setup()
local palette = {

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

Color.new("bg_main" , palette.bg_main)
Color.new("fg_main" , palette.fg_main)
Color.new("bg_alt"  , palette.bg_alt)
Color.new("fg_alt"  , palette.fg_alt)
Color.new("bg_dim"  , palette.bg_dim)
Color.new("fg_dim"  , palette.fg_dim)

-- specifically for on/off states (e.g. `statusline`)
-- must be combined with themselves

Color.new("bg_active"   , palette.bg_active)
Color.new("fg_active"   , palette.fg_active)
Color.new("bg_inactive" , palette.bg_inactive)
Color.new("fg_inactive" , palette.fg_inactive)

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg_main,bg_main}_{alt,dim}

Color.new("bg_special_cold" , palette.bg_special_cold)
Color.new("fg_special_cold" , palette.fg_special_cold)
Color.new("bg_special_mild" , palette.bg_special_mild)
Color.new("fg_special_mild" , palette.fg_special_mild)
Color.new("bg_special_warm" , palette.bg_special_warm)
Color.new("fg_special_warm" , palette.fg_special_warm)
Color.new("bg_special_calm" , palette.bg_special_calm)
Color.new("fg_special_calm" , palette.fg_special_calm)

-- styles for the main constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red"     , palette.red)
Color.new("green"   , palette.green)
Color.new("yellow"  , palette.yellow)
Color.new("blue"    , palette.blue)
Color.new("magenta" , palette.magenta)
Color.new("cyan"    , palette.cyan)

-- styles for common, but still specialised constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt"     , palette.red_alt)
Color.new("green_alt"   , palette.green_alt)
Color.new("yellow_alt"  , palette.yellow_alt)
Color.new("blue_alt"    , palette.blue_alt)
Color.new("magenta_alt" , palette.magenta_alt)
Color.new("cyan_alt"    , palette.cyan_alt)

-- same purpose as above, just slight differences
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt_other"     , palette.red_alt_other)
Color.new("green_alt_other"   , palette.green_alt_other)
Color.new("yellow_alt_other"  , palette.yellow_alt_other)
Color.new("blue_alt_other"    , palette.blue_alt_other)
Color.new("magenta_alt_other" , palette.magenta_alt_other)
Color.new("cyan_alt_other"    , palette.cyan_alt_other)

-- styles for desaturated foreground text, intended for use with
-- the `modus_operandi_theme_faint_syntax' option
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_faint"     , palette.red_faint)
Color.new("green_faint"   , palette.green_faint)
Color.new("yellow_faint"  , palette.yellow_faint)
Color.new("blue_faint"    , palette.blue_faint)
Color.new("magenta_faint" , palette.magenta_faint)
Color.new("cyan_faint"    , palette.cyan_faint)

Color.new("red_alt_faint"     , palette.red_alt_faint)
Color.new("green_alt_faint"   , palette.green_alt_faint)
Color.new("yellow_alt_faint"  , palette.yellow_alt_faint)
Color.new("blue_alt_faint"    , palette.blue_alt_faint)
Color.new("magenta_alt_faint" , palette.magenta_alt_faint)
Color.new("cyan_alt_faint"    , palette.cyan_alt_faint)

Color.new("red_alt_other_faint"     , palette.red_alt_other_faint)
Color.new("green_alt_other_faint"   , palette.green_alt_other_faint)
Color.new("yellow_alt_other_faint"  , palette.yellow_alt_other_faint)
Color.new("blue_alt_other_faint"    , palette.blue_alt_other_faint)
Color.new("magenta_alt_other_faint" , palette.magenta_alt_other_faint)
Color.new("cyan_alt_other_faint"    , palette.cyan_alt_other_faint)

-- styles for elements that should be very subtle, yet accented
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds

Color.new("red_nuanced"     , palette.red_nuanced)
Color.new("green_nuanced"   , palette.green_nuanced)
Color.new("yellow_nuanced"  , palette.yellow_nuanced)
Color.new("blue_nuanced"    , palette.blue_nuanced)
Color.new("magenta_nuanced" , palette.magenta_nuanced)
Color.new("cyan_nuanced"    , palette.cyan_nuanced)

-- styles for slightly accented background
-- must be combined with any of the above foreground values

Color.new("red_nuanced_bg"     , palette.red_nuanced_bg)
Color.new("green_nuanced_bg"   , palette.green_nuanced_bg)
Color.new("yellow_nuanced_bg"  , palette.yellow_nuanced_bg)
Color.new("blue_nuanced_bg"    , palette.blue_nuanced_bg)
Color.new("magenta_nuanced_bg" , palette.magenta_nuanced_bg)
Color.new("cyan_nuanced_bg"    , palette.cyan_nuanced_bg)

-- styles for elements that should draw attention to themselves
-- must be combined with: `bg_main'

Color.new("red_intense"     , palette.red_intense)
Color.new("green_intense"   , palette.green_intense)
Color.new("yellow_intense"  , palette.yellow_intense)
Color.new("blue_intense"    , palette.blue_intense)
Color.new("magenta_intense" , palette.magenta_intense)
Color.new("cyan_intense"    , palette.cyan_intense)

-- styles for background elements that should be visible yet
-- subtle
-- must be combined with: `fg_dim'

Color.new("red_subtle_bg"     , palette.red_subtle_bg)
Color.new("green_subtle_bg"   , palette.green_subtle_bg)
Color.new("yellow_subtle_bg"  , palette.yellow_subtle_bg)
Color.new("blue_subtle_bg"    , palette.blue_subtle_bg)
Color.new("magenta_subtle_bg" , palette.magenta_subtle_bg)
Color.new("cyan_subtle_bg"    , palette.cyan_subtle_bg)

-- styles for background elements that should be visible and
-- distinguishable
-- must be combined with: `fg_main'

Color.new("red_intense_bg"     , palette.red_intense_bg)
Color.new("green_intense_bg"   , palette.green_intense_bg)
Color.new("yellow_intense_bg"  , palette.yellow_intense_bg)
Color.new("blue_intense_bg"    , palette.blue_intense_bg)
Color.new("magenta_intense_bg" , palette.magenta_intense_bg)
Color.new("cyan_intense_bg"    , palette.cyan_intense_bg)

-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds

Color.new("red_refine_bg"     , palette.red_refine_bg)
Color.new("red_refine_fg"     , palette.red_refine_fg)
Color.new("green_refine_bg"   , palette.green_refine_bg)
Color.new("green_refine_fg"   , palette.green_refine_fg)
Color.new("yellow_refine_bg"  , palette.yellow_refine_bg)
Color.new("yellow_refine_fg"  , palette.yellow_refine_fg)
Color.new("blue_refine_bg"    , palette.blue_refine_bg)
Color.new("blue_refine_fg"    , palette.blue_refine_fg)
Color.new("magenta_refine_bg" , palette.magenta_refine_bg)
Color.new("magenta_refine_fg" , palette.magenta_refine_fg)
Color.new("cyan_refine_bg"    , palette.cyan_refine_bg)
Color.new("cyan_refine_fg"    , palette.cyan_refine_fg)

-- styles that are meant exclusively for the statusline
-- must be combined with: `bg_active', `bg_inactive'

Color.new("red_active"     , palette.red_active)
Color.new("green_active"   , palette.green_active)
Color.new("yellow_active"  , palette.yellow_active)
Color.new("blue_active"    , palette.blue_active)
Color.new("magenta_active" , palette.magenta_active)
Color.new("cyan_active"    , palette.cyan_active)

-- styles that are meant exclusively for the fringes
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'

Color.new("red_fringe_bg"     , palette.red_fringe_bg)
Color.new("green_fringe_bg"   , palette.green_fringe_bg)
Color.new("yellow_fringe_bg"  , palette.yellow_fringe_bg)
Color.new("blue_fringe_bg"    , palette.blue_fringe_bg)
Color.new("magenta_fringe_bg" , palette.magenta_fringe_bg)
Color.new("cyan_fringe_bg"    , palette.cyan_fringe_bg)

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

Color.new("bg_hl_line"             , palette.bg_hl_line)
Color.new("bg_paren_match"         , palette.bg_paren_match)
Color.new("bg_paren_match_intense" , palette.bg_paren_match_intense)
Color.new("bg_region"              , palette.bg_region)

Color.new("bg_tab_bar"      , palette.bg_tab_bar)
Color.new("bg_tab_active"   , palette.bg_tab_active)
Color.new("bg_tab_inactive" , palette.bg_tab_inactive)
Color.new("fg_tab_active"   , palette.fg_tab_active)

Color.new("fg_escape_char_construct" , palette.fg_escape_char_construct)
Color.new("fg_escape_char_backslash" , palette.fg_escape_char_backslash)

Color.new("fg_lang_error"   , palette.fg_lang_error)
Color.new("fg_lang_warning" , palette.fg_lang_warning)
Color.new("fg_lang_note"    , palette.fg_lang_note)

Color.new("fg_window_divider_inner" , palette.fg_window_divider_inner)
Color.new("fg_window_divider_outer" , palette.fg_window_divider_outer)

Color.new("fg_unfocused" , palette.fg_unfocused)

Color.new("bg_header" , palette.bg_header)
Color.new("fg_header" , palette.fg_header)

Color.new("bg_whitespace" , palette.bg_whitespace)
Color.new("fg_whitespace" , palette.fg_whitespace)

Color.new("bg_diff_heading" , palette.bg_diff_heading)
Color.new("fg_diff_heading" , palette.fg_diff_heading)
Color.new("bg_diff_added"   , palette.bg_diff_added)
Color.new("fg_diff_added"   , palette.fg_diff_added)
Color.new("bg_diff_changed" , palette.bg_diff_changed)
Color.new("fg_diff_changed" , palette.fg_diff_changed)
Color.new("bg_diff_removed" , palette.bg_diff_removed)
Color.new("fg_diff_removed" , palette.fg_diff_removed)

Color.new("bg_mark_sel" , palette.bg_mark_sel)
Color.new("fg_mark_sel" , palette.fg_mark_sel)
Color.new("bg_mark_del" , palette.bg_mark_del)
Color.new("fg_mark_del" , palette.fg_mark_del)
Color.new("bg_mark_alt" , palette.bg_mark_alt)
Color.new("fg_mark_alt" , palette.fg_mark_alt)

require('highlights').init(colors, Group, groups, styles, palette)
