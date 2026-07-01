/// @description Insert description here
// You can write your code in this editor
hsp = walkspd * dir;
vsp += grv;
x = x + hsp;
move_and_collide();



//turn around
if (place_meeting(x + dir, y, [tilemap1, tilemap2, tilemap3, tilemap4])) {
	dir = dir * -1;
}
