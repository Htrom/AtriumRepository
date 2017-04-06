with (instance_find(obj_player, 0))
{
	other.x = global.xposability;
	other.y = global.yposability + 140;
	other.image_xscale = (current_stamina/max_stamina)*5;

}

draw_sprite(spr_stamina_max,-1,global.xposability-3,global.yposability + 137);
draw_self();
