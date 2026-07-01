/// @description Insert description here
// You can write your code in this editor
var halfw = w * .5;

//draw box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,radiusx,radiusy,false);
draw_sprite(spr_marker,0,x + 25,y);
draw_set_alpha(1);

//draw text
DrawSetText(c_white,fSign,fa_center, fa_top);
draw_text(x,y-h-border,text_current);