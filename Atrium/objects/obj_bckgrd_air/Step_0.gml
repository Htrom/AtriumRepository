/// @description Insert description here
// You can write your code in this editor

nearestPlayer = instance_find(obj_player,0);

if(nearestPlayer.x >957 && nearestPlayer.x <= (4800))
{
	x = nearestPlayer.x*.9 - 1400;
}

if(nearestPlayer.y >512 && nearestPlayer.y <= (1536))
{
	y = nearestPlayer.y*.9 - 750;
}
