//Ganon Instantiate
abilityBarCreated = false;
items = "array of items";
hp = 300;
moveSpeed = 6;
attackSpeed = 15;
jumpSpeed = 13; 
grav = 1;

evadeChange = 0;
critChance = 0;
hsp = 0;
vsp = 0;
state = "ground";

//ability1
ability1 = "SwordStrike";
ability1Image = spr_ganon_ability1_image;
ability1Cooldown = 300;
ability1CooldownCounter = 0;
ability1OnCooldown = false;
ability1CooldownTimeDis = 0;
ability1Sprite = spr_ganon_ability1;
ability1Hitbox = obj_ganon_ability1_hitbox;
ability1BeginFrame = 8;
ability1EndFrame = 9;
ability1Damage = 38;
ability1HorKnockBack = 10;
ability1VerKnockBack = 10;
ability1XChange = 0;
ability1YChange = 0;

//ability2
ability2 = "GroundSmash";
ability2Image = spr_ganon_ability2_image;
ability2Cooldown = 3000;
ability2CooldownCounter = 0;
ability2OnCooldown = false;
ability2CooldownTimeDis = 0;
ability2Sprite = spr_ganon_ability2;
ability2Hitbox = obj_ganon_ability2_hitbox;
ability2BeginFrame = 5;
ability2EndFrame = 7;
ability2Damage = 100;
ability2HorKnockBack = 5;
ability2VerKnockBack = 15;
ability2XChange = 0;
ability2YChange = 0;

//ability3
ability3 = "PowerAbsorb";
ability3Image = spr_ganon_ability3_image;
ability3Cooldown = 4000;
ability3CooldownCounter = 0;
ability3OnCooldown = false;
ability3CooldownTimeDis = 0;
//ability3Sprite = spr_ganon_ability3;
//ability3Hitbox = obj_ganon_ability3_hitbox;
ability3BeginFrame = 5;
ability3EndFrame = 7;
ability3Damage = 100;
ability3HorKnockBack = 5;
ability3VerKnockBack = 15;
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