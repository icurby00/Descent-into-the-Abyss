/// @description Insert description here
// You can write your code in this editor
switch (button_id)
{
	case 0:
		Opause_Controller.paused = false;
		Opause_Controller.update_pause();
	
	break;
	
	case 1:
		layer_set_visible("PauseLayer", false);
		layer_set_visible("SettingsLayer", true);
	
	
	break;
	
	case 2:
	game_end();
	
	break;
	
	case 3:
		layer_set_visible("PauseLayer", true);
		layer_set_visible("SettingsLayer", false);
	break;
	
	case 4:
		audio_stop_sound(audiogroup_default);
		if !audio_is_playing(audiogroup_default)
		{
			audio_play_sound(audiogroup_default,100,true);
		}
	
	break;
	
	case 5:
		audio_stop_sound(audiogroup_music);
		if !audio_is_playing(audiogroup_music)
		{
			audio_play_sound(audiogroup_music,100,true);
		}
	
	break;
	
	case 6:
		global.textspeed = global.textspeed + 1;
		if global.textspeed > 2
		{
			global.textspeed = global.textspeed - 1;
		}
		
	break;
	
}