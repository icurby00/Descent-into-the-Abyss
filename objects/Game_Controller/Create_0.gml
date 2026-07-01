/// @description Insert description here
// You can write your code in this editor
randomise();
global.playerselect = false;
global.player1 = false;
global.player2 = false;
global.textspeed = noone;

enum PLAYERSTATE
{
	movement,
	idle,
	wall_run
}
enum ENEMYICE 
{
	movement,
	idle,
	explode
	
}
global.hp = 3;

global.goldbar = 0;
