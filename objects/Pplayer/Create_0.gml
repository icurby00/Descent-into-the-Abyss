/// @description Insert description here
// You can write your code in this editor
hp = global.hp;
hsp = 0;
vsp = 0;
grv = 0.5;
walkspd = 8;
wall_spd = 14;
can_wall_run = false;
buffer_counter = 0; //initialise the buffer's counter
buffer_max = 5;      //maximum frames allowed for buffer
facing_dir = 1;
direction = 0;
canjump = 0;
idle = false;
idle_cooldown = 300;


GroundId1 = layer_get_id("Tiles_1")
tilemap1  = layer_tilemap_get_id(GroundId1);
GroundId2 = layer_get_id("Tiles_2");
tilemap2 = layer_tilemap_get_id(GroundId2);
GroundId3 = layer_get_id("Tiles_3")
tilemap3  = layer_tilemap_get_id(GroundId3);
GroundId4 = layer_get_id("Tiles_4");
tilemap4 = layer_tilemap_get_id(GroundId4);

layerID = layer_get_id("Wall_Run");
tiles = layer_tilemap_get_id(layerID);

state = PLAYERSTATE.movement;