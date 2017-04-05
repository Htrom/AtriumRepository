/// @description Do networking stuff
var type_event = async_load[? "type"];
switch(type_event)
{
	case network_type_connect:
		if(!is_server)
		{
			break;		
		}
		if(client == noone)
		{
			client = async_load[? "socket"];
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
