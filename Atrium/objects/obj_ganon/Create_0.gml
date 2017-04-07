//Basic set up
camera_set_view_pos(view_camera[0], x, y);
camera_set_view_size(view_camera[0], 1920, 1024);

//Setting up object target information
camera_set_view_target(view_camera[0], instance_find(obj_ganon,0));
camera_set_view_speed(view_camera[0], -1, -1);
camera_set_view_border(view_camera[0], 960, 512);



player2 = false;
//Ganon Instantiate
abilityBarCreated = false;
items = "array of items";

moveSpeed = 3;
attackSpeed = 7.5;
jumpSpeed = 6.5;
grav = 0.25;


//health
max_health = 100;
current_health = max_health;
health_regen_rate = 0.03;
instance_create_layer(x, y, "Background", obj_health_player);

//stamina
max_stamina = 100;
current_stamina = max_stamina;
stamina_regen_rate = .2;
stamina_cooling = false;
stamina_cooldown_start = current_time;
stamina_cooldown_time = 2000;

instance_create_layer(x, y, "Background", obj_stamina_player);



evadeChange = 0;
critChance = 0;
hsp = 0;
vsp = 0;
state = "ground";

//ability1
ability1 = "SwordStrike";
ability1StaminaDrain = 25;
ability1Image = spr_ganon_ability1_image;
ability1Cooldown = 300;
ability1CooldownCounter = 0;
ability1OnCooldown = false;
ability1CooldownTimeDis = 0;
ability1Sprite = spr_ganon_ability1;
ability1Hitbox = obj_ganon_ability1_hitbox;
ability1BeginFrame = 8;
ability1EndFrame = 9;
ability1Damage = 48;
ability1HorKnockBack = 8;
ability1VerKnockBack = 3;
ability1XChange = 0;
ability1YChange = 0;

//ability2
ability2 = "GroundSmash";
ability2StaminaDrain = 50;
ability2Image = spr_ganon_ability2_image;
ability2Cooldown = 3000;
ability2CooldownCounter = 0;
ability2OnCooldown = false;
ability2CooldownTimeDis = 0;
ability2Sprite = spr_ganon_ability2;
ability2Hitbox = obj_ganon_ability2_hitbox;
ability2BeginFrame = 5;
ability2EndFrame = 7;
ability2Damage = 120;
ability2HorKnockBack = 2;
ability2VerKnockBack = 8;
ability2XChange = 0;
ability2YChange = 0;

//ability3
ability3 = "PowerAbsorb";
ability3StaminaDrain = 30;
ability3Image = spr_ganon_ability3_image;
ability3Cooldown = 4000;
ability3CooldownCounter = 0;
ability3OnCooldown = false;
ability3CooldownTimeDis = 0;
ability3Sprite = spr_ganon_ability3;
//ability3Hitbox = obj_ganon_ability3_hitbox;
ability3BeginFrame = 5;
ability3EndFrame = 7;
ability3Damage = 100;
ability3HorKnockBack = 0;
ability3VerKnockBack = 10;
ability3XChange = 0;
ability3YChange = 0;

//ability4
ability4 = "Ganon";
ability4Image = spr_ganon_ability4_image;
ability4Cooldown = 20000;
ability4CooldownCounter = 0;
ability4OnCooldown = false;
ability4CooldownTimeDis = 0;
//ability4Sprite = spr_ganon_ability4;
//ability4Hitbox = obj_ganon_ability4_hitbox;
ability4BeginFrame = 5;
ability4EndFrame = 7;
ability4Damage = 100;
ability4HorKnockBack = 5;
ability4VerKnockBack = 15;
ability4XChange = 0;
ability4YChange = 0;


//sprites
moveSprite = spr_ganon_move;
idleSprite = spr_ganon_idle;
jumpingSprite = spr_ganon_jumping;

climbingSprite = spr_ganon_jumping;


//miscellaneous
last_time = current_time;
immune = false;