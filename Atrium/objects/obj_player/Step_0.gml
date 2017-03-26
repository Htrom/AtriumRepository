//Get player input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_climb = keyboard_check(vk_up);
key_climb_down = keyboard_check(vk_down);
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



switch (state)
{
	
	case "ground":
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
	else if(key_climb || key_climb_down)
	{
		if(place_meeting(x,y+1,obj_ladder_air))
		{
		
			state = "climb";
		}
	}
	else if(key_x)
	{

		sprite_index = ability1Sprite;
		if(image_index >=ability1BeginFrame && image_index <=ability1EndFrame)
		{
			
			with(instance_create_depth(x,y,0,hitbox))
			{
				image_xscale = other.image_xscale;
				
				
				l = instance_place_list(x,y,obj_monster)
				if(!ds_list_empty(l))
				{
					for(var i = 0; i < ds_list_size(l); i++)
					{
						with(ds_list_find_value(l,i))
						{
					
							if(hit == 0)
							{
								hit = 1;
								vsp = -6;
								hsp = sign(x-other.x)*6;
								hp -= other.ability1Damage;
								image_xscale = sign(hsp);
								if(hp < 0)
								{
									i--;
								}							
							}
						}
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
	break;
	
	case "climb":
	if(key_climb)
	{
		if(place_meeting(x,y+1,obj_ladder_air))
		{
		
			vsp = -4;
		}else
		{
			state = "ground";
		}
	}
	else if(key_climb_down)
	{
		if(place_meeting(x,y+1,obj_ladder_air))
		{
		
			vsp = 4;
		}else
		{
			state = "ground";
		}
		
	}
	else if(key_jump && !place_meeting(x,y+1,obj_wall)){
		vsp = -jumpSpeed;
		state = "ground";
	}
	else
	{
		vsp = 0;
	}
	hsp = 0;
	break;
}

if(!place_meeting(x,y+1,obj_wall) && !key_x)
{
	sprite_index = jumpingSprite;	
}

x += hsp;
y += vsp;


