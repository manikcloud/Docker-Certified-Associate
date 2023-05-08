# Table of Contents

1. [Lesson 5 Demo 1 - Set up a Swarm Cluster with a Manager and Worker Node](#lesson-5-demo-1-Set-up-a-Swarm-Cluster-with-a-Manager-and-Worker-Node)
2. [Lesson 5 Demo 2 - Join Nodes to a Swarm](#lesson-5-demo-2-Join-Nodes-to-a-Swarm)
3. [Lesson 5 Demo 3 - Create Replicated and Global Services](#lesson-5-demo-3-Create-Replicated-and-Global-Services)
4. [Lesson 5 Demo 4 - Running a Container vs. Running a Service](#lesson-5-demo-4-Running-a-Container-vs-Running-a-Service)
5. [Lesson 5 Demo 5 - Create an Overlay Network](#lesson-5-demo-5-Create-an-Overlay-Network)
6. [Lesson 5 Demo 6 - Deploy a Service on an Overlay Network](#lesson-5-demo-6-Deploy-a-Service-on-an-Overlay-Network)
7. [Lesson 5 Demo 7 - Run a Container into a Running Service Under Swarm](#lesson-5-demo-7-Run-a-Container-into-a-Running-Service-Under-Swarm)
8. [Lesson 5 Demo 8 - Demonstrate Locking in a Swarm Cluster](#lesson-5-demo-8-Demonstrate-Locking-in-a-Swarm-Cluster)
9. [Lesson 5 Demo 9 - Draining the Swarm Node](#lesson-5-demo-9-Draining-the-Swarm-Node)
10. [Lesson 5 Demo 10 - Inspect a Service on Swarm](#lesson-5-demo-10-Inspect-a-Service-on-Swarm)




# Lesson 5 Demo 1: Set up a Swarm Cluster with a Manager and Worker Node

This section will guide you to: 
- Set up a swarm cluster with a manager and worker node

### Step 1: Create a swarm cluster and join the manager and worker node
- On the master node, initialize the swarm

```
sudo docker swarm init
 
```


- Click on the worker1 tab on the lab and navigate to the newly opened browser tab
 
- On worker1, join the swarm as a worker node using the 
```
sudo docker swarm join command provided in the first ### Step

```

 
- Navigate back to the master node and list all the nodes of the swarm cluster

```
sudo docker node ls

```

 
------------------------------------------------------

# Lesson 5 Demo 2: Join Nodes to a Swarm

This section will guide you to: 
- Join a worker node to the swarm cluster in Docker

### Step 1: Run the following command on the master node and copy the docker swarm join command as shown in the following screenshot:

```
sudo docker swarm join-token worker

```

 

### Step 2: Click on the worker2 tab on the lab and navigate to the newly opened browser tab
 

### Step 3: On worker2, join the swarm as a worker node using the docker swarm join command provided in the first ### Step
 
**Note**: Navigate back to the master node window

### Step 4: On the master node, list all the nodes available in the swarm cluster

```
sudo docker node ls

```

 
-------------------------------------------

# Lesson 5 Demo 3: Create Replicated and Global Services

This section will guide you to: 
- Create a replicated and a global service in Docker

### Step 1: Create a replicated service with the nginx image

```
sudo docker service create --name myweb --replicas 3 nginx

```

 

### Step 2: Create a global service with the alpine image

```
sudo docker service create --name myservice --mode global alpine top

```

 

### Step 3: List all the Docker services

```
sudo docker service ls

```

 

### Step 4: Check the status of the global service i.e., myservice

```
sudo docker service ps myservice

```

 
**Note**: Notice that the global service is running its instances on all the nodes of the swarm cluster.

### Step 5: Check the status of the replicated service i.e., myweb

```
sudo docker service ps myweb

```

 
**Note**: Notice that the replicated service is running the service replicas on all the nodes of the swarm cluster.

---------------------------

# Lesson 5 Demo 4: Running a Container vs. Running a Service 

This section will guide you to: 
- Run a container from an image 
- Run the image as a replicated service

### Step 1: Check whether all the nodes in the swarm cluster are in Ready state

```
sudo docker node ls

```

 

### Step 2: Pull the latest version of nginx image from Docker Hub

```
sudo docker pull nginx:latest

```

 

### Step 3: Run a container from the nginx image

```
sudo docker container run -d \
--name nginx-container nginx:latest

```

 

### Step 4: List all the running containers to check the newly created nginx container

```
sudo docker ps
 

```


### Step 5: Run the nginx image as a service

```
sudo docker service create \
--name nginx-service \
--replicas 4 nginx:latest

```

 

### Step 6: List all the services running in the swarm cluster

```
sudo docker service ls

```

 

### Step 7: List all the tasks of the nginx-service

```
sudo docker service ps nginx-service

```

 
-------------------------

# Lesson 5 Demo 5: Create an Overlay Network 

This section will guide you to: 
- Create an overlay network in a Docker swarm cluster
- Create a replicated service to establish communication between service tasks

### Step 1: Check the network drivers on the manager and worker nodes of the swarm cluster
- On the master tab, list all the networks and check the Driver type of swarm cluster 

```
sudo docker network ls

```

	 
**Note**: Notice that the Driver type of swarm cluster is overlay and its name is ingress.
- Click on the worker1 tab and navigate to the newly opened tab of worker1 node
 
- On worker1 node, list all the networks and check the Driver type of swarm cluster

```
sudo docker network ls

```

**Note**: Notice that the Driver type of swarm cluster is overlay and its name is ingress.
**Note**: Navigate back to the master tab to run commands on manager node

### Step 2: Create an overlay network and run a replicated service on it
- Use the following command to create an overlay network

```
sudo docker network create -d overlay nginx-net1

```

 
- Create a replicated service with five replicas connected to the nginx-net1 network

```
sudo docker service create --name nginx-service1 \
--publish target=80,published=80 --replicas=5 \
--network nginx-net1 nginx

```

 
- List all the service tasks created by the replicated service

```
sudo docker service ls

```

 
- Inspect the nginx-net1 network on manager node and check the Containers section for the service tasks connected to the overlay network from this host

```
sudo docker network inspect nginx-net1

```

 
- Click on the worker1 tab and navigate to the newly opened tab of worker1
- Inspect the nginx-net1 network on worker1 node and check the Containers section for the service tasks connected to the overlay network from this host

```
sudo docker network inspect nginx-net1

```

 
- Click on the worker2 tab and navigate to the newly opened tab of worker2
- Inspect the nginx-net1 network on worker2 node and check the Containers section for the service tasks connected to the overlay network from this host

```
sudo docker network inspect nginx-net1

```

 
**Note**: Navigate back to the master tab to run commands on manager node.
- On the manager node, inspect the replicated service and check the Ports under the Endpoints section

```
sudo docker service inspect nginx-service1

```

 
 
- Run the following command on manager node to clean the replicated service and network:

```
sudo docker service rm nginx-service1

```
sudo docker network rm nginx-net1
 

------------------------------

# Lesson 5 Demo 6: Deploy a Service on an Overlay Network

This section will guide you to: 
- Deploy a service on an overlay network

### Step 1: Create an overlay network and attach a service to it
- On the manager node, create an overlay network called nginx-net1

```
sudo docker network create -d overlay my-overlay
 
- Create a nginx service and attach it to the newly created overlay network

```
sudo docker service create --replicas 3 \
--name my-web --network my-overlay nginx
 

### Step 2: List the services and inspect the running service tasks
- List all the running services to check the newly created replicated service

```
sudo docker service ls
 
- List the running service tasks deployed on the overlay network

```
sudo docker service ps my-web
 
- Inspect the overlay network to check which service tasks are running on the manager node

```
sudo docker network inspect my-overlay
```


-----------------------


# Lesson 5 Demo 7: Run a Container into a Running Service Under Swarm

This section will guide you to: 
- Run a container into a running service under swarm

### Step 1: Run the nginx image as a service in global mode, on each node in the swarm cluster

```
sudo docker service create --mode global \
--publish mode=host,target=80,published=8080 \
--name=nginx nginx:latest
 

### Step 2: Create a nginx service running three replica containers on the swarm cluster

```
sudo docker service create \
--name my_web --replicas 3 \
--publish published=5050,target=80 nginx
 

### Step 3: Check the status of each container instance running within the service:

```
sudo docker service ps my_web
 
-------------------------


# Lesson 5 Demo 8: Demonstrate Locking in a Swarm Cluster

This section will guide you to: 
- Lock and unlock the swarm cluster in Docker

### Step 1: On the master tab, use the following command to enable auto-locking on the existing swarm cluster

```
sudo docker swarm update --autolock=true
```

**Note**: Make sure you copy the unlock-key and save it for later use.

### Step 2: Restart the docker daemon to check whether the swarm cluster is locked


```
sudo systemctl docker restart

sudo docker service ls
``` 

### Step 3: Unlock the swarm cluster using the unlock-key saved in first ### Step

```
sudo docker swarm unlock
```

**Note**: To enter the unlock key, copy the key to the clipboard and paste in using Ctrl+Shift+V.

### Step 4: Use the following command to view the current unlock key

```
sudo docker swarm unlock-key

```


 

### Step 5: Use the following command to rotate the unlock key

```
sudo docker swarm unlock-key --rotate

```

 
**Note**: It is advisable to rotate the locked swarm’s unlock key on a regular schedule. Make sure you keep a record of the unlock-key to unlock the swarm cluster.

### Step 6: To disable auto-locking on the existing swarm cluster, use the following command:

```
sudo docker swarm update --autolock=false

```

 
-----------------------

# Lesson 5 Demo 9: Draining the Swarm Node

This section will guide you to: 
- Drain the swarm node in Docker

#### Step 1: List all the active nodes

```

sudo docker node ls

```

 

#### Step 2: Start a replicated service using the redis image

```
sudo docker service create --replicas 3 \
--name redis --update-delay 10s redis:3.0.6

```

 

#### Step 3: Check the tasks assigned to different nodes by the swarm manager

```
sudo docker service ps redis

```

 

#### Step 4: Drain a node that has a task assigned to it

```
sudo docker node update --availability \
drain hostname_Worker1

```

**Note**: Replace hostname_Worker1 with the IP address of your worker1 node. In this case it is ip-172-31-26-147
 

#### Step 5: Inspect the drained node and check the Availability of the node

```
sudo docker node inspect --pretty hostname_Worker1

```

**Note**: Replace hostname_Worker1 with the IP address of your worker1 node. In this case it is ip-172-31-26-147
 

#### Step 6: Check the updated task assignments for the redis service by the swarm manager

```
sudo docker service ps redis

```

 

#### Step 7: Return the drained worker1 node to an active state

```
sudo docker node update --availability \
active hostname_Worker1

```

**Note**: Replace hostname_Worker1 with the IP address of your worker1 node. In this case it is ip-172-31-26-147
 

#### Step 8: Inspect the worker1 node again to see the updated Availability status

```
sudo docker node inspect --pretty hostname_Worker1

```

**Note**: Replace hostname_Worker1 with the IP address of your worker1 node. In this case it is ip-172-31-26-147
 
------------------------------------

# Lesson 5 Demo 10: Inspect a Service on Swarm

This section will guide you to: 
- Inspect a service on the Docker swarm

#### Step 1: Start a replicated service using the redis image

```
sudo docker service create --replicas 3 --name redis redis:3.0.6

```

 

#### Step 2: Check the service tasks assigned to different nodes by the swarm manager

```
sudo docker service ps redis

```

 

#### Step 3: Inspect the redis service in an easily readable format

```
sudo docker service inspect --pretty redis

```

 

#### Step 4: Use the following command to return the service details in JSON format

```
sudo docker service inspect redis

```

 
-------------------------


# Disclaimer
<details>

Please **Note** that the entire repository is owned and maintained by [Varun Kumar Manik](https://www.linkedin.com/in/vkmanik/). While every effort has been made to ensure the accuracy and reliability of the information and resources provided in this repository, Varun Kumar Manik takes full responsibility for any errors or inaccuracies that may be present.

Simplilearn is not responsible for the content or materials provided in this repository and disclaims all liability for any issues, misunderstandings, or claims that may arise from the use of the information or materials provided. By using this repository, you acknowledge that Varun Kumar Manik is solely accountable for its content, and you agree to hold Simplilearn harmless from any claims or liabilities that may arise as a result of your use or reliance on the information provided herein.

It is important to understand that this repository contains educational materials for a training course, and users are expected to apply their own judgment and discretion when utilizing the provided resources. Neither Varun Kumar Manik nor Simplilearn can guarantee specific results or outcomes from following the materials in this repository.

</details>

## Connect & Follow

For more info, please connect and follow me:

- Github: [https://github.com/manikcloud](https://github.com/manikcloud)
- LinkedIn: [https://www.linkedin.com/in/vkmanik/](https://www.linkedin.com/in/vkmanik/)
- Email: [varunmanik1@gmail.com](mailto:varunmanik1@gmail.com)
- Facebook: [https://www.facebook.com/cloudvirtualization/](https://www.facebook.com/cloudvirtualization/)
- YouTube: [https://bit.ly/32fknRN](https://bit.ly/32fknRN)
- Twitter: [https://twitter.com/varunkmanik](https://twitter.com/varunkmanik)
