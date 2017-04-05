/// @description Initialize the network
var type = network_socket_tcp;
var ip = "10.0.0.11";
var port = 8000;

if(global.role != "HOST")
{
	socket = network_create_socket(type);
	connection = network_connect(socket, ip, port);
	is_server = false;
}
else
{
	max_clients = 4;
	server = network_create_server(type, port, max_clients);
	//network_destroy(socket);
	is_server = true;
	client = noone;
}