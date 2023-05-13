# Lesson 5 Demo 13: Mount Volumes via Swarm Services

This section will guide you to: 
- Mount volumes in Docker

### Step 1: Create a Docker volume

```

sudo  docker volume create my_vol

```

 

### Step 2: Start the container with a volume

```
sudo  docker run -d --name myweb1 -v my_vol:/var/www/html nginx

```

 

```
sudo  docker run -d --name myweb2 --mount src=my_vol,dst=/var/www/html nginx

```

 

### Step 3: Remove the containers

```
sudo  docker rm -f myweb1 myweb2
 
```



### Step 4: Create containers and use bind mounts

```
sudo  docker run -d --name myweb1 -v type=bind,source="$(pwd)"/html,target=/var/www/html nginx
 
sudo  docker run -d --name myweb2 -v "$(pwd)"/html:/var/www/html nginx
 

sudo  docker run -d --name myweb3 -v "$(pwd)"/html:/var/www/html:ro nginx
 
```



### Step 5: Remove the containers

```
sudo  docker rm -f myweb1 myweb2 myweb3
 

```


### Step 6: Create temporary ram-based file system

```
sudo  docker run -d --name myweb1 --mount type=tmpfs,destination=/app nginx
 

sudo  docker run -d --name myweb2 --tmpfs /app nginx
 

```


### Step 7: Remove the file system

```
sudo  docker rm -f myweb1 myweb2
 

```


### Step 8: Create a container from alpine image with my_vol volume

```
sudo  docker run -it --name webapp -v my_vol:/var/www/html alpine

```


### Step 9: Inside the alpine container, execute the following commands to create three files inside the /var/www/html directory

```

cd /var/www/html
touch test1 test2 test3 && mkdir testdir
exit

```

 
-----------------------------------------------------------------
# Lesson 5 Demo 14: Demonstrate How to Use Storage Across Cluster Nodes

This section will guide you to:
- Create a volume for storage on the manager node
- Use the volume to create a replicated service
- Inspect worker nodes accessing the same volume for storage across cluster nodes

### Step 1: Create a volume for storage on the manager node
- Use the following command to create a volume on the manager node:

```
sudo  docker volume create volume1

```

 
- Use the following command to list the current volumes in the manager node:

```
sudo  docker volume ls

```

 
### Step 2: Use the volume to create a replicated service
- Use the following command to create a replicated service using the local volume:

```
sudo  docker service create -d --replicas=4 --name replicated-service --mount source=volume1,target=/app nginx:latest
 
```


- Use the following command to list the replicated services:

```
sudo  docker service ps replicated-service

```

 

### Step 3: Inspect worker nodes accessing the same volume for storage across cluster nodes
- Click on the worker1 tab and navigate to the newly opened tab of worker1 node
 
- Use the following command to list the local volumes on worker1 node:

```
sudo  docker volume ls

```

 
**Note:** Volume created on the manager node is used by the worker1 node.
- Click on the worker2 tab and navigate to the newly opened tab of worker2 node
 
- Use the following command to list the local volumes on worker2 node:

```
sudo  docker volume ls
 
```


----------------------------------------------------------------
# Lesson 5 Demo 15: Select Storage Driver and Configure Device Mapper

This section will guide you to: 
- Select a suitable storage driver
- Configure the device mapper storage driver

### Step 1: Select a suitable storage driver
- Open the daemon.json file to change the default storage driver to aufs
	
```
sudo  nano /etc/docker/daemon.json
 
```


- Use the following code to change the default storage driver:
**Note:** Please type the code snippet shown in the screenshot below in your terminal to avoid any errors rather than copy pasting the code.
```
{
"storage-driver": "aufs"
}
 ```
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to restart the Docker Daemon:
	
```
sudo  service docker restart
 
```


- Use the following command to check the default storage driver:
	
```
sudo  docker info | grep 'Storage Driver'
 
```


**Note:** You can select any storage driver that is suitable to your Docker engine version and requirements, from storage drivers like overlay, overlay2, device mapper, and aufs.
	
### Step 2: Configure the device mapper storage driver
- Open the daemon.json file to change the default storage driver to device mapper
	
```
sudo  nano /etc/docker/daemon.json
 
```


- Use the following code to change the current storage driver:
```
{ 
	"storage-driver": "devicemapper"
}
```
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to restart the Docker Daemon:
	
```
sudo  service docker restart
 
```


- Use the following command to check the default storage driver:
	
```
sudo  docker info | grep 'Storage Driver'
 
```


----------------------------------------------------------------
# Lesson 5 Demo 16: Apply Node Labels, Inspect the Labels, and Filter Swarm Nodes by Labels

This section will guide you to: 
- Apply labels to swarm nodes
- Inspect the node labels
- Filter swarm nodes by labels

### Step 1:  Apply labels to swarm cluster nodes
- Use the following command to list all the nodes in the swarm cluster:

```
sudo  docker node ls
  
```


- Use the following command to add a label to a swarm node:

```
sudo  docker node update --label-add workerNode hostname
 
```

**Note**: Replace hostname with IP address of Worker1 node
 
- Use the following command to add multiple labels to a swarm node:

```
sudo  docker node update --label-add workerNode --label-add worker1 hostname
 
```

**Note**: Replace hostname with IP address of Worker1 node
 
- Use the following command to add a type label to identify nodes:

```
sudo  docker node update --label-add type=queue hostname
 
```

**Note**: Replace hostname with IP address of Worker1 node
 

### Step 2: Inspect the node labels
- Use the following command to inspect a node for Labels:

```
sudo  docker node inspect hostname
 
```

**Note**: Replace hostname with IP address of Worker1 node
 
- Use the following command to inspect a node with a specific output format to get the node’s labels:

```
sudo  docker node inspect --format ‘{{ .Spec.Labels }}’ hostname
 
```

**Note**: Replace hostname with IP address of Worker1 node. If you get any template error, you will need to replace single inverted commas (‘) with double inverted commas (“).
 

### Step 3: Filter the swarm nodes based on Labels
- Use the following command to filter swarm nodes based on Labels:

```
sudo  docker node ls -q | xargs 

sudo  docker node inspect -f '{{ .ID }} [{{ .Description.Hostname }}]: {{ .Spec.Labels }}'
 
```



-----------------------------------------------------------------
# Lesson 5 Demo 17: Using Templates

This section will guide you to: 
- Demonstrate the use of templates in Docker

### Step 1: Set the template of the created containers based on the service’s name, node’s ID, and the hostname

```
sudo  docker service create --name hosttempl --hostname="{{.Node.Hostname}}-{{.Node.ID}}-{{.Service.Name}}" busybox top

```

 

### Step 2: Show the status of all the running tasks of the service hosttemp1

```
sudo  docker service ps hosttempl

```

 
### Step 3: Use the following command to inspect the hosttempl service

```
sudo  docker inspect SERVICE_ID --format "{{json .Status}}"

```


**Note:** Replace SERVICE_ID with the ID of the hosttempl service
 
-------------------------------------------------------------------
# Lesson 5 Demo 18: Troubleshoot a Service Which Is Unable to Deploy

This section will guide you to: 
- Troubleshoot a Docker service which is unable to deploy

### Step 1:  Troubleshoot the running services
- Use the following command to list all the services running in the swarm:

```
sudo  docker service ls

```

**Note:** Check whether all the replicas for a service are actually running
 
- Use the following command to inspect the redis service for configurations:

```
sudo  docker service inspect redis

```

 

### Step 2: Troubleshoot the tasks assigned for the redis service
- List the tasks assigned for a given service to determine whether they are currently running or not

```
sudo  docker service ps redis

```

 
**Note:** Make sure you pick the task running on that specific node. In this case, tasks redis.3 and redis.5 running on manager node can be inspected on this node only. For inspecting other tasks, you need to move to the worker1 or worker2 nodes.
- Use the following command to install jq package:

```
sudo  apt install jq

```

 
- Use the following command to inspect a specific task to determine which container is associated with the given service:

```
sudo  docker inspect TASK_ID | jq -r \
'.[].Status.ContainerStatus.ContainerID'

```

**Note:** Replace TASK_ID with the Id of a selected task. In this case Task Id is nqkfq9f00qsu
 

### Step 3: Troubleshoot the container associated with the redis service
- Use the following command to get the container state:

```
sudo  docker inspect CONTAINER_ID | jq '.[].State'

```

**Note:** Replace CONTAINER_ID with the first 12 characters of container Id received in the previous ### Step. In this case, the Container Id is bf2c4982d71a.
 
**Note:** ExitCode and Error show the reasons why a container has made an exit
- Use the following command to check the Network Settings of the container:

```
sudo  docker inspect CONTAINER_ID | jq '.[].NetworkSettings'

```

**Note:** Replace CONTAINER_ID with the first 12 characters of container Id received in the previous ### Step. In this case the Container Id is bf2c4982d71a.
 
 
- Use the following command to get detailed logs of redis service:

```
sudo  docker service logs redis

```

 
 

------------------------------------------------------------------
# Lesson 5 Demo 19: Logging Drivers

This section will guide you to: 
- Configure the default logging driver
- Configure the logging driver for a container
- Configure the delivery mode of log messages

### Step 1: Configure the default logging driver
- Use the following command to navigate to daemon.json and open it:
	
```
sudo  nano /etc/docker/daemon.json

```

 
- Add the following code in the daemon.json file to set the logging driver to syslog:
	"log-driver": "syslog"
 
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to restart the Docker daemon:
	
```
sudo  service docker restart

```

 
- Use the following command to check the current default logging driver:

```
sudo  docker info --format '{{.LoggingDriver}}’

```

 

### Step 2: Configure the logging driver for a container
- Use the following command to start a nginx container with the journald logging driver:

```
sudo  docker run -it --log-driver journald --name mycustom nginx
 
sudo  docker ps -a

```

 
- Use the following command to check the current logging driver for a running container:

```
sudo  docker inspect -f '{{.HostConfig.LogConfig.Type}}' mycustom

```

 

### Step 3: Configure the delivery mode of log messages
- Use the mode log-option to choose from blocking and non-blocking message delivery mode
- Use the following command to start a busybox container with log-output in non-blocking mode and a 3-megabyte buffer:

```
sudo  docker run -it --log-opt mode=non-blocking --log-opt max-buffer-size=3m --name busybox_container busybox
 
```


**Note:** In order to exit from this container editor type exit
- Use the following command to inspect a container for LogConfig:

```
sudo  docker inspect busybox_container

```

 
 

------------------------------------------------------------------
# Lesson 5 Demo 20: Troubleshooting Container Networking

This section will guide you to: 
- Troubleshoot container networking in different ways

### Step 1: Troubleshooting using debug commands like logs and inspect
- Create an ubuntu container

```
sudo  docker run -t -d --name container1 ubuntu:latest

```

 
- List all the running containers

```
sudo  docker ps

```

 
- Use the following command to inspect a container:

```
sudo  docker inspect container1

```

 
**Note:** You can additionally use these commands to troubleshoot a container networking:

```
sudo  docker container logs <container id/ name>

sudo  docker network inspect -v <network id/name>

sudo  docker node ls

```


### Step 2: Troubleshooting using network troubleshoot tools like nicolaka or netshoot
- Use nicolaka or netshoot tool for container debugging, as all Linux networking tools are packaged in this container

```
sudo  docker run -it --net container:container1 nicolaka/netshoot

```

 
- Use the following command to troubleshoot host network:

```
sudo  docker run -it --net host nicolaka/netshoot

```

 
- Use nsenter to enter any namespace with netshoot running as a privileged container
	#running netshoot in privileged mode

```

sudo docker run -it --rm -v /var/run/docker/netns:/var/run/docker/netns --privileged=true nicolaka/netshoot

```


**Note:** The following commands can be used inside network namespace for troubleshooting:
- ifconfig		#interface list
- brctl show		#bridge list
- ip route show		#route table
- bridge fdb show	#encapsulation detail
- ipvsadm		#load balancing
------------------------------------------------------------------

# Lesson 5 Demo 21: Set up a Backup Schedule

This section will guide you to: 
- Set up a backup schedule

### Step 1: Set up a backup schedule for the swarm cluster
- Use the following command on the manager node to stop the Docker daemon:
	
```
sudo  service docker stop
	
```

 
- Use the following command to create a backup by compressing the swarm folder in a tar file:
	
```
sudo  tar -czvf swarm.backup.tar var/lib/docker/swarm/

```

 
- Use the following commands to restore the backup in case of an emergency:
	
```
sudo  service docker stop

sudo  rm -Rf /var/lib/docker/swarm

sudo  tar -zxvf swarm.backup.tar -C /var/lib/docker

```

 
- Use the following commands to create a new configuration using the existing /var/lib/docker/swarm directory:

```
sudo  service docker start

sudo  docker swarm init --force-new-cluster
 

```


------------------------------------------------------------------
------------------------------------------------------------------

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
