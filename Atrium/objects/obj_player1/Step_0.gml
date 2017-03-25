//Get player input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_x = keyboard_check(ord("X"));

//React to input
move = key_left + key_right;
if(key_left)
{
	move = -1;
}

if(key_right)
{
	move = 1;
}
hsp = move * movespeed;

if(vsp < 10)
{
	vsp += grav;
}

if(place_meeting(x,y+1,obj_wall))
{
	vsp = key_jump * -jumpspeed;
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

x += hsp;
y += vsp;



if(key_right)
{
	if(place_meeting(x,y+1,obj_wall))
	{
		sprite_index = spr_player_walking;
	}
	image_xscale = 1;
}
else if(key_left)
{
	if(place_meeting(x,y+1,obj_wall))
	{
		sprite_index = spr_player_walking;
	}
	image_xscale = -1;
}
else if(key_x)
{

	sprite_index = spr_player_attack;
	
}
else
{
	if(place_meeting(x,y+1,obj_wall))
	{
		sprite_index = spr_player_idle;
	}
}

if(!place_meeting(x,y+1,obj_wall) && !key_x)
{
	sprite_index = spr_player_jumping;	
}

