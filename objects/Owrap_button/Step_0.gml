/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,Pplayer)) && keyboard_check_pressed(vk_enter)
{
	if room_exists(target_room)
	{
	 Pplayer.x = target_x;
	 Pplayer.y = target_y;
	room_goto(target_room);
	
	}
}