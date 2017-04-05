/// @description Draw the game information

var player_text = "";
if(is_server)
{
	player_text = "HOST";
}
else
{
	player_text = "CLIENT";
}
draw_text(2, 16, player_text);
