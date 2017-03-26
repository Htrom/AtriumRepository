//Get player input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_x = keyboard_check(ord("X"));
xpos = x;
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
hsp = move * moveSpeed;

if(vsp < 30)
{
	vsp += grav;
}

if(place_meeting(x,y+1,obj_wall))
{
	vsp = key_jump * -jumpSpeed;
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
		sprite_index = moveSprite;
	}
	image_xscale = 1;
}
else if(key_left)
{
	if(place_meeting(x,y+1,obj_wall))
	{
		sprite_index = moveSprite;
	}
	image_xscale = -1;
}
else if(key_x)
{

	sprite_index = ability1Sprite;
	if(image_index >=ability1BeginFrame && image_index <=ability1EndFrame)
	{
		with(instance_create_depth(x,y,0,hitbox))
		{
			image_xscale = other.image_xscale;
			with(instance_place(x,y,obj_monster))
			{
				if(hit == 0)
				{
					hit = 1;
					vsp = -10;
					hsp = sign(x-other.x)*4;
					image_xscale = sign(hsp);
				}
			}
		}
	}
	
}
else
{
	if(place_meeting(x,y+1,obj_wall))
	{
		sprite_index = idleSprite;
	}
}

if(!place_meeting(x,y+1,obj_wall) && !key_x)
{
	sprite_index = jumpingSprite;	
}


