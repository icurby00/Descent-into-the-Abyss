/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case PLAYERSTATE.movement:
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_jump =  keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));


		var move = key_right - key_left;

				hsp = move * walkspd;
				vsp = vsp + grv;

		if move != 0 
		{
			facing_dir = move;
			image_xscale = facing_dir;
			direction = point_direction(x, y, x + move, y);
		}


		if (place_meeting(x,y+1, [tilemap1, tilemap2, tilemap3, tilemap4, Olocked_door, Ospear_imbedded]) && (key_jump))
			{
				vsp = -10;
				grv = 0.3;
			}
		canjump -= 1;
		
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2, tilemap3, tilemap4, Olocked_door]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2, tilemap3, tilemap4, Olocked_door]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2, tilemap3, tilemap4, Olocked_door]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2, tilemap3, tilemap4, Olocked_door]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
			
			//oneway platform collision
			
			var _oneWayPlatform = instance_place(x, y + max(1, vsp), Ospear_imbedded);
			if (_oneWayPlatform && bbox_bottom <= _oneWayPlatform.bbox_top) {
				if (vsp > 0 ) {
					while (!place_meeting(x,y + 1, Ospear_imbedded)) {
						y += sign(vsp);
						
					}
					vsp = 0;
					grv = 0;
				}
			}
			if (tilemap_get_at_pixel(tiles,x,y))
		{
			can_wall_run = true;
				if (can_wall_run)
				{
					state = PLAYERSTATE.wall_run;
				}
		}
	
	
		if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
		{
			buffer_counter = buffer_max;
		}
		if buffer_counter > 0				
		{
			buffer_counter -= 1;			 
			if  canjump > 0
			{
				vsp = -12;					
				buffer_counter = 0;	      
			}
		}
		

		if (hsp != 0 ) image_xscale = sign(hsp);
		if (hsp == 0 && vsp == 0)
			{
				if global.player1 = true
				{
					sprite_index = spr_player_right_stationary;
				} else if global.player2 = true
				{
					sprite_index = spr_player_2_right_stationary;
				}
				idle = true;
				idle_cooldown--;
				if (idle = true && idle_cooldown <= 0)
				{
					state = PLAYERSTATE.idle;
				}
			} else
				if global.player1 = true 
					{
						sprite_index = spr_player_right;
					}
					else if global.player2 = true
					{
						sprite_index = spr_player_2_right;
					}
	
	} break;
	case PLAYERSTATE.idle:
	{
		if global.player1 = true
		{
		image_speed = 1;
		sprite_index = spr_player_right_idle;
		}
		if global.player2 = true
		{
			image_speed = 1;
			sprite_index = spr_player_2_right_idle;
		}
			if (image_speed > 0)
			{
				if (image_index >= image_number - 1) || keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))
				{
					state = PLAYERSTATE.movement;
					idle = false;
					idle_cooldown = 300;
				}
			}
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2, tilemap3, tilemap4]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2, tilemap3, tilemap4]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2, tilemap3, tilemap4]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2, tilemap3, tilemap4]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
	}break;
	case PLAYERSTATE.wall_run:
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
		var move = key_right - key_left;
		var wall_run_spd = key_down - key_up;
		hsp = move * wall_spd;
		vsp = wall_run_spd * wall_spd;
		if move != 0
			{
				facing_dir = move;
				image_xscale = facing_dir;
				direction = point_direction(x, y, x + move, y);
			}
		
		
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2, tilemap3, tilemap4]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2, tilemap3, tilemap4]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2, tilemap3, tilemap4]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2, tilemap3, tilemap4]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
		if (!tilemap_get_at_pixel(tiles, x, y))
		{
			state = PLAYERSTATE.movement;
		}
	}

	
}
show_debug_message(global.goldbar)