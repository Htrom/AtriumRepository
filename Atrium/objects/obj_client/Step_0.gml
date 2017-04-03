/// Create a click and send it to the server
//instance_create_depth(obj_ganon.x, obj_ganon.y, 0, obj_click);
buffer_seek(buffer, buffer_seek_start, 0);


if(clientNumber == 1)
{
	buffer_write(buffer, buffer_u8, 1); // 1
}
else if(clientNumber == 2)
{
	buffer_write(buffer, buffer_u8, 2); // 2
}
buffer_write(buffer, buffer_u32, obj_ganon.x); // 1, 100
buffer_write(buffer, buffer_u32, obj_ganon.y); // 1, 100, 120
network_send_packet(socket, buffer, buffer_tell(buffer));
