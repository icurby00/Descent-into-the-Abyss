/// @description Insert description here
// You can write your code in this editor
with(Oplayer)
	{
	var near = instance_nearest(other.x, other.y, Ocheckpoint);

		other.x = near.x;
		other.y = near.y-10;
	}
