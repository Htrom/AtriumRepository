//Get player input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_climb = keyboard_check(vk_up);
key_climb_down = keyboard_check(vk_down);
key_z = keyboard_check(ord("Z"));
key_x = keyboard_check(ord("X"));

xpos = x;

if(!abilityBarCreated)
{
	instance_create_layer(10000,0,"HUD",obj_abilitybar);
	
	with(instance_create_layer(10000,0,"HUD",obj_ability1_image))
	{
		sprite_index = other.ability1Image;
	}
	
	with(instance_create_layer(10000,0,"HUD",obj_ability2_image))
	{
		sprite_index = other.ability2Image;
		
	}
	with(instance_create_layer(10000,0,"HUD",obj_ability3_image))
	{
		sprite_index = other.ability3Image;
	}
	with(instance_create_layer(10000,0,"HUD",obj_ability4_image))
	{
		sprite_index = other.ability4Image;
	}
	
	abilityBarCreated = true;
}

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
if(place_meeting(x,y + vsp,obj_wall) && !place_meeting(x,y-1,obj_wall))
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
	
	if(key_jump && !place_meeting(x,y-10,obj_wall)){
		
		state = "jump"
		sprite_index = jumpingSprite;
	}
	else if(key_z && !ability1OnCooldown)
	{
		state = "ability1";	
		sprite_index = ability1Sprite;
		image_index = 0;
	}
	else if(key_x && !ability2OnCooldown)
	{
		state = "ability2";
		sprite_index = ability2Sprite;
		image_index = 0;
		
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
			
			
			if(!ability1OnCooldown)
			{
				ability1OnCooldown = true;
				ability1CooldownCounter = ability1Cooldown + current_time;
			}
			
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
		if(image_index > image_number-2)
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
		
			if(!ability2OnCooldown)
			{
				ability2OnCooldown = true;
				ability2CooldownCounter = ability2Cooldown + current_time;
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
								attackImmuneTime = (other.ability2EndFrame - other.ability2BeginFrame)+1; 
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
		if(image_index > image_number-2)
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
				y -= 1;
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

if(place_meeting(x,y+1,obj_wall) && !place_meeting(x,y-1,obj_wall))
{
	var lastTouched = instance_place(x,y+2,obj_wall);

	
	fallx = lastTouched.x+lastTouched.sprite_width/2;
	fally = lastTouched.y - 64;
}

if(y > 2050)
{
	y = fally;
	x = fallx;
}



		

if(current_time > ability1CooldownCounter)
{
	ability1OnCooldown = false;
}
else{
	ability1OnCooldown = true;
	var displayTime = round((current_time - ability1CooldownCounter)/10);

	if(displayTime % 25 == 0 && displayTime < 0)
	{
		ability1CooldownTimeDis = abs(displayTime/100);
	}else if(abs(displayTime/100) > 0)
	{
		ability1CooldownTimeDis = .5;
	}
}


if(current_time > ability2CooldownCounter)
{
	ability2OnCooldown = false;
}
else{
	ability2OnCooldown = true;
	var displayTime = round((current_time - ability2CooldownCounter)/10);

	if(displayTime % 25 == 0 && displayTime < 0)
	{
	
		ability2CooldownTimeDis = abs(displayTime/100);
	}
	else if(abs(displayTime/100) > 0)
	{
		ability1CooldownTimeDis = .5;
	}
}

	
if(current_time > ability3CooldownCounter)
{
	ability3OnCooldown = false;
	
}
else{
	ability3OnCooldown = true;
	var displayTime = round((current_time - ability3CooldownCounter)/10);

	if(displayTime % 25 == 0 && displayTime < 0)
	{
	
		ability3CooldownTimeDis = abs(displayTime/100) + .5;
	}
	else if(abs(displayTime/100) > 0)
	{
		ability1CooldownTimeDis = .5;
	}
}


if(current_time > ability4CooldownCounter)
{
	ability4OnCooldown = false;
}
else{
	ability4OnCooldown = true;
	var displayTime = round((current_time - ability4CooldownCounter)/10);

	if(displayTime % 25 == 0 && displayTime < 0)
	{
	
		ability4CooldownTimeDis = abs(displayTime/100)+ .5;
	}
	else if(abs(displayTime/100) > 0)
	{
		ability1CooldownTimeDis = .5;
	}
}



with(obj_ability1_image)
{
	onCooldown = other.ability1OnCooldown;
	timeDis = other.ability1CooldownTimeDis;
}

with(obj_ability2_image)
{
	onCooldown = other.ability2OnCooldown;
	timeDis = other.ability2CooldownTimeDis;
}

with(obj_ability3_image)
{
	onCooldown = other.ability3OnCooldown;
	timeDis = other.ability3CooldownTimeDis;
}

with(obj_ability4_image)
{
	onCooldown = other.ability4OnCooldown;
	timeDis = other.ability4CooldownTimeDis;
}


		