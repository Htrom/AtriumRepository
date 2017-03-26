//Get player input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_climb = keyboard_check(vk_up);
key_climb_down = keyboard_check(vk_down);
key_z = keyboard_check(ord("Z"));
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
	if(key_z)
	{
		state = "ability1";	
	}
	else if(key_x)
	{
		state = "ability2";
	}
	else if(key_climb || key_climb_down)
	{
		if(place_meeting(x,y+1,obj_ladder_air))
		{
		
			state = "climb";
		}
	}
	else if(key_right)
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
	
	else
	{
		if(place_meeting(x,y+1,obj_wall))
		{
			sprite_index = idleSprite;
		}
	}
	
	if(key_jump && !place_meeting(x,y-10,obj_wall)){
		state = "jump"
	}
	
	
	
	break;
	
	case "climb":
	if(key_climb)
	{
		if(place_meeting(x,y+1,obj_ladder_air))
		{
		
			vsp = -4;
			sprite_set_speed(moveSprite,15,0)
			sprite_index = moveSprite;
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
			
			sprite_set_speed(moveSprite,-15,0)
			sprite_index = moveSprite;
			
		}else
		{
			state = "ground";
		}
		
	}
	else if(key_jump && !place_meeting(x,y+1,obj_wall)){
		vsp = key_jump * -jumpSpeed;
		sprite_set_speed(moveSprite,15,0)
		state = "jump";
	}
	else
	{
		vsp = 0;
		sprite_set_speed(moveSprite,0,0)
			sprite_index = moveSprite;
	}
	hsp = 0;
	break;
	
	case "ability1":
		sprite_index = ability1Sprite;
		if(place_meeting(x,y+1,obj_wall))
		{
			hsp = 0;
		}
		if(image_index >= ability1BeginFrame && image_index <=ability1EndFrame)
		{
			
			with(instance_create_depth(x,y,0,ability1Hitbox))
			{
				ability1EndFrame = other.ability1EndFrame;
				ability1BeginFrame = other.ability1BeginFrame;
				ability1Damage = other.ability1Damage;
				ability1VerKnockBack = other.ability1VerKnockBack;
				ability1HorKnockBack = other.ability1HorKnockBack;
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
								attackImmuneCounter = 0;
								attackImmuneTime = (other.ability1EndFrame - other.ability1BeginFrame); 
								vsp = -other.ability1VerKnockBack;
								hsp = sign(x-other.x)*other.ability1HorKnockBack;
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
		if(image_index > image_number-3)
		{
			state = "ground";
			
			if(image_xscale = 1)
			{
				x += ability1XChange;
			}
			else
			{
				x -= ability1XChange;
			}
			y += ability1YChange;
		}
		break;
		
	case "ability2":
			sprite_index = ability2Sprite;
		if(place_meeting(x,y+1,obj_wall))
		{
			hsp = 0;
		}
		if(image_index >= ability2BeginFrame && image_index <=ability2EndFrame)
		{
			
			with(instance_create_depth(x,y,0,ability2Hitbox))
			{
				ability2EndFrame = other.ability2EndFrame;
				ability2BeginFrame = other.ability2BeginFrame;
				ability2Damage = other.ability2Damage;
				ability2VerKnockBack = other.ability2VerKnockBack;
				ability2HorKnockBack = other.ability2HorKnockBack;
				
				
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
								attackImmuneCounter = 0;
								attackImmuneTime = (other.ability2EndFrame - other.ability2BeginFrame); 
								vsp = -other.ability2VerKnockBack;
								hsp = sign(x-other.x)*other.ability2HorKnockBack;
								hp -= other.ability2Damage;
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
		if(image_index > image_number-3)
		{
			state = "ground";
			if(image_xscale = 1)
			{
				x += ability2XChange;
			}
			else
			{
				x -= ability2XChange;
			}
			y += ability2YChange;
		}
		break;
		
		case "jump":
			if(place_meeting(x,y+1,obj_wall))
			{
				vsp = key_jump * -jumpSpeed;	
			}else{
				state = "ground";
			}
			
		break;
}

if(!place_meeting(x,y+1,obj_wall) && state!="ability1" && state!="ability2" && state!="ability3" && state!="ability4" && state != "climb")
{
	sprite_index = jumpingSprite;
}

x += hsp;
y += vsp;

if(place_meeting(x,y+1,obj_wall))
{
	fallx = x - sign(hsp)*70;
	fally = y;
}

if(y > 2050)
{
	y = fally;
	x = fallx;
}