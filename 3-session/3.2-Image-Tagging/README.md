Lesson 3 Demo 2: Image Tagging

This section will guide you to: 
●	Tag an image referenced by image ID, name, and repository

Step 1: Pull a Docker image
●	Use the following command to pull the latest nginx image:
```
    sudo  docker pull nginx:latest
    ```
    

 
●	List all the running images and check the newly pulled image:
```
    sudo  docker images
    ```
    

 

Step 2: Tag an image referenced by Image ID
●	Use the following command to tag the nginx image, referenced by Image ID, into the demo repository with version1.0:
```
    sudo  docker tag IMAGE_ID demo/nginx_img:version1.0
    ```
    

Note: Replace IMAGE_ID with the Image ID of your nginx image from step 1.
 
Note: Use ```
    sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

Step 3: Tag an image referenced by name
●	Use the following command to tag the nginx image, referenced by Image name, into the demo repository with version2.0:
```
    sudo  docker tag IMAGE_NAME demo/nginx_img:version2.0
    ```
    

Note: Replace IMAGE_NAME with the Name of your nginx image from step 2.
 
Note: Use 
    sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

Step 4: Tag an image referenced by name and tag
●	Use the following command to tag the nginx image, referenced by name and tag, into the demo repository with version3.0:
```
    sudo  docker tag IMAGE_NAME:IMAGE_TAG demo/nginx_img:version3.0.latest
```
    
Note: Replace IMAGE_NAME and IMAGE_TAG with the Name and Tag of your nginx image from step 3.
 
Note: Use 
    sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

Step 5: Tag an image for a private repository
●	Use the following command to tag an image for a private repository:
```
    sudo  docker tag IMAGE_ID myregistry:5000/demo/nginx_img:version4.0
```
    
Note: Replace IMAGE_ID with the Image ID of your nginx image from step 4.
 
Note: Use 
    sudo  docker images command to see the newly tagged image under myregistry:5000/demo/nginx_img repository.
