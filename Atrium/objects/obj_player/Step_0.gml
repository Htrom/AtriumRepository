

//Get player input
if(!player2){
//key_right = keyboard_check(vk_right);
//key_left = keyboard_check(vk_left);
//key_jump = keyboard_check(vk_space);
//key_climb = keyboard_check(vk_up);
//key_climb_down = keyboard_check(vk_down);
//key_z = keyboard_check(ord("Z"));
//key_x = keyboard_check(ord("X"));
//key_c = keyboard_check(ord("C"));


//0 up dpad
//1 down dpad
//2 left dpad
//3 right dpad
//4 start button
//5 select button
//6 left analog press
//7 right analog press

//if(usingGamePad)
//{
	if(gamepad_axis_value(0, gp_axislh) > 0.3)
	{
		key_right = true;
	}
	else
	{
		key_right = false;
	}
	if(gamepad_axis_value(0, gp_axislh) < -0.3)
	{
		key_left = true;
	}
	else
	{
		key_left = false;
	}
	
	if(gamepad_axis_value(0, gp_axislv) < -.5)
	{
		key_climb = true;
	}
	else
	{
		key_climb = false;
	}
	
	if(gamepad_axis_value(0, gp_axislv) > .5)
	{
		key_down = true;
	}
	else
	{
		key_down = false;
	}
	
	
	
	key_jump = gamepad_button_check(0, gp_face4);
	key_jump_released = gamepad_button_check_released(0, gp_face4);
	key_z = gamepad_button_check(0, gp_face1);
	key_x = gamepad_button_check(0, gp_face3);
	
	if(gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_shoulderrb) || gamepad_button_check(0, gp_shoulderlb))
	{
		key_c = true;
	}
	else
	{
		key_c = false;
	}
	
}
//}

	
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
if(key_jump)
{
	if(!jump_started)
	{
		jump_started = true;
		jump_start_time = current_time;
	}
	if(current_time > jump_start_time + jump_short_time && place_meeting(x,y+1,obj_wall) && jump_started)
	{
		//is_normal_jump = true;
		vsp = -jumpSpeed;
		jump_started = false;
		y -= 8;
	}
}

if(key_jump_released)
{
	
	if(place_meeting(x,y+1,obj_wall) && current_time < jump_start_time + jump_short_time)
	{
		//is_normal_jump = false;
		vsp = -jumpSpeed/1.5;
		jump_started = false;
		y -= 8;
	}
	else
	{
		jump_started = false;
		
	}
	
}


move = key_left + key_right;
if(key_left)
{
	move = -1;
	
	if(dir == 1)
	{
		
		turning = true;
		turning_last_time = current_time;
		hsp_save = hsp;
	}
	dir = -1;
}

if(key_right)
{
	move = 1;
	
	if(dir == -1)
	{
		
		turning = true;
		turning_last_time = current_time;
		hsp_save = hsp;
	}
	dir = 1;
}
if(!place_meeting(x,y+1, obj_wall))
{
	if(hsp < (moveSpeed / 2) && move > 0)
	{
		hsp += move*.1;
	}
	
	if(hsp > -(moveSpeed / 2) && move < 0)
	{
		hsp += move*.1;
	}
	
	if(vsp < 1 && vsp > -1 && key_down)
	{
		vsp = 10;
	}
	
}
else
{
	if(move != 0)
	{
		if(hsp < moveSpeed && move > 0)
		{
			hsp += move*.4;
		}if(hsp > -moveSpeed && move < 0)
		{
			hsp += move*.4;
		}
	}
	else
	{
		if(abs(hsp) > .7 && !turning)
		{
			hsp -= sign(hsp)*.6;
		}
		else if(turning)
		{
			if(current_time > turning_time + turning_last_time)
			{
				turning = false;
				
			}
			if(key_jump)
			{
				hsp = hsp_save;
			}
		}
		else
		{
			hsp = 0;
		}
	}
	
}



if(vsp < 30)
{
	vsp += grav;
}


//Horizontal Collison
if(place_meeting(x+hsp+(sign(hsp)*2),y-1,obj_wall))
{
	while(!place_meeting(x+sign(hsp),y-1,obj_wall))
	{
		x +=sign(hsp)/2;
	}
	hsp = 0;
	
}

//Vertical Collison
//if(!place_meeting(x,y-3,obj_wall))
//{
	if(place_meeting(x,y + vsp,obj_wall))
	{
		while(!place_meeting(x,y+sign(vsp),obj_wall))
		{
			y +=sign(vsp)/2;
		}
		vsp = 0;
	}
//}



switch (state)
{
	
	case "ground":
	
	
	if(key_jump && !place_meeting(x,y-10,obj_wall) && place_meeting(x,y+1,obj_wall)){
		
		state = "jump"
		//sprite_index = jumpingSprite;
	}
	else if(key_z && !ability1OnCooldown && !stamina_cooling)
	{
		state = "ability1";	
		sprite_index = ability1Sprite;
		image_index = 0;
		current_stamina -= ability1StaminaDrain;
	}
	else if(key_x && !ability2OnCooldown && !stamina_cooling)
	{
		state = "ability2";
		sprite_index = ability2Sprite;
		image_index = 0;
		current_stamina -= ability2StaminaDrain;
		
	}
	else if(key_c && !ability3OnCooldown && !stamina_cooling)
	{
		state = "ability3";
		sprite_index = ability3Sprite;
		image_index = 0;
		current_stamina -= ability3StaminaDrain;
		
	}
	
	else if(key_right)
	{
		if(place_meeting(x,y+1,obj_wall))
		{
			sprite_index = moveSprite;
			sprite_set_speed(moveSprite,12,0);
			image_xscale = 1;
		}
		
	}
	else if(key_left)
	{
		if(place_meeting(x,y+1,obj_wall))
		{
			sprite_index = moveSprite;
			sprite_set_speed(moveSprite,12,0);
			image_xscale = -1;
		}
		
	}
	
	else if((key_climb || key_down) && place_meeting(x,y+1,obj_ladder_air))
	{
		state = "climb";
	}
	else
	{
		//if(place_meeting(x,y+1,obj_wall))
		//{
			sprite_index = idleSprite;
		//}
	}
	
	break;
	
	
	case "climb":
	if(place_meeting(x,y+1,obj_ladder_air))
	{
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
		else if(key_down)
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
			sprite_set_speed(moveSprite,12,0)
			state = "jump";
		}
		else
		{
			vsp = 0;
			sprite_set_speed(moveSprite,0,0)
				sprite_index = moveSprite;
		}
		hsp = 0;
	}
	else
	{
		sprite_set_speed(moveSprite,12,0)
		state = "ground";
	}
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
				//ability1OnCooldown = true;
				//ability1CooldownCounter = ability1Cooldown + current_time;
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
								current_health -= other.ability1Damage;
								image_xscale = sign(hsp);
								if(current_health < 0)
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
				//ability2OnCooldown = true;
				//ability2CooldownCounter = ability2Cooldown + current_time;
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
								current_health -= other.ability2Damage;
								image_xscale = sign(hsp);
								if(current_health < 0)
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
		
		case "ability3":
			sprite_index = ability3Sprite;
		//if(place_meeting(x,y+1,obj_wall))
		//{
		//	hsp = 0;
		//}
			immune = true;
		
			if(!ability3OnCooldown)
			{
				//ability3OnCooldown = true;
				//ability3CooldownCounter = ability3Cooldown + current_time;
			}
		if(1!=1)
		{
			if(image_index >= ability3BeginFrame && image_index <=ability3EndFrame)
			{
			
				with(instance_create_depth(x,y,0,ability3Hitbox))
				{
					ability3EndFrame = other.ability3EndFrame;
					ability3BeginFrame = other.ability3BeginFrame;
					ability3Damage = other.ability3Damage;
					ability3VerKnockBack = other.ability3VerKnockBack;
					ability3HorKnockBack = other.ability3HorKnockBack;
				
				
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
									attackImmuneTime = (other.ability3EndFrame - other.ability3BeginFrame)+1; 
									vsp = -other.ability3VerKnockBack;
									hsp = sign(x-other.x)*other.ability3HorKnockBack;
									current_health -= other.ability3Damage;
									image_xscale = sign(hsp);
									if(current_health < 0)
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
		hsp = 10*sign(image_xscale);
		if(image_index > image_number-2)
		{
			
			state = "ground";
			immune = false;
			if(image_xscale = 1)
			{
				x += ability3XChange;
			}
			else
			{
				x -= ability3XChange;
			}
			y += ability3YChange;
		}
		break;
		
		case "jump":
			
			if(place_meeting(x,y+1,obj_wall))
			{
				//y -= 4;
				//vsp = -jumpSpeed;
			}else{
				state = "ground";
			}
			
		break;
}

if(!place_meeting(x,y+1,obj_wall) && state!="ability1" && state!="ability2" && state!="ability3" && state!="ability4" && state != "climb")
{
	sprite_index = jumpingSprite;
}



if(!player2){
	x += hsp;
	y += vsp;
	if(y > 2050)
	{
		y = fally;
		x = fallx;
		current_health -= current_health*.4 + 10;
	}
}

if(place_meeting(x,y+1,obj_wall) && !place_meeting(x,y-1,obj_wall))
{
	var lastTouched = instance_place(x,y+2,obj_wall);

	
	fallx = lastTouched.x+lastTouched.sprite_width/2;
	fally = lastTouched.y - 66;
}


if(current_stamina < 0)
{
	stamina_cooling = true;
	current_stamina = 0;
	stamina_cooldown_start = current_time;
	
}


	
if(current_time >= last_time + 10)
{
	
	if(stamina_cooling)
	{
		if(current_time >= stamina_cooldown_start + stamina_cooldown_time)
		{
			if(current_stamina < 10)
			{
				if(current_stamina < max_stamina)
				{
					current_stamina += stamina_regen_rate;
				}
			}
			else
			{
				stamina_cooling = false;
			}
		}
	}
	else
	{
		if(current_stamina < max_stamina)
		{
			current_stamina += stamina_regen_rate;
		}
	}
	
	if(current_health < max_health)
	{
		current_health += health_regen_rate;
	}
	last_time = current_time;
}
		



//if(current_time > ability1CooldownCounter)
//{
//	ability1OnCooldown = false;
//}
//else{
//	ability1OnCooldown = true;
//	var displayTime = round((current_time - ability1CooldownCounter)/10);

//	if(displayTime % 25 == 0 && displayTime < 0)
//	{
//		ability1CooldownTimeDis = abs(displayTime/100);
//	}else if(abs(displayTime/100) > 0)
//	{
//		ability1CooldownTimeDis = .5;
//	}
//}


//if(current_time > ability2CooldownCounter)
//{
//	ability2OnCooldown = false;
//}
//else{
//	ability2OnCooldown = true;
//	var displayTime = round((current_time - ability2CooldownCounter)/10);

//	if(displayTime % 25 == 0 && displayTime < 0)
//	{
	
//		ability2CooldownTimeDis = abs(displayTime/100);
//	}
//	else if(abs(displayTime/100) > 0)
//	{
//		ability1CooldownTimeDis = .5;
//	}
//}

	
//if(current_time > ability3CooldownCounter)
//{
//	ability3OnCooldown = false;
	
//}
//else{
//	ability3OnCooldown = true;
//	var displayTime = round((current_time - ability3CooldownCounter)/10);

//	if(displayTime % 25 == 0 && displayTime < 0)
//	{
	
//		ability3CooldownTimeDis = abs(displayTime/100) + .5;
//	}
//	else if(abs(displayTime/100) > 0)
//	{
//		ability1CooldownTimeDis = .5;
//	}
//}


//if(current_time > ability4CooldownCounter)
//{
//	ability4OnCooldown = false;
//}
//else{
//	ability4OnCooldown = true;
//	var displayTime = round((current_time - ability4CooldownCounter)/10);

//	if(displayTime % 25 == 0 && displayTime < 0)
//	{
	
//		ability4CooldownTimeDis = abs(displayTime/100)+ .5;
//	}
//	else if(abs(displayTime/100) > 0)
//	{
//		ability1CooldownTimeDis = .5;
//	}
//}



//with(obj_ability1_image)
//{
//	onCooldown = other.ability1OnCooldown;
//	timeDis = other.ability1CooldownTimeDis;
//}

//with(obj_ability2_image)
//{
//	onCooldown = other.ability2OnCooldown;
//	timeDis = other.ability2CooldownTimeDis;
//}

//with(obj_ability3_image)
//{
//	onCooldown = other.ability3OnCooldown;
//	timeDis = other.ability3CooldownTimeDis;
//}

//with(obj_ability4_image)
//{
//	onCooldown = other.ability4OnCooldown;
//	timeDis = other.ability4CooldownTimeDis;
//}


if(current_health <= 0)
{
	current_health = max_health;
	x = 1000;
	y = 700;
}