/// @description Insert description here
// You can write your code in this editor
if(!activated)
{
	
	hit = instance_place(x,y,obj_player);
	hit.x-=5;
	hit.hp-=damage;
	
	activated = true;
	ability1Time = 0;
}else if(ability1Time < ability1Cooldown*60)
{
	ability1Time++;
}
else
{
	activated = false;
}	