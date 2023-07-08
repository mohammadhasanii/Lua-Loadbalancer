
![Logo](https://blog.codemagic.io/uploads/covers/codemagic-blog-header-Flutter-and-Lua.png)

# Lua-Loadbalancer

This project introduces a simple load balancer with Lua programming language and Docker. The load balancer connects incoming requests within the network to multiple servers to distribute the load of each server.

## How it works

This load balancer is implemented using the Nginx server and the Lua programming language. By running the created Docker image, an Nginx server is launched that connects incoming requests to multiple servers. Each time a user input request is received, the load balancer selects the address of the next server from the available server array and sends the request to that server.

## Installation and Usage

To use this load balancer, you first need to install Docker and Docker Compose on your system. Then, create your own Docker image with the following command:



