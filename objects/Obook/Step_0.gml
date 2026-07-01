/// @description Insert description here
// You can write your code in this editor
if (point_in_circle(Pplayer.x,Pplayer.y,x,y,64)) && (!instance_exists(Otext))
{
	with (instance_create_layer(x-15,y-16,"Signs",Otext))
	{
		text = other.text;
		length = string_length(text);
	}
	with (Ocamera)
	{
		follow = other.id;
	}
	
}
has_been_read = true;