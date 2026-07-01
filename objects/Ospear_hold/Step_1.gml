/// @description Insert description here
// You can write your code in this editor
if (global.player_has_weapon = true)
{
x = Oplayer.x-0.5;
y = Oplayer.y-2;

image_angle = point_direction(x,y,mouse_x, mouse_y);
}
firing_delay =- 1;
recoil = max(0,recoil - 1);
if (mouse_check_button_released(mb_left)) && (global.player_has_weapon == true) && (firing_delay < 0)
{
	recoil = 4;
	firing_delay = 20;
	with (instance_create_layer(x+3,y+1.5,"Weapon",Ospear_thrown))
	{
		speed = 9;
		direction = other.image_angle;
		image_angle = direction;
	}
}
	