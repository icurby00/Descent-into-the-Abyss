/// @description Insert description here
// You can write your code in this editor
if (point_in_circle(Pplayer.x, Pplayer.y, x, y, 64) && !instance_exists(Otext))
{
    
    with (instance_create_layer(x, y - 32, "Signs", Otext))
    {
        text = other.text;
        length = string_length(text);
    }

    
    with (Ocamera)
    {
        follow = other.id;
    }
}


else if (instance_exists(Otext) && keyboard_check_pressed(vk_enter))
{
    with (Otext) instance_destroy();
    with (Ocamera) follow = Pplayer;
}





