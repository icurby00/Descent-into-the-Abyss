/// @description Insert description here
// You can write your code in this editor
spd = 0.25;
letters = 0;
text = "This is a test string\nsecond line";
length = string_length(text);
text_current = "";
w = 0;
h = 0;
border = 10;
radiusx = 15;
radiusy = 15;
if global.textspeed = 0
{
	spd = 0.15;
}
else if (global.textspeed = 1)
{
	spd = 0.25;
}
else 
{
	spd = 0.5;
}