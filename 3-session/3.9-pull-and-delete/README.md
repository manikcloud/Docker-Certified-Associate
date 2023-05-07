# Lesson 3 Demo 9: Pull and Delete an Image

This section will guide you to: 
- Pull an image in Docker
- Delete an image in Docker

### Step 1: Pull the ubuntu:14.04 image from Docker Hub using the following command:
```

sudo docker pull ubuntu:14.04
 
```


### Step 2: Pull an ubuntu image using the Digest:
sudo docker pull ubuntu@DIGEST
**Note:** Replace DIGEST with the Digest Id of newly pulled ubuntu image in the previous ### Step.
 

### Step 3: Tag the image so that it points to your registry using the command:
sudo docker image tag ubuntu:14.04 localhost:5000/ubuntu_image
 

### Step 4: Push the image to your registry using the command:
sudo docker push localhost:5000/ubuntu_image
 
**Note:** In case of an error, run code docker run -d -p 5000:5000 --restart=always --name registry registry:2

### Step 5: Pull the image from the repository using the command:
sudo docker pull localhost:5000/ubuntu_image
 

### Step 6: Find all the images present using the command: 
sudo docker images
 

### Step 7: Delete all Docker images using the following command:
sudo docker rmi -f $(docker images -q)
 
**Note:** In case of errors, stop all Docker containers and then delete using the command mentioned above.
