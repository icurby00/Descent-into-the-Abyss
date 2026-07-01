/// @description Insert description here
// You can write your code in this editor
if (has_been_read) {
    if (instance_exists(Otext)) {
        with (Otext) instance_destroy();
    }

   
    with (Ocamera) {
        follow = Pplayer;
    }
    instance_destroy();
}