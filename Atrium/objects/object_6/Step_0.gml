/// @description Insert description here
// You can write your code in this editor

nearestPlayer = instance_nearest(x,y, obj_player);

if(nearestPlayer.x >960 && nearestPlayer.x < (4800))
{
	x = nearestPlayer.x*.9 - 1400;
}

if(nearestPlayer.y >512 && nearestPlayer.y < (1536))
{
	y = nearestPlayer.y*.9 - 750;
}
