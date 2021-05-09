local M = {}

function M.setup()
	local my_colors = {
		none = {"none", "none"},
		bg_main = {"#ffffff",255},        
		fg_main = {"#000000",0},
		bg_dim = {"#f8f8f8",249},
		fg_dim = {"#282828",40},
		bg_alt = {"#f0f0f0",241},
		fg_alt = {"#505050",80},
		bg_active = {"#d7d7d7",216},
		fg_active = {"#0a0a0a",10},
		bg_inactive = {"#efefef",240},
		fg_inactive = {"#404148",64},
		bg_special_cold = {"#dde3f4",224},
		fg_special_cold = {"#093060",16},
		bg_special_mild = {"#c4ede0",203},
		fg_special_mild = {"#184034",30},
		bg_special_warm = {"#f0e0d4",238},
		fg_special_warm = {"#5d3026",86},
		bg_special_calm = {"#f8ddea",245},
		fg_special_calm = {"#61284f",89},
		red = {"#a60000",140},
		red_alt = {"#972500",132},
		red_alt_other = {"#a0132f",138},
		red_faint = {"#7f1010",109},
		red_alt_faint = {"#702f00",101},
		red_alt_other_faint = {"#7f002f",108},
		green = {"#005e00",13},
		green_alt = {"#315b00",54},
		green_alt_other = {"#145c33",31},
		green_faint = {"#104410",23},
		green_alt_faint = {"#30440f",50},
		green_alt_other_faint = {"#0f443f",23},
		yellow = {"#813e00",117},
		yellow_alt = {"#70480f",104},
		yellow_alt_other = {"#863927",121},
		yellow_faint = {"#5f4400",89},
		yellow_alt_faint = {"#5d5000",89},
		yellow_alt_other_faint = {"#5e3a20",88},
		blue = {"#0031a9",10},
		blue_alt = {"#2544bb",45},
		blue_alt_other = {"#0000c0",4},
		blue_faint = {"#003497",10},
		blue_alt_faint = {"#0f3d8c",24},
		blue_alt_other_faint = {"#001087",5},
		magenta = {"#721045",100},
		magenta_alt = {"#8f0075",123},
		magenta_alt_other = {"#5317ac",77},
		magenta_faint = {"#752f50",107},
		magenta_alt_faint = {"#7b206f",110},
		magenta_alt_other_faint = {"#55348e",82},
		cyan = {"#00538b",14},
		cyan_alt = {"#30517f",54},
		cyan_alt_other = {"#005a5f",14},
		cyan_faint = {"#005077",14},
		cyan_alt_faint = {"#354f6f",58},
		cyan_alt_other_faint = {"#125458",29},
		red_intense = {"#b60000",153},
		orange_intense = {"#904200",130},
		green_intense = {"#006800",14},
		yellow_intense = {"#605b00",93},
		blue_intense = {"#1f1fce",35},
		magenta_intense = {"#a8007f",144},
		purple_intense = {"#7f10d0",114},
		cyan_intense = {"#005f88",16},
		red_active = {"#8a0000",116},
		green_active = {"#004c2e",11},
		yellow_active = {"#702d1f",101},
		blue_active = {"#0030b4",10},
		magenta_active = {"#5c2092",85},
		cyan_active = {"#003f8a",12},
		red_subtle_bg = {"#f2b0a2",232},
		red_intense_bg = {"#ff8892",237},
		green_subtle_bg = {"#aecf90",179},
		green_intense_bg = {"#5ada88",109},
		yellow_subtle_bg = {"#e4c340",221},
		yellow_intense_bg = {"#f5df23",238},
		blue_subtle_bg = {"#b5d0ff",187},
		blue_intense_bg = {"#6aaeff",119},
		magenta_subtle_bg = {"#f0d3ff",238},
		magenta_intense_bg = {"#d5baff",211},
		cyan_subtle_bg = {"#c0efff",201},
		cyan_intense_bg = {"#42cbd4",89},
		red_fringe_bg = {"#f08290",224},
		green_fringe_bg = {"#62c86a",113},
		yellow_fringe_bg = {"#dbba3f",212},
		blue_fringe_bg = {"#82afff",140},
		magenta_fringe_bg = {"#e0a3ff",217},
		cyan_fringe_bg = {"#2fcddf",73},
		red_graph_0_bg = {"#ef6f79",220},
		red_graph_1_bg = {"#ff9f9f",241},
		green_graph_0_bg = {"#49d239",92},
		green_graph_1_bg = {"#6dec6d",127},
		yellow_graph_0_bg = {"#efec08",235},
		yellow_graph_1_bg = {"#dbff4e",222},
		blue_graph_0_bg = {"#55a2f0",100},
		blue_graph_1_bg = {"#7fcfff",142},
		magenta_graph_0_bg = {"#ba86ef",181},
		magenta_graph_1_bg = {"#e7afff",225},
		cyan_graph_0_bg = {"#30d3f0",75},
		cyan_graph_1_bg = {"#6fefff",133},
		red_refine_bg = {"#ffcccc",248},
		red_refine_fg = {"#780000",101},
		green_refine_bg = {"#aceaac",182},
		green_refine_fg = {"#004c00",10},
		yellow_refine_bg = {"#fff29a",252},
		yellow_refine_fg = {"#604000",90},
		blue_refine_bg = {"#8ac7ff",150},
		blue_refine_fg = {"#002288",7},
		magenta_refine_bg = {"#ffccff",249},
		magenta_refine_fg = {"#770077",103},
		cyan_refine_bg = {"#8eecf4",158},
		cyan_refine_fg = {"#004850",12},
		red_nuanced_bg = {"#fff1f0",254},
		red_nuanced_fg = {"#5f0000",80},
		green_nuanced_bg = {"#ecf7ed",239},
		green_nuanced_fg = {"#004000",9},
		yellow_nuanced_bg = {"#fff3da",254},
		yellow_nuanced_fg = {"#3f3000",59},
		blue_nuanced_bg = {"#f3f3ff",245},
		blue_nuanced_fg = {"#201f55",33},
		magenta_nuanced_bg = {"#fdf0ff",253},
		magenta_nuanced_fg = {"#541f4f",77},
		cyan_nuanced_bg = {"#ebf6fa",238},
		cyan_nuanced_fg = {"#0f3360",22},
		bg_hl_line = {"#f2eff3",243},
		bg_hl_line_intense = {"#e0e0e0",225},
		bg_hl_alt = {"#fbeee0",250},
		bg_hl_alt_intense = {"#e8dfd1",232},
		bg_paren_match = {"#e0af82",216},
		bg_paren_match_intense = {"#c488ff",190},
		bg_region = {"#bcbcbc",189},
		bg_tab_bar = {"#d5d5d5",214},
		bg_tab_active = {"#f6f6f6",247},
		bg_tab_inactive = {"#bdbdbd",190},
		bg_tab_inactive_alt = {"#999999",154},
		fg_tab_accent = {"#30169e",47},
		red_tab = {"#680000",87},
		green_tab = {"#003900",8},
		yellow_tab = {"#393000",54},
		orange_tab = {"#502300",72},
		blue_tab = {"#000080",3},
		cyan_tab = {"#052f60",13},
		magenta_tab = {"#5f004d",81},
		purple_tab = {"#400487",57},
		fg_escape_char_construct = {"#8b1030",120},
		fg_escape_char_backslash = {"#654d0f",96},
		fg_lang_error = {"#9f004f",136},
		fg_lang_warning = {"#604f0f",92},
		fg_lang_note = {"#4040ae",67},
		fg_lang_underline_error = {"#ef4f54",214},
		fg_lang_underline_warning = {"#cf9f00",197},
		fg_lang_underline_note = {"#3f6fef",74},
		fg_window_divider_inner = {"#888888",137},
		fg_window_divider_outer = {"#585858",88},
		fg_unfocused = {"#56576d",87},
		fg_docstring = {"#2a486a",48},
		fg_comment_yellow = {"#5f4400",89},
		bg_header = {"#e5e5e5",230},
		fg_header = {"#2a2a2a",42},
		bg_whitespace = {"#f5efef",245},
		fg_whitespace = {"#624956",94},
		bg_diff_heading = {"#b7cfe0",188},
		fg_diff_heading = {"#041645",8},
		bg_diff_added = {"#d4fad4",219},
		fg_diff_added = {"#004500",9},
		bg_diff_added_deuteran = {"#daefff",223},
		fg_diff_added_deuteran = {"#002044",6},
		bg_diff_changed = {"#fcefcf",251},
		fg_diff_changed = {"#524200",78},
		bg_diff_removed = {"#ffe8ef",253},
		fg_diff_removed = {"#691616",92},
		bg_diff_refine_added = {"#94cf94",157},
		fg_diff_refine_added = {"#002a00",5},
		bg_diff_refine_added_deuteran = {"#77c0ef",133},
		fg_diff_refine_added_deuteran = {"#000035",1},
		bg_diff_refine_changed = {"#cccf8f",204},
		fg_diff_refine_changed = {"#302010",45},
		bg_diff_refine_removed = {"#daa2b0",210},
		fg_diff_refine_removed = {"#400000",54},
		bg_diff_focus_added = {"#bbeabb",195},
		fg_diff_focus_added = {"#002c00",6},
		bg_diff_focus_added_deuteran = {"#bacfff",192},
		fg_diff_focus_added_deuteran = {"#001755",5},
		bg_diff_focus_changed = {"#ecdfbf",234},
		fg_diff_focus_changed = {"#392900",53},
		bg_diff_focus_removed = {"#efcbcf",235},
		fg_diff_focus_removed = {"#4a0000",62},
		bg_mark_sel = {"#a0f0cf",173},
		fg_mark_sel = {"#005040",12},
		bg_mark_del = {"#ffccbb",248},
		fg_mark_del = {"#840040",112},
		bg_mark_alt = {"#f5d88f",240},
		fg_mark_alt = {"#782900",107}
	}
	return my_colors
end

return M































































































































































































