/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
#macro MAIN 0
#macro SETTINGS 1
#macro TOTAL 2

global.dsm_settings = ds_map_create();
#macro set global.dsm_settings


ds_map_add(set, "sound", [5, [0, 10]]);
ds_map_add(set, "music", [5, [0, 10]]);
ds_map_add(set, "text_speed", [1, ["Slow", "Normal", "Fast"]]);

// Main Menu
menu[MAIN][0] = "New Game";
menu[MAIN][1] = "Options";
menu[MAIN][2] = "Quit";

// Options Menu
menu[SETTINGS][0] = ["< Sound FX> " , "sound"];
menu[SETTINGS][1] = ["< Music >  " , "music"];
menu[SETTINGS][2] = ["< Text Speed >" , "text_speed"];
menu[SETTINGS][3] = "Back";


index = 0;
sub_menu = 0;

menu_x_pos = room_width * .5;
menu_y_pos = room_height * .4;
click_area_width = 40;


function button(_y, _wl, _wr, _h) constructor {
	y = _y;
	wl = _wl;
	wr = _wr;
	h = _h;
}


var _h = 40;


for (var a = 0; a < TOTAL; ++a) {
	for (var b = 0; b < array_length(menu[a]); ++b) {
	   button_arr[a][b] = new button(0, room_width/2, room_width/2, _h);
	}
    
}







