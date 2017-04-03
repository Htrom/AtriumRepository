/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index,-1,xpos,ypos);

if(onCooldown)
{
	draw_sprite(spr_filter,-1,xpos,ypos);
	draw_text(xpos,ypos,timeDis);
}
