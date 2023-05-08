#  Lesson 3 Demo 8: Inspect, Remove, and Prune an Image

This section will guide you to: 
- Inspect a Docker image
- Remove a Docker image
- Prune untagged Docker images

## Step 1: Use the following command to pull the nginx image from Docker Hub:

```
sudo docker pull nginx:latest
```
 

## Step 2: Use the following command to inspect a Docker image:

```
sudo docker image inspect nginx:latest
 ```
 

 

## Step 3: Use the following command to list all the running images:

```
sudo docker images
```
 
 

## Step 4: Use the following command to remove an image:

```
sudo docker image rm IMAGE_ID
```
 
**Note**: Replace IMAGE_ID with Id of the image you wish to delete
 

## Step 5: Use the following command to force remove an image:

```
sudo docker image rm --force IMAGE_ID
```
 
**Note**: Replace IMAGE_ID with Id of the image you wish to delete forcefully
 

## Step 6: Use the following command to remove all untagged images:

```

sudo  docker image prune --all
```
 
 
