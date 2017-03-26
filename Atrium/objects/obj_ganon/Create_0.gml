//Ganon Instantiate

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
ability1Cooldown = 0;
ability1Sprite = spr_ganon_ability1;
ability1Hitbox = obj_ganon_ability1_hitbox;
ability1BeginFrame = 8;
ability1EndFrame = 9;
ability1Damage = 50;
ability1HorKnockBack = 10;
ability1VerKnockBack = 10;
ability1XChange = 0;
ability1YChange = 0;

//ability2
ability2 = "GroundSmash";
ability2Cooldown = 0;
ability2Sprite = spr_ganon_ability2;
ability2Hitbox = obj_ganon_ability2_hitbox;
ability2BeginFrame = 5;
ability2EndFrame = 7;
ability2Damage = 70;
ability2HorKnockBack = 5;
ability2VerKnockBack = 20;
ability2XChange = 0;
ability2YChange = 0;


//sprites
moveSprite = spr_ganon_move;
idleSprite = spr_ganon_idle;
jumpingSprite = spr_ganon_jumping;

climbingSprite = spr_ganon_jumping;