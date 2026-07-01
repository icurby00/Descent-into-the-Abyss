/// @description Insert description here
// You can write your code in this editor
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _right = keyboard_check_pressed(vk_right);
var _left = keyboard_check_pressed(vk_left);
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

var _move = _down - _up;
var _hmove = _right - _left;
if _move != 0 {
	index += _move;
	
	var _size = array_length(menu[sub_menu]);
	if index < 0 index = _size - 1;
	else if index >= _size index = 0;
}

function process_menu(_select,_hmove) {
	if _select or (is_array(menu[sub_menu][index]) and (_hmove != 0)) {
		switch(sub_menu) {
			case MAIN:   
				switch(index) {
					case 0:
						//Start
						room_goto(rm_character_select);
					break;
					case 1:
						//Options
						sub_menu = SETTINGS;
						index = 0;
		
					break;
					case 2:
						//Exit
						game_end();
					break;
				}
			break;
			case SETTINGS:   
				switch(index) {
					case 0:
						//Sound
						change_menu(_hmove, "sound");
						audio_group_set_gain(audiogroup_default, global.dsm_settings[? "sound"][0]/10,0)
						audio_play_sound(snd_effect,50,false);
					break;
					case 1:
						//Music
						change_menu(_hmove, "music");
						audio_group_set_gain(audiogroup_default, global.dsm_settings[? "music"][0]/10, 0);
						
					break;
					case 2:
						//Text Speed
						change_menu(_hmove, "text_speed"); 
						global.textspeed = set[? "text_speed"][0];
						break;
					case 3:
						//Back
						sub_menu = MAIN;
						index = 1;
					break;
				}
			break;
			}
	}
}
process_menu(_select, _hmove);
function change_menu(_move, _key){
	/// @desc change the ds map key entry by the move value passed 
	///@ _move real
	///@_key string
// allowed limits
var _map_arr = set[? _key];
var _limits_arr = _map_arr[1];
	
	
	if is_real(_limits_arr[0]) {
		var _min = _limits_arr[0];
		var _max = _limits_arr[1];
	} else {
		var _min = 0;
		var _max = array_length(_limits_arr) - 1;
		
	}
	
	_map_arr[@ 0] = clamp(_move + _map_arr[0], _min, _max);
}