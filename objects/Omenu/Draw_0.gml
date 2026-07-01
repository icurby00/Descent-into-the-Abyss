/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_font(fMenu);


var _gap = 40;

var _size = array_length(menu[sub_menu]);
for (var i = 0; i < _size; ++i) {
// reset colour
	if i == index var _col = c_purple; else var _col = c_dkgray;
	
	//is array or plain text
	if is_array(menu[sub_menu][i]) {
		var _menu_arr = menu[sub_menu][i];
		
		
		var _map_arr = set[? _menu_arr[1]];
		
		var _limits_arr = _map_arr[1];
		
		var _str1 = _menu_arr[0];
		if is_real(_limits_arr[0]) {
			var _str2 = string(_map_arr[0]);
		} else {
			
			var _str2 = _limits_arr[_map_arr[0]];
		}
	} else {
		
		var _str1 = menu[sub_menu][i];
		var _str2 = "";
	}	
	// set up y and text width
	var _stc = button_arr[sub_menu][i];
	_stc.y = menu_y_pos + _gap * i;
	
	//set diff widths if on array
	if _str2 == "" {
		_stc.wl = string_width(_str1)/2;
		_stc.wr = string_width(_str1)/2;
	} else {
		_stc.wl = string_width(_str1 + " ");
		_stc.wr = string_width(_str2 + " ");
	}
	
	// is mouse over text
	
	var _hovering_over_text = false;
	// should mouse control enable
	if mouse_y >= menu_y_pos and mouse_y <= menu_y_pos + _gap * _size {
		// check which entry for menu
		if mouse_y > _stc.y and mouse_y < _stc.y + _stc.h {
			//check x pos
			if mouse_x > menu_x_pos - _stc.wl and mouse_x < menu_x_pos + _stc.wr {
				_col = c_navy;
				_hovering_over_text = true;
			}
		}
		
	}
	
	//is this current index 
	if index == i _col = c_navy;
	//update index
	if _col = c_navy {
		//update index 
		index = i; 
		//clicking over text
		if mouse_check_button_pressed(mb_left) and _hovering_over_text {
			//set menu
			var _select = true;
			var _hmove = 0;
			
			if is_array(menu[sub_menu][i]) {
				if mouse_x < menu_x_pos - _stc.wl + click_area_width _hmove = - 1;
				else if mouse_x > menu_x_pos - click_area_width and mouse_x < menu_x_pos _hmove = 1;
			}
			process_menu(_select, _hmove);
			
			//update size 
			_size = array_length(menu[sub_menu]);
		}
	}
	
	
	//draw text 
	if _str2 == "" {
		draw_set_halign(fa_center);
		draw_text_colour(menu_x_pos, menu_y_pos + _gap * i, _str1 + " ", _col, _col, _col, _col, 1);
	} else {
		draw_set_halign(fa_right)
		draw_text_colour(menu_x_pos, menu_y_pos + _gap * i, _str1 + " ", _col, _col, _col, _col, 1);
		draw_set_halign(fa_left)
		draw_text_colour(menu_x_pos, menu_y_pos + _gap * i, " " + _str2, _col, _col, _col, _col, 1);
	}
	
}









