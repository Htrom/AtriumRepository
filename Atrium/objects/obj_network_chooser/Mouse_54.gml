/// @description Insert description here
// You can write your code in this editor
if(!serverstarted){
serverstarted = true;
global.role = "HOST";
instance_create_depth(0, 0, 0, obj_network);
instance_create_depth(0, 0, 0, obj_game);

for(var i = 0; i < 20; i++)
{
	with(instance_create_depth(300 + random_range(0,1000),0, 0, obj_slime))
	{
		master = 1;
	}
}
}