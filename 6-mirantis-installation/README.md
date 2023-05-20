# LAB Troublsoot

This project focuses on resolving common problems related to package dependencies in Ubuntu, specifically Docker and `containerd`.

## Common Problem

The common problem faced is as follows:

```
The following packages have unmet dependencies:
docker.io : Depends: containerd (>= 1.2.6-0ubuntu1~)
E: Unable to correct problems, you have held broken packages.
```

## Solution

To solve this issue, follow the ### Steps mentioned below:

1. Update your package list:

```
sudo apt-get update
```

2. Upgrade the packages:

```
sudo apt-get upgrade
```

3. If the problem persists, try to install the containerd package manually:

```
sudo apt-get install containerd
```

4. Then, try to install Docker again:

```
sudo apt-get install docker.io
```

5. **If none of the above works**, you might want to consider using Docker's official installation script, which handles dependencies and configures Docker's repositories for you. You can use it like this:

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

6. If you're still having trouble, you might have "held" packages, which means there are packages that the system will not update. You can find these with:

```
sudo apt-mark showhold
```

7. If any packages are shown as held, you can try unholding them with:

```
sudo apt-mark unhold <package-name>
```

Replace <package-name> with the name of the package that is held. Once this is done, you can try installing Docker again.

----------------------------------------------------------------------------------------

# Lesson 6 Demo 1: Install Mirantis Kubernetes Engine

This section will guide you to: 
- Install Mirantis Kubernetes Engine (MKE)

This lab has two subsections, namely:
1.	Pulling images from mirantis/ucp and installing MKE on the master node
2.	Signing into MKE from the desktop browser

**Note:** Before starting this demo, make sure all the nodes are connected to a swarm cluster with the master node acting as a manager node. Refer to practice project 5.8 (# Lesson 5 Demo 1: Set up a Swarm Cluster with a Manager and Worker Node) and 5.9 (# Lesson 5 Demo 2: Join Nodes to a Swarm), if you need help with the process.
- Form more details click here:

https://github.com/manikcloud/Docker-Certified-Associate/tree/main/5-docker-Orchestration/5.1-Swarm-services-and-network


### Step 1: Pulling images from mirantis/ucp and installing MKE on the master node
- Open master node and run the following command:
sudo docker image pull mirantis/ucp:3.4.4
 
- Run the following command to install and register into MKE:

```

sudo docker container run --rm -it --name ucp \
-v /var/run/docker.sock:/var/run/docker.sock \
mirantis/ucp:3.4.4 install \
--host-address <ip-master-node> \
--controller-port 446 --interactive \
--force-minimums

```
for ex:
```

sudo docker container run --rm -it --name ucp -v /var/run/docker.sock:/var/run/docker.sock mirantis/ucp:3.4.4 install --host-address 172.31.6.128 --controller-port 446 --interactive --force-minimums

```

### Other Docker Commands
```
ip r
kubectl get pods 
docker ps 
docker network ls
docker service ls
docker volume ls
docker stack ls
```
**Note:** Replace the <ip-master-node> in the command with the IP address of your master node; in this case, it is 172.31.43.212
 
**Note:** Save your credentials for signing into MKE later and press enter for the additional aliases.
 
### Step 2: Signing into MKE from the desktop browser
- Go to the master node and open the desktop window:
 
- Open the browser and paste the URL https://<ip-master-node>:446 after replacing <ip-master-node> in the command with the IP address of your master node; in this case, it is 172.31.43.212
**Note:** Make sure you include port number 446 after the IP address in the URL.
 

- On the webpage, click on the advanced button and then click on proceed to <MKE URL> where <MKE URL> is the copied link from CLI:
 
-  Enter the login credentials you set up in the installation process of MKE in ### Step 1 and click on the sign in button:
 
- On the next screen, click on skip for now to directly login into MKE:
 
**Note:** Notice that we have not uploaded a license or got a free license because Mirantis has stopped providing free license for MKE. So we will continue without a license.
- The MKE dashboard will look like the following screenshot:
 
--------------------------------------------------------------------

# Lesson 6 Demo 2: Create and Manage Teams and Users

This section will guide you to: 
- Create and manage an organization
- Create and manage teams in an organization
- Create and manage users in a team

This lab has three subsections, namely:
1.	Creating an organization
2.	Creating and managing teams in the organization
3.	Creating and managing users in a team

**Note:** You can perform this demo with MKE web UI, provided you've a license for it. However, Mirantis isn't providing the free license currently, leading to limited or disabled use of some of the MKE features.

### Step 1: To create and manage teams, you need to create an organization, as teams are collectively a part of an organization
- Sign in to your Docker Hub account and navigate to Organizations
- Click on Create Organization if you don’t have any existing ones
 
- Fill all the necessary details, and click on Create Organization to create an organization
 
- Click on the newly created organization name to view details like its members and teams
 

### Step 2: Create and manage teams in an organization
- Navigate to Teams tab in an organization, and click on Create Team
 
- Fill the name and description of the team, and click on Create 

### Step 3: Create and manage users in a team
- Create a new user by clicking on the Add Member button
 
- Fill details like the user’s Docker ID or email, select the team you wish to join from the dropdown, and click on Add
	 
--------------------------------------------------------------------------------


# Lesson 6 Demo 3: Install Mirantis Secure Registry

This section will guide you to: 
- Install and set up Mirantis Secure Registry (MSR)

This lab has four subsections, namely:
1.	List the insecure registries which you are going to run while running MSR
2.	Get the MSR installation command from Admin Settings in MKE
3.	Run the MSR installation command in Docker CLI
4.	Verify that the MSR is successfully installed

### Step 1: List the insecure registries which you are going to run while running MSR
- For Ubuntu 14.x, open the /etc/default/docker file in your terminal, and edit the DOCKER_OPTS parameter
```
DOCKER_OPTS="--insecure-registry <registry.example.com> -H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock"
```

**Note:** Replace <registry.example.com> with the private IP address of worker1 node, where you are going to install MSR
- For Ubuntu 16.x or CentOS, edit or create /etc/docker/daemon.json, and add this to the file:

```
{
    "insecure-registries" : ["registry.example.com"]
}

```
**Note:** Replace registry.example.com with the private IP address of worker1 node, where you are going to install MSR
- Restart Docker Daemon with the following command:

```
sudo service docker restart

```

### Step 2: Get the MSR installation command from Admin Settings in MKE
- In MKE, go to Admin Settings, and click on Mirantis Secure Registry
 
- To create an MSR instance, 
- select a MKE Node, 
- tick the Disable TLS verification for UCP checkbox, and 
- click on Copy to Clipboard to copy the command to install DTR
 

### Step 3: Run the MSR installation command in Docker CLI
- Open the terminal, and run the copied command. You can also use the following command to install MSR:

```
docker run -it --rm docker/dtr install --ucp-node ip-<ip-address> --ucp-username admin --ucp-url https://172.31.49.85:436 --ucp-insecure-tls

```
**Note:** Replace <ip-address> with the private IP address of worker1 node
 

### Step 4: Verify that the MSR is successfully installed

- Once the installation is complete, 
- Navigate to Admin Setting-> Mirantis Secure Registry in MKE Web UI. 

You will see the installed MSR IP address
- Go to MSR IP address (172.31.49.85, in this case), and you will see the DTR Sign in page
 
**Note:** For the sign in process, use the same login credentials as of MKE web UI.


----------------------------------------------------------