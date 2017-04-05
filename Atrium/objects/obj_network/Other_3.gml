/// @description Clean up dynamic data
if(is_server)
{
	network_destroy(server);
}
else
{
	network_destroy(socket);
}
