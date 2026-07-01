/// @description Insert description here
// You can write your code in this editor
if ds_map_find_value(async_load, "type") == "audiogroup_load"{
	if(ds_map_find_value(async_load, "group_id")== audiogroup_default){
		audio_play_sound(snd_effect, 50, false);
	}
}