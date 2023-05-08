# Lesson 3 Demo 7: Push an Image to a Registry

This section will guide you to: 
- Push an image to a registry

Note: Please ensure you successfully execute all the previous demos of this lesson. 
## Step 1: Copy an image from Docker Hub to your registry
- Pull the ubuntu image using the command:

```
sudo docker pull nginx
```

 
- Tag the image using the command:

```

sudo docker tag nginx localhost:5000/nginx
```


- Push the image to the local registry using the command:

```
sudo docker push localhost:5000/nginx
```

 
- Remove the locally cached images using the command:

```
sudo docker image remove nginx

```

 
- Pull the localhost:5000/nginx image from the local registry using the command:

```
sudo docker pull localhost:5000/nginx

```

 

## Step 2:  Stop the running registry container
- List all the running containers to check the registry container

```
sudo docker ps
```

 
- Stop the registry container using the following command:

```
sudo docker container stop registry
 
```

