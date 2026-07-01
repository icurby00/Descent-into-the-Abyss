/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case ENEMYICE.idle:
	{
		if (alarm[0] == -1) {
			alarm[0] = room_speed * 3;
		}
		
	}break;
	case ENEMYICE.movement:
	{
		walkspd = 7;
		// collide
		if (place_meeting(x+hsp,y,[tilemap1, tilemap2, tilemap3, tilemap4, Ograss])) 
		{
			while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2, tilemap3, tilemap4, Ograss]))
			{
				x = x + sign(hsp);
			}
			hsp = -hsp;
		}
		x = x + hsp;
		
		if (hsp != 0 ) image_xscale = sign(hsp);
		if (alarm[2] == -1) {
			alarm[2] = room_speed;
		}
	}break;
	case ENEMYICE.explode:
	{
		instance_create_layer(x,y,"Enemies",Oice_guy);
		instance_create_layer(x,y,"Enemies",Oice_guy);
		instance_destroy();
		global.goldbar++;
		
		
	}
	
	
}

vsp = vsp + grv;


			


		//Vertical Collison
		if (place_meeting(x,y+vsp,[tilemap1, tilemap2, tilemap3, tilemap4, Ograss]))
		{
			while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2, tilemap3, tilemap4, Ograss]))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
		y = y + vsp;