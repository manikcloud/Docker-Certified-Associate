# Lesson 4 Demo 1: Create a Bridge Network
Lesson 4 Demo 1: Create a Bridge Network

This section will guide you to: 
- Create a default network in Docker

- Inspect the network for the network driver

### Step 1: Create a network that will take the bridge driver by default
- Use the following command to create a network:
```
sudo docker network create mynetwork1
``` 

- Use the following command to list current networks:
``` 

sudo docker network ls
``` 

 
- Use the following command to inspect the network:
``` 

sudo docker network inspect mynetwork1
``` 

**Note:** A bridge driver is the default driver that automatically gets installed and configured while creating a network.
 
--------------------------------------------------------------

# Lesson 4 Demo 2: Create a User-Defined Bridge Network

This section will guide you to: 

- Create a user-defined bridge network

### Step 1: Create and delete a user-defined bridge network
```

sudo docker network create my-net1
sudo docker network rm my-net1
```

 

### Step 2: Connect an nginx container to the my-net network. Also, publish port 80 in the container to port 8080 on the Docker host

```

sudo docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```

 

### Step 3: Connect a running my-nginx container to an existing my-net network
```

sudo docker network connect my-net my-nginx
```

 

### Step 4: Inspect the my-nginx container and check the Networks
```

sudo docker container inspect my-nginx 
```

 
 

### Step 5: Disconnect the my-nginx container from the my-net network
```

sudo docker network disconnect my-net my-nginx
```

 

### Step 6: Inspect the my-nginx container and check the Networks
```

sudo docker container inspect my-nginx
```

 
------------------------------------------------------------------------------------

# Lesson 4 Demo 3: Create a Host Network

This section will guide you to: 

- Create a standalone container that binds directly to the Docker host’s network

- Inspect the container to check the network mode

### Step 1: Create and start a container as a detached process and use the host networking driver 

```
sudo docker run --rm -d --network host --name nginx_container1 nginx

```

- **Note:** The host networking driver works only on Linux hosts and is not supported on Docker Desktop for Mac or Windows server.

### Step 2: Access the nginx container by browsing http://localhost:80/
- Click on the master tab and click on Desktop to open the Ubuntu desktop window
 
- Open the browser and navigate to http://localhost:80/
 
**Note:** Navigate back to the master tab with the Ubuntu Terminal
### Step 3: Inspect the container to check the NetworkMode under the HostConfig
```

sudo docker container inspect nginx_container1
```


### Step 4: Verify which process is bound to port 80 using the netstat command
```

sudo netstat -tulpn | grep :80
```

 
### Step 5: Examine all the network interfaces, and verify that a new network has not been created
```

ip addr show
```

 

### Step 6: Stop the container using the following command:

```

sudo docker container stop nginx_container1
```

 
--------------------------------------------------------------------------------

# Lesson 4 Demo 4: Create a Macvlan Network

This section will guide you to: 

- Create a Macvlan network in bridge mode

- Create an Alpine container and attach it to the Macvlan network


### Step 1: Create a Macvlan network in bridge mode
- Create a Macvlan network in bridge mode with subnet, gateway, and parent values
```

sudo docker network create -d macvlan \
--subnet=172.16.86.0/24 \
--gateway=172.16.86.1 -o \
parent=docker0 macvlan-net
 ```


- List all the networks to check the newly created macvlan network
```

sudo docker network ls
```

 
- Inspect the macvlan network and check the Driver type
```

sudo docker network inspect macvlan-net
```

 

### Step 2: Create an Alpine container and attach it to the Macvlan network


- Start an Alpine container and attach it to the macvlan-net network

```

sudo docker run --rm -dit \
--network macvlan-net \
--name macvlan-alpine alpine:latest ash
```

 
- Inspect the macvlan-alpine container and observe MacAddress key in the Networks key
```

sudo docker container inspect macvlan-alpine
```

 
 
- Run the following command to check how the container sees its network interfaces:
```

sudo docker exec macvlan-alpine ip route
```

 

-----------------------------------------------------------------------------------------   
# Lesson 4 Demo 5: Publishing Ports

This section will guide you to: 

- Publish a swarm service’s port to external hosts in different ways

### Step 1: Publish a swarm service’s port using the Routing Mesh
**Note:** If Docker Swarm is not initialized on the master node, initialize docker swarm
	```

sudo docker swarm init
```

- Use --publish <PUBLISHED-PORT>:<SERVICE-PORT> to publish a port externally to the swarm:
```

sudo docker service create --name service1 \
--replicas 3 --publish published=8080,target=80 nginx
```

 
**Note:** You can also write the above command it this way:
```

	docker service create --name service1 --replicas 3 -p 8080:80 nginx
```

- Use the following command to check whether your service has started on port 8080:
```

	curl localhost:8080
```

 

### Step 2: Publish a swarm service’s port directly on the swarm node

- Use the mode=host option with --publish flag along with `--mode` global flag to publish a port directly on the swarm node
```

sudo docker service create --mode global \
--publish mode=host,target=80,published=8081 \
--name=service2 nginx:latest
```

 

- Use the following command to check whether your service has started on port 8081:
```

	curl localhost:8081
 
```


-------------------------------------------------------------------------------------------
# Lesson 4 Demo 6: Configure Docker to Use External DNS

This section will guide you to: 

- Configure Docker Daemon config file to use External DNS

### Step 1: Create a file named daemon.json, which will be used as the Docker Daemon configuration file, to use external DNS
```

sudo nano /etc/docker/daemon.json
```

 

### Step 2: In daemon.json file, add the following dns key with one or more IP addresses:
```

"dns": ["8.8.8.8", "8.8.4.4"]
```


**Note:** Do write the code snippet shown in the screenshot below rather than copying it on the terminal. Do not forget to add a comma after each value pair.

Ex: "storage-driver": "overlay2", "dns": ["8.8.8.8", "8.8.4.4"]

 
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.

### Step.3: Use the following command to restart the Docker Daemon:
```

sudo service docker restart
```

 

### Step 4: Use the following command to test the DNS by looking up an external domain:
```

sudo docker run nicolaka/netshoot nslookup google.com
```

 

### Step 5: Use the following command to run a container with a custom DNS and test it by doing an nslookup:
```

sudo docker run --dns 8.8.4.4 nicolaka/netshoot nslookup facebook.com
```

 

