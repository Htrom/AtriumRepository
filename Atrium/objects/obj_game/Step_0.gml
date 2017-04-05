/// @description Insert description here

//grad mouse covert to grid pos
var xpos = obj_ganon.x;
var ypos = obj_ganon.y;
var key_left = obj_ganon.key_left;
var key_right = obj_ganon.key_right;
var key_jump = obj_ganon.key_jump;
var key_climb = obj_ganon.key_climb;
var key_climb_down = obj_ganon.key_climb_down;
var key_z = obj_ganon.key_z;
var key_x = obj_ganon.key_x;
//Send the action over the network
var buffer = buffer_create(1024, buffer_fixed, 1);
buffer_seek(buffer, buffer_seek_start,0);
buffer_write(buffer, buffer_u8, 1);
buffer_write(buffer, buffer_u16, xpos);
buffer_write(buffer, buffer_u16, ypos);
buffer_write(buffer, buffer_bool, key_left);
buffer_write(buffer, buffer_bool, key_right);
buffer_write(buffer, buffer_bool, key_jump);
buffer_write(buffer, buffer_bool, key_climb);
buffer_write(buffer, buffer_bool, key_climb_down);
buffer_write(buffer, buffer_bool, key_z);
buffer_write(buffer, buffer_bool, key_x);


if(obj_network.is_server)
{
	network_send_packet(obj_network.client, buffer, buffer_tell(buffer));
}
else
{
	network_send_packet(obj_network.socket, buffer, buffer_tell(buffer));
}
buffer_delete(buffer);
