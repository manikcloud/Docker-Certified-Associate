# Lesson 7 Demo 1: Create MKE Client Bundle

This section will guide you to: 
- Create a client bundle in MKE

### Step 1: Download the client certificates by creating a client bundle

- Sign in to MKE with your admin username and password

- Click on My Profile on the left-hand side panel

 

- Click on New Client Bundle dropdown and select Generate Client Bundle to download the certificate bundle

 


### Step 2: Use the client certificate bundle to authenticate requests for running Docker commands on a MKE node

- Go to the directory where you have downloaded the .zip file, and use the following command to unzip it:
	
```

cd /home/ubuntu/Downloads/
	unzip ucp-bundle-abharathour.zip

```


 

- Run the following command to start client certificates:	
	
```

eval "$(<env.sh)"

```



Use the Docker CLI with client certificates



-------------------------------------------------------------------------------------------------------------

# Lesson 8 Demo 1: Access Kubernetes Cluster from Docker CLI

This section will guide you to: 
- Download the client bundle from MKE
- Configure kubectl on the Terminal using the client bundle

**Note**: You can perform this demo with MKE web UI, provided you've a license for it. However, Mirantis isn't providing the free license currently, leading to limited or disabled use of some of the MKE features.

### Step 1: Download the client bundle from MKE
- Navigate to MKE dashboard and click on Docker CLI information box
 
- On the Create and Manage Services Using the CLI window, click on user profile page
 
- On the Profile page, click on the New Client Bundle dropdown to select Generate Client Bundle and click on the Confirm button
 

### Step 2: Configure 

kubectl on the Terminal using the client bundle
- On the master node, open the Terminal and navigate to the Downloads folder to list the zipped client bundle

```

cd Downloads
ls

```

 
- Run the following command to extract the environment script and execute it

```

unzip ucp-bundle-{username}.zip
	eval "$(<env.sh)"

```

 
- Use the following command to check the nodes on the Kubernetes cluster:

```
kubectl get nodes

```

 
- Create a deployment using the 

kubectl command and list the pod for this deployment

```
kubectl create deployment nginx --image=nginx


kubectl get pods

```


 
- Navigate back to the MKE dashboard and click on the Pods under Kubernetes section to see the newly created pod
 
-------------------------------------------------------------------------------------------------------------
# Lesson 8 Demo 2: Create a Service to Route Traffic from Frontend to Backend Pods

This section will guide you to: 
- Create a Service to Route Traffic from Frontend to Backend Pods

### Step 1: Create an nginx deployment and scale it to two pods
- Use the following command to create an nginx deployment and scale it to two pods

```
kubectl create deployment nginx --image=nginx


kubectl scale --replicas=2 deployment/nginx

```

 
- List all the newly created pods

```
kubectl get pods

```

 
**Note**: These nginx pods will act as the backend application

### Step 2: Create a service that can communicate with the backend pods
- Create a service.yaml file to create a service

```

vi service.yaml

```

 
- Add the following code in the service.yaml file

```

kind: Service
apiVersion: v1
metadata:
  name: service-demo
spec:
  ports:
    - port: 8080
      targetPort: 80

```

 
- Create the service from the service.yaml file and list the services

```
kubectl apply -f service.yaml


kubectl get service
 
```



### Step 3: Create an endpoint to send traffic from the service to the backend pods
- Get the IP address of the pod you wish to add as an endpoint

```
kubectl get pods -o wide

```

 
- Create an endpoint.yaml file to create an endpoint

```

vi endpoints.yaml

```

 
- Add the following code in the endpoints.yaml file

```

apiVersion: v1
kind: Endpoints
metadata:
  name: service-demo
subsets:
  - addresses:
          - ip: 192.168.78.65
    ports:
      - port: 80

```


**Note**: Replace the IP address in the above code with the IP address of your master node.
 
- Create the endpoint from the endpoints.yaml file and list the endpoints

```
kubectl apply -f endpoints.yaml


kubectl get endpoints
 

```

- Check the newly created service for the endpoint added to it

```

kubectl describe service service-demo

```

 

### Step 4: Create a frontend pod and connect it to the backend pods using the newly created service
- List the services and copy the Cluster-IP of the service created along with its port

```
kubectl get service
 ```
- Use the ubuntu image to create the frontend pod

```
kubectl run -it ubuntu --image=ubuntu
 ```
- Use the following commands to install curl

```

apt update
apt install curl

```

 
 
- Connect to the backend pod using the service and dedicated endpoint using the curl command

```

curl <Service-Cluster-IP>:<Service-Port>

```

 

-------------------------------------------------------------------------------------------------------------

# Lesson 8 Demo 3: Configure a Pod to Use a PersistentVolume for Storage

This section will guide you to: 
- Configure a Pod to Use a PersistentVolume for Storage

### Step 1: Attach a label to the master node in order to assign the pods to it
- Use the following command to add the label to the master node:

```
kubectl label nodes <master-node-name> <label-key>=<label-value>


kubectl get nodes --show-labels

```

 

### Step2: Create an html file on the master node
- Create a /mnt/data directory and navigate to it

```

sudo mkdir /mnt/data
cd /mnt/data

```

- In the directory, create an index.html file and test it

```

sudo sh -c "echo 'Hello from Kubernetes storage' > /mnt/data/index.html"
cat /mnt/data/index.html

```

 
**Note**: Run the cd command to return to the home directory.

### Step 3: Create a PersistentVolume for the storage
- Use the following command to create a PV configuration file

```

vi storage/pv-volume.yaml

```

 
- Add the following code in the pv-volume.yaml file:

```

apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv-volume
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"

```


 
- Use the configuration file to create the PersistentVolume and check the PV volume information

```
kubectl apply -f storage/pv-volume.yaml


kubectl get pv task-pv-volume
 
```



### Step 4: Create a PersistentVolumeClaim for providing physical storage to a pod
- Use the following command to create a PVC configuration file

```

vi storage/pv-claim.yaml

```

 
- Add the following code in the pv-claim.yaml file:

```

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: task-pv-claim
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 3Gi
 

```

- Use the configuration file to create the PersistentVolumeClaim and check the PV volume again

```
kubectl apply -f storage/pv-claim.yaml

kubectl get pv task-pv-volume

```

 

### Step 5: Create a Pod that uses the newly created PVC as a volume
- Use the following command to create a configuration file for a pod

```

vi storage/pv-pod.yaml

```

 
- Add the following code in the pv-pod.yaml file:

```

apiVersion: v1
kind: Pod
metadata:
  name: task-pv-pod
spec:
  volumes:
    - name: task-pv-storage
      persistentVolumeClaim:
        claimName: task-pv-claim
  containers:
    - name: task-pv-container
      image: nginx
      ports:
        - containerPort: 80
          name: "http-server"
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: task-pv-storage
  nodeSelector:
      noderole: master

```

 
- Use the configuration file to create the pod and check the PV volume again

```
kubectl apply -f storage/pv-pod.yaml

```
kubectl get pod task-pv-pod

```

 
- Use the following commands to execute the container running inside the pod and use storage from the PVC

```
kubectl exec -it task-pv-pod -- /bin/bash
curl http://localhost/

```

 
**Note**: Run the following commands if the curl is not installed in root shell:

```

apt update
apt install curl

```


-------------------------------------------------------------------------------------------------------------
# Lesson 8 Demo 4: Create a ConfigMap and Secret for a Pod

This section will guide you to: 
- Create a configmap and configure a pod to use it
- Create a secret and configure a pod to use it

### Step 1: Create a configmap and configure a pod to use it
- Create a configuration file for configmap

```

vi game-demo.yaml

```

 
- Add the following code in the game-demo.yaml file:

```

apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true

```

 
- Create the configmap using the game-demo.yaml file

```
kubectl apply -f game-demo.yaml

```

 
- Create a configuration file for a pod

```

vi configmap-demo-pod.yaml

```

 
- Add the following code in the configmap-demo-pod.yaml file:

```

apiVersion: v1
kind: Pod
metadata:
  name: configmap-demo-pod
spec:
  containers:
    - name: demo
      image: alpine
      command: ["sleep", "3600"]
      env:
        # Define the environment variable
        - name: PLAYER_INITIAL_LIVES # Notice that the case is different here
                                     # from the key name in the ConfigMap.
          valueFrom:
            configMapKeyRef:
              name: game-demo           # The ConfigMap this value comes from.
              key: player_initial_lives # The key to fetch.
        - name: UI_PROPERTIES_FILE_NAME
          valueFrom:
            configMapKeyRef:
              name: game-demo
              key: ui_properties_file_name
      volumeMounts:
      - name: config
        mountPath: "/config"
        readOnly: true
  volumes:
    # You set volumes at the Pod level, then mount them into containers inside that Pod
    - name: config
      configMap:
        # Provide the name of the ConfigMap you want to mount.
        name: game-demo
        # An array of keys from the ConfigMap to create as files
        items:
        - key: "game.properties"
          path: "game.properties"
        - key: "user-interface.properties"
          path: "user-interface.properties"

```

 
- Create the pod using the configmap-demo-pod.yaml file:

```
kubectl apply -f configmap-demo-pod.yaml

```

 
- List all the running pods

```
kubectl get pods

```

 
- Run the newly created pod and list the items of configmap

```
kubectl exec -it configmap-demo-pod -- /bin/sh
cd /config
ls

```

 
- Use the following command inside the pod to list all the environment variables:

```

printenv
 

```


### Step 2: Create a secret and configure a pod to use it
- Convert a username and password string into a base 64 encoded string

```

echo -n ‘admin’ | base64
echo -n ‘p@ssw0rd’ | base64
 
```


- Create a configuration file for secrets

```

vi secret.yaml

```

 
- Add the following code in the secret.yaml file:

```

apiVersion: v1
data:
  username: YWRtaW4=
  password: cEBzc3cwcmQ=
kind: Secret
metadata:
  creationTimestamp: 2020-11-24T18:41:56Z
  name: mysecret
  namespace: default
  resourceVersion: "164619"
  uid: cfee02d6-c137-11e5-8d73-42010af00002
type: Opaque

```

 
- Create the secret using the configuration file

```
kubectl apply -f secret.yaml

```

 
- Use the following command to check the stored password in the newly created secret

```
kubectl describe secrets mysecret

```

 
**Note**: In the above screenshot, the actual password string isn’t displayed. Instead the size of the encoded string is displayed.
- Create a configuration file for a pod

```

vi secret-demo-pod.yaml

```

 
- Add the following code in the secret-demo-pod.yaml file:

```

apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mypod
    image: redis
    volumeMounts:
    - name: foo
      mountPath: "/etc/foo"
      readOnly: true
  volumes:
  - name: foo
    secret:
      secretName: mysecret

```

 
- Create a pod from the secret-demo-pod.yaml file

```
kubectl apply -f secret-demo-pod.yaml
 

```

- List all the running pods

```
kubectl get pods

```

 
- Run the newly created pod and list the items of the secret

```
kubectl exec -it mypod -- sh

```

#### Run the following commands inside the pod

```

cd /etc/foo
ls -l
cat /etc/foo/username
cat /etc/foo/password

```

 


-------------------------------------------------------------------------------------------------------------