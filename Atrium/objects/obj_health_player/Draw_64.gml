with (instance_find(obj_player, 0))
{
	other.x = global.xposability;
	other.y = global.yposability + 120;
	other.image_xscale = (current_health/max_health)*5;
}

draw_sprite(spr_health_max,-1,global.xposability-3,global.yposability + 117);
draw_self();
