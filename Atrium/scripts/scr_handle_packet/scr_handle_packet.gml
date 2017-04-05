///@descption scr_handle_packet(buffer)
var buffer = argument[0];
var message_id = buffer_read(buffer, buffer_u8);

switch(message_id)
{
	case 1:
		// Read from the buffer
		var xpos = buffer_read(buffer, buffer_u16);
		var ypos = buffer_read(buffer, buffer_u16);
		var nkey_left = buffer_read(buffer, buffer_bool);
		var	nkey_right = buffer_read(buffer, buffer_bool);
		var	nkey_jump = buffer_read(buffer, buffer_bool);
		var	nkey_climb = buffer_read(buffer, buffer_bool);
		var	nkey_climb_down = buffer_read(buffer, buffer_bool);
		var	nkey_z = buffer_read(buffer, buffer_bool);
		var	nkey_x = buffer_read(buffer, buffer_bool);
		// Set the position
		with(instance_find(obj_player,1))
		{
			player2 = true;
			x = xpos;
			y = ypos;
			key_left = nkey_left;
			key_right = nkey_right;
			key_jump = nkey_jump;
			key_climb = nkey_climb;
			key_climb_down = nkey_climb_down;
			key_z = nkey_z;
			key_x = nkey_x;
			
		}
		break;
	
	
}
