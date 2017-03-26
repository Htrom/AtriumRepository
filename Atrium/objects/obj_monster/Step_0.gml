

nearestPlayer = instance_nearest(x-64,y,obj_player);
if(nearestPlayer.x > x+65)
{
	if(hsp<moveSpeed)
	{
		hsp += hspAccel;
	}else
	{
		hsp = moveSpeed;
	}
	ability1 = 0;
	sprite_index = moveSprite;
	image_xscale = 1;
	
}else if(nearestPlayer.x < x+35)
{
	if(hsp>-moveSpeed)
	{
		hsp -= hspAccel;
	}
	else
	{
		hsp = -moveSpeed;
	}
	ability1 = 0;
	sprite_index = moveSprite;
	image_xscale = -1;
}else
{
//	hsp = 0;
	sprite_index = moveSprite;
	
}

if(vsp < 30)
{
	vsp += grav;
}


//Horizontal Collison
if(place_meeting(x+hsp,y,obj_wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x +=sign(hsp);
	}
	hsp = 0;
	
}

//Vertical Collison
if(place_meeting(x,y + vsp,obj_wall))
{
	while(!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y +=sign(vsp);
	}
	vsp = 0;
	
}



if(vsp == 0){
	state = "ground";
}
else
{
	state = "falling";
}

if(state == "ground")
{
	if(!place_meeting(x+hsp*10,y + 1,obj_wall) )
	{

		hsp = 0;

	}
}
hit = 0;

x += hsp;
y += vsp;

