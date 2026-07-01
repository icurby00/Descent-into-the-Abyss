/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, [ground1, ground2, ground3, ground4, Ograss]))
{
    instance_create_layer(x,y,"Player",Ospear_imbedded);
	instance_destroy(Ospear_thrown);
}