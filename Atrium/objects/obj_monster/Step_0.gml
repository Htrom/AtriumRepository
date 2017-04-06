

nearestPlayer = instance_nearest(x,y,obj_player);
if(nearestPlayer.x > x+15)
{
	if(hsp<moveSpeed)
	{
		hsp += hspAccel;
	}
	ability1 = 0;
	sprite_index = moveSprite;
	image_xscale = 1;
	
}else if(nearestPlayer.x < x)
{
	if(hsp>-moveSpeed)
	{
		hsp -= hspAccel;
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



if(place_meeting(x,y+1,obj_wall)){
	state = "ground";
}
else
{
	state = "falling";
}

if(state == "ground")
{
	if(!place_meeting(x+sign(hsp)*30,y + 2,obj_wall) && hit == 0)
	{

		hsp = 0;

	}
}

if(attackImmuneCounter > attackImmuneTime+5)
{
	hit = 0;
}
if(hit == 1)
{
	attackImmuneCounter++;
}

with(healthbar)
{
	x = other.x - 42;
	y = other.y - 50;
	image_xscale = other.current_health / 100;
	image_yscale = .25;
	if(other.current_health < 0)
	{
		instance_destroy();
	}
}


x += hsp;
y += vsp;

if(y > 2054)
{
	with(healthbar){
		instance_destroy();
	}
	instance_destroy();
}