/// @description Do networking stuff
var type_event = async_load[? "type"];
switch(type_event)
{
	case network_type_connect:
		instance_create_depth(obj_player.x, 0, 0, obj_ganon);
		if(!is_server)
		{	
			break;		
		}
		if(client == noone)
		{
			client = async_load[? "socket"];
			
			var buffer = buffer_create(1024, buffer_fixed, 1);
			var socket = async_load[? "socket"];
			buffer_seek(buffer, buffer_seek_start, 0);
			buffer_write(buffer, buffer_u8, 2);
			buffer_write(buffer, buffer_u8, instance_number(obj_monster));
			for(var i = 0; i < instance_number(obj_monster); i++)
			{
				var xpos = instance_find(obj_monster,i).x;
				var ypos = instance_find(obj_monster,i).y;
				buffer_write(buffer, buffer_u16, xpos);
				buffer_write(buffer, buffer_u16, ypos);
			}
			network_send_packet(obj_network.client, buffer, buffer_tell(buffer));
			
		}
		break;
	
	case network_type_disconnect:
		if(!is_server)
		{
			break;
		}
		client = noone;
		break;
	
	case network_type_data:
		var buffer = async_load[? "buffer"];
		var socket = async_load[? "socket"];
		buffer_seek(buffer, buffer_seek_start, 0);
		scr_handle_packet(buffer);
		break;
}
