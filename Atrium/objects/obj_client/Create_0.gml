/// Initialize the client
var type = network_socket_tcp;
var ip = "172.101.200.241";
var port = 8000;
socket = network_create_socket(type);
connection = network_connect(socket,ip,port);
clientNumber = 2;
var size = 1024;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size, type, alignment);