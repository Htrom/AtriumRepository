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
ability1Hitbox = obj_ganon_ability1_hitbox;
ability1BeginFrame = 8;
ability1EndFrame = 9;
ability1Damage = 50;
ability1KnockBack = 10;

//ability2
ability2 = "GroundSmash";
ability2Hitbox = obj_ganon_attack_hitbox;
ability2BeginFrame = 8;
ability2EndFrame = 9;
ability2Damage = 50;
ability2KnockBack = 10;


//sprites
moveSprite = spr_ganon_move;
idleSprite = spr_ganon_idle;
jumpingSprite = spr_ganon_jumping;
ability1Sprite = spr_ganon_attack;
climbingSprite = spr_ganon_jumping;