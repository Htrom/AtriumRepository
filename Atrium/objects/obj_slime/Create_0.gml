/// @description Insert description here
// You can write your code in this editor
master = 1;
moveSpeed = 1.5;
grav = .23;
hsp = 0;
vsp = 0;
damage = 1;
ability1Cooldown = 0.5;
ability1Time = 0;
current_health = 150;
activated = false;
moveSprite = spr_slime_move;
hit = 0;

hspAccel = 0.23;
attackImmuneTime = 0;
attackImmuneCounter = 0;

healthbar = instance_create_depth(x,y,0,obj_healthbar);