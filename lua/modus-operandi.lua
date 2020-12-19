local Color,colors, Group, groups, styles = require("colorbuddy").setup()

local light_palette = {

    bg_main     = "#ffffff",
    fg_main     = "#000000",
    bg_alt= "#f0f0f0",
    fg_alt = "#505050",
    bg_dim = "#f8f8f8",
    fg_dim = "#282828",

    bg_active   = "#d7d7d7",
    fg_active   = "#0a0a0a",
    bg_inactive = "#efefef",
    fg_inactive = "#404148",

    bg_special_cold = "#dde3f4",
    fg_special_cold = "#093060",
    bg_special_mild = "#c4ede0",
    fg_special_mild = "#184034",
    bg_special_warm = "#f0e0d4",
    fg_special_warm = "#5d3026",
    bg_special_calm = "#f8ddea",
    fg_special_calm = "#61284f",

    red     = "#a60000",
    green   = "#005e00",
    yellow  = "#813e00",
    blue    = "#0030a6",
    magenta = "#721045",
    cyan    = "#00538b",

    red_alt     = "#972500",
    green_alt   = "#315b00",
    yellow_alt  = "#70480f",
    blue_alt    = "#223fbf",
    magenta_alt = "#8f0075",
    cyan_alt    = "#30517f",

    red_alt_other     = "#a0132f",
    green_alt_other   = "#145c33",
    yellow_alt_other  = "#863927",
    blue_alt_other    = "#0000bb",
    magenta_alt_other = "#5317ac",
    cyan_alt_other    = "#005a5f",

    red_faint     = "#7f1010",
    green_faint   = "#104410",
    yellow_faint  = "#5f4400",
    blue_faint    = "#002f88",
    magenta_faint = "#752f50",
    cyan_faint    = "#12506f",

    red_alt_faint     = "#702f00",
    green_alt_faint   = "#30440f",
    yellow_alt_faint  = "#5d5000",
    blue_alt_faint    = "#003f78",
    magenta_alt_faint = "#702565",
    cyan_alt_faint    = "#354f6f",

    red_alt_other_faint     = "#7f002f",
    green_alt_other_faint   = "#0f443f",
    yellow_alt_other_faint  = "#5e3a20",
    blue_alt_other_faint    = "#1f2f6f",
    magenta_alt_other_faint = "#5f3f7f",
    cyan_alt_other_faint    = "#2e584f",

    red_nuanced     = "#5f0000",
    green_nuanced   = "#004000",
    yellow_nuanced  = "#3f3000",
    blue_nuanced    = "#201f55",
    magenta_nuanced = "#541f4f",
    cyan_nuanced    = "#0f3360",

    red_nuanced_bg     = "#fff1f0",
    green_nuanced_bg   = "#ecf7ed",
    yellow_nuanced_bg  = "#fff3da",
    blue_nuanced_bg    = "#f3f3ff",
    magenta_nuanced_bg = "#fdf0ff",
    cyan_nuanced_bg    = "#ebf6fa",

    red_intense     = "#b60000",
    green_intense   = "#006800",
    yellow_intense  = "#904200",
    blue_intense    = "#1111ee",
    magenta_intense = "#7000e0",
    cyan_intense    = "#205b93",

    red_subtle_bg     = "#f2b0a2",
    green_subtle_bg   = "#aecf90",
    yellow_subtle_bg  = "#e4c340",
    blue_subtle_bg    = "#b5d0ff",
    magenta_subtle_bg = "#f0d3ff",
    cyan_subtle_bg    = "#c0efff",

    red_intense_bg     = "#ff8892",
    green_intense_bg   = "#5ada88",
    yellow_intense_bg  = "#f5df23",
    blue_intense_bg    = "#6aaeff",
    magenta_intense_bg = "#d5baff",
    cyan_intense_bg    = "#42cbd4",

    red_refine_bg     = "#ffcccc",
    red_refine_fg     = "#780000",
    green_refine_bg   = "#aceaac",
    green_refine_fg   = "#004c00",
    yellow_refine_bg  = "#fff29a",
    yellow_refine_fg  = "#604000",
    blue_refine_bg    = "#8ac7ff",
    blue_refine_fg    = "#002288",
    magenta_refine_bg = "#ffccff",
    magenta_refine_fg = "#770077",
    cyan_refine_bg    = "#8eecf4",
    cyan_refine_fg    = "#004850",

    red_active     = "#930000",
    green_active   = "#005300",
    yellow_active  = "#703700",
    blue_active    = "#0033c0",
    magenta_active = "#6320a0",
    cyan_active    = "#004882",

    red_fringe_bg     = "#ff9a9a",
    green_fringe_bg   = "#86cf86",
    yellow_fringe_bg  = "#e0c050",
    blue_fringe_bg    = "#82afff",
    magenta_fringe_bg = "#f0a3ff",
    cyan_fringe_bg    = "#00d6e0",

    bg_hl_line             = "#f2eff3",
    bg_paren_match         = "#e0af82",
    bg_paren_match_intense = "#70af9f",
    bg_region              = "#bcbcbc",

    bg_tab_bar      = "#d5d5d5",
    bg_tab_active   = "#f6f6f6",
    bg_tab_inactive = "#bdbdbd",
    fg_tab_active   = "#30169e",

    fg_escape_char_construct = "#8b1030",
    fg_escape_char_backslash = "#654d0f",

    fg_lang_error   = "#9f004f",
    fg_lang_warning = "#604f0f",
    fg_lang_note    = "#4040ae",

    fg_window_divider_inner = "#888888",
    fg_window_divider_outer = "#585858",

    fg_unfocused = "#56576d",

    bg_header = "#e5e5e5",
    fg_header = "#2a2a2a",

    bg_whitespace = "#fff8fc",
    fg_whitespace = "#645060",

    bg_diff_heading = "#b7c2dd",
    fg_diff_heading = "#043355",
    bg_diff_added   = "#d4fad4",
    fg_diff_added   = "#004500",
    bg_diff_changed = "#fcefcf",
    fg_diff_changed = "#524200",
    bg_diff_removed = "#ffe8ef",
    fg_diff_removed = "#691616",

    bg_mark_sel = "#a0f0cf",
    fg_mark_sel = "#005040",
    bg_mark_del = "#ffccbb",
    fg_mark_del = "#840040",
    bg_mark_alt = "#f5d88f",
    fg_mark_alt = "#782900",

}

Color.new("bg_main" , light_palette.bg_main)
Color.new("fg_main" , light_palette.fg_main)
Color.new("bg_alt"  , light_palette.bg_alt)
Color.new("fg_alt"  , light_palette.fg_alt)
Color.new("bg_dim"  , light_palette.bg_dim)
Color.new("fg_dim"  , light_palette.fg_dim)

-- specifically for on/off states (e.g. `statusline`)
-- must be combined with themselves

Color.new("bg_active"   , light_palette.bg_active)
Color.new("fg_active"   , light_palette.fg_active)
Color.new("bg_inactive" , light_palette.bg_inactive)
Color.new("fg_inactive" , light_palette.fg_inactive)

-- special base values, used only for cases where the above
-- fg_* or bg_* cannot or should not be used (to avoid confusion)
-- must be combined with: {fg_main,bg_main}_{alt,dim}

Color.new("bg_special_cold" ,light_palette.bg_special_cold)
Color.new("fg_special_cold" ,light_palette.fg_special_cold)
Color.new("bg_special_mild" ,light_palette.bg_special_mild)
Color.new("fg_special_mild" ,light_palette.fg_special_mild)
Color.new("bg_special_warm" ,light_palette.bg_special_warm)
Color.new("fg_special_warm" ,light_palette.fg_special_warm)
Color.new("bg_special_calm" ,light_palette.bg_special_calm)
Color.new("fg_special_calm" ,light_palette.fg_special_calm)

-- styles for the main constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red"     , light_palette.red)
Color.new("green"   , light_palette.green)
Color.new("yellow"  , light_palette.yellow)
Color.new("blue"    , light_palette.blue)
Color.new("magenta" , light_palette.magenta)
Color.new("cyan"    , light_palette.cyan)

-- styles for common, but still specialised constructs
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt"     , light_palette.red_alt)
Color.new("green_alt"   , light_palette.green_alt)
Color.new("yellow_alt"  , light_palette.yellow_alt)
Color.new("blue_alt"    , light_palette.blue_alt)
Color.new("magenta_alt" , light_palette.magenta_alt)
Color.new("cyan_alt"    , light_palette.cyan_alt)

-- same purpose as above, just slight differences
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_alt_other"     , light_palette.red_alt_other)
Color.new("green_alt_other"   , light_palette.green_alt_other)
Color.new("yellow_alt_other"  , light_palette.yellow_alt_other)
Color.new("blue_alt_other"    , light_palette.blue_alt_other)
Color.new("magenta_alt_other" , light_palette.magenta_alt_other)
Color.new("cyan_alt_other"    , light_palette.cyan_alt_other)

-- styles for desaturated foreground text, intended for use with
-- the `modus_operandi_theme_faint_syntax' option
-- must be combined with: `bg_main', `bg_alt', `bg_dim'

Color.new("red_faint"     , light_palette.red_faint)
Color.new("green_faint"   , light_palette.green_faint)
Color.new("yellow_faint"  , light_palette.yellow_faint)
Color.new("blue_faint"    , light_palette.blue_faint)
Color.new("magenta_faint" , light_palette.magenta_faint)
Color.new("cyan_faint"    , light_palette.cyan_faint)

Color.new("red_alt_faint"     , light_palette.red_alt_faint)
Color.new("green_alt_faint"   , light_palette.green_alt_faint)
Color.new("yellow_alt_faint"  , light_palette.yellow_alt_faint)
Color.new("blue_alt_faint"    , light_palette.blue_alt_faint)
Color.new("magenta_alt_faint" , light_palette.magenta_alt_faint)
Color.new("cyan_alt_faint"    , light_palette.cyan_alt_faint)

Color.new("red_alt_other_faint"     , light_palette.red_alt_other_faint)
Color.new("green_alt_other_faint"   , light_palette.green_alt_other_faint)
Color.new("yellow_alt_other_faint"  , light_palette.yellow_alt_other_faint)
Color.new("blue_alt_other_faint"    , light_palette.blue_alt_other_faint)
Color.new("magenta_alt_other_faint" , light_palette.magenta_alt_other_faint)
Color.new("cyan_alt_other_faint"    , light_palette.cyan_alt_other_faint)

-- styles for elements that should be very subtle, yet accented
-- must be combined with: `bg_main', `bg_alt', `bg_dim' or any of
-- the "nuanced" backgrounds

Color.new("red_nuanced"     , light_palette.red_nuanced)
Color.new("green_nuanced"   , light_palette.green_nuanced)
Color.new("yellow_nuanced"  , light_palette.yellow_nuanced)
Color.new("blue_nuanced"    , light_palette.blue_nuanced)
Color.new("magenta_nuanced" , light_palette.magenta_nuanced)
Color.new("cyan_nuanced"    , light_palette.cyan_nuanced)

-- styles for slightly accented background
-- must be combined with any of the above foreground values

Color.new("red_nuanced_bg"     , light_palette.red_nuanced_bg)
Color.new("green_nuanced_bg"   , light_palette.green_nuanced_bg)
Color.new("yellow_nuanced_bg"  , light_palette.yellow_nuanced_bg)
Color.new("blue_nuanced_bg"    , light_palette.blue_nuanced_bg)
Color.new("magenta_nuanced_bg" , light_palette.magenta_nuanced_bg)
Color.new("cyan_nuanced_bg"    , light_palette.cyan_nuanced_bg)

-- styles for elements that should draw attention to themselves
-- must be combined with: `bg_main'

Color.new("red_intense"     , light_palette.red_intense)
Color.new("green_intense"   , light_palette.green_intense)
Color.new("yellow_intense"  , light_palette.yellow_intense)
Color.new("blue_intense"    , light_palette.blue_intense)
Color.new("magenta_intense" , light_palette.magenta_intense)
Color.new("cyan_intense"    , light_palette.cyan_intense)

-- styles for background elements that should be visible yet
-- subtle
-- must be combined with: `fg_dim'

Color.new("red_subtle_bg"     , light_palette.red_subtle_bg)
Color.new("green_subtle_bg"   , light_palette.green_subtle_bg)
Color.new("yellow_subtle_bg"  , light_palette.yellow_subtle_bg)
Color.new("blue_subtle_bg"    , light_palette.blue_subtle_bg)
Color.new("magenta_subtle_bg" , light_palette.magenta_subtle_bg)
Color.new("cyan_subtle_bg"    , light_palette.cyan_subtle_bg)

-- styles for background elements that should be visible and
-- distinguishable
-- must be combined with: `fg_main'

Color.new("red_intense_bg"     , light_palette.red_intense_bg)
Color.new("green_intense_bg"   , light_palette.green_intense_bg)
Color.new("yellow_intense_bg"  , light_palette.yellow_intense_bg)
Color.new("blue_intense_bg"    , light_palette.blue_intense_bg)
Color.new("magenta_intense_bg" , light_palette.magenta_intense_bg)
Color.new("cyan_intense_bg"    , light_palette.cyan_intense_bg)

-- styles for refined contexts where both the foreground and the
-- background need to have the same/similar hue
-- must be combined with themselves OR the foregrounds can be
-- combined with any of the base backgrounds

Color.new("red_refine_bg"     , light_palette.red_refine_bg)
Color.new("red_refine_fg"     , light_palette.red_refine_fg)
Color.new("green_refine_bg"   , light_palette.green_refine_bg)
Color.new("green_refine_fg"   , light_palette.green_refine_fg)
Color.new("yellow_refine_bg"  , light_palette.yellow_refine_bg)
Color.new("yellow_refine_fg"  , light_palette.yellow_refine_fg)
Color.new("blue_refine_bg"    , light_palette.blue_refine_bg)
Color.new("blue_refine_fg"    , light_palette.blue_refine_fg)
Color.new("magenta_refine_bg" , light_palette.magenta_refine_bg)
Color.new("magenta_refine_fg" , light_palette.magenta_refine_fg)
Color.new("cyan_refine_bg"    , light_palette.cyan_refine_bg)
Color.new("cyan_refine_fg"    , light_palette.cyan_refine_fg)

-- styles that are meant exclusively for the statusline
-- must be combined with: `bg_active', `bg_inactive'

Color.new("red_active"     , light_palette.red_active)
Color.new("green_active"   , light_palette.green_active)
Color.new("yellow_active"  , light_palette.yellow_active)
Color.new("blue_active"    , light_palette.blue_active)
Color.new("magenta_active" , light_palette.magenta_active)
Color.new("cyan_active"    , light_palette.cyan_active)

-- styles that are meant exclusively for the fringes
-- must have a minimum contrast ratio of 1.5:1 with `bg_inactive'
-- and be combined with `fg_main' or `fg_dim'

Color.new("red_fringe_bg"     , light_palette.red_fringe_bg)
Color.new("green_fringe_bg"   , light_palette.green_fringe_bg)
Color.new("yellow_fringe_bg"  , light_palette.yellow_fringe_bg)
Color.new("blue_fringe_bg"    , light_palette.blue_fringe_bg)
Color.new("magenta_fringe_bg" , light_palette.magenta_fringe_bg)
Color.new("cyan_fringe_bg"    , light_palette.cyan_fringe_bg)

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

Color.new("bg_hl_line"             , light_palette.bg_hl_line)
Color.new("bg_paren_match"         , light_palette.bg_paren_match)
Color.new("bg_paren_match_intense" , light_palette.bg_paren_match_intense)
Color.new("bg_region"              , light_palette.bg_region)

Color.new("bg_tab_bar"      , light_palette.bg_tab_bar)
Color.new("bg_tab_active"   , light_palette.bg_tab_active)
Color.new("bg_tab_inactive" , light_palette.bg_tab_inactive)
Color.new("fg_tab_active"   , light_palette.fg_tab_active)

Color.new("fg_escape_char_construct" , light_palette.fg_escape_char_construct)
Color.new("fg_escape_char_backslash" , light_palette.fg_escape_char_backslash)

Color.new("fg_lang_error"   , light_palette.fg_lang_error)
Color.new("fg_lang_warning" , light_palette.fg_lang_warning)
Color.new("fg_lang_note"    , light_palette.fg_lang_note)

Color.new("fg_window_divider_inner" , light_palette.fg_window_divider_inner)
Color.new("fg_window_divider_outer" , light_palette.fg_window_divider_outer)

Color.new("fg_unfocused" , light_palette.fg_unfocused)

Color.new("bg_header" , light_palette.bg_header)
Color.new("fg_header" , light_palette.fg_header)

Color.new("bg_whitespace" , light_palette.bg_whitespace)
Color.new("fg_whitespace" , light_palette.fg_whitespace)

Color.new("bg_diff_heading" , light_palette.bg_diff_heading)
Color.new("fg_diff_heading" , light_palette.fg_diff_heading)
Color.new("bg_diff_added"   , light_palette.bg_diff_added)
Color.new("fg_diff_added"   , light_palette.fg_diff_added)
Color.new("bg_diff_changed" , light_palette.bg_diff_changed)
Color.new("fg_diff_changed" , light_palette.fg_diff_changed)
Color.new("bg_diff_removed" , light_palette.bg_diff_removed)
Color.new("fg_diff_removed" , light_palette.fg_diff_removed)

Color.new("bg_mark_sel" , light_palette.bg_mark_sel)
Color.new("fg_mark_sel" , light_palette.fg_mark_sel)
Color.new("bg_mark_del" , light_palette.bg_mark_del)
Color.new("fg_mark_del" , light_palette.fg_mark_del)
Color.new("bg_mark_alt" , light_palette.bg_mark_alt)
Color.new("fg_mark_alt" , light_palette.fg_mark_alt)

require('highlights').init(colors, Group, groups, styles, light_palette)
