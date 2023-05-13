# Lesson 3 Demo 2: Image Tagging

This section will guide you to: 
- Tag an image referenced by image ID, name, and repository

### Step 1: Pull a Docker image
- Use the following command to pull the latest nginx image:

```
    sudo  docker pull nginx:latest
```
    

 
- List all the running images and check the newly pulled image:

```
    sudo  docker images
 ```
    

 

### Step 2: Tag an image referenced by Image ID
- Use the following command to tag the nginx image, referenced by Image ID, into the demo repository with version1.0:

```
    sudo  docker tag IMAGE_ID demo/nginx_img:version1.0
 ```
    

**Note:** Replace IMAGE_ID with the Image ID of your nginx image from ### Step 1.
 
**Note:** Use sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

```
sudo  docker images

```

### Step 3: Tag an image referenced by name
- Use the following command to tag the nginx image, referenced by Image name, into the demo repository with version2.0:
```
    sudo  docker tag IMAGE_NAME demo/nginx_img:version2.0
 ```
    

**Note:** Replace IMAGE_NAME with the Name of your nginx image from ### Step 2.
 
**Note:** Use 
    sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

### Step 4: Tag an image referenced by name and tag
- Use the following command to tag the nginx image, referenced by name and tag, into the demo repository with version3.0:
```
    sudo  docker tag IMAGE_NAME:IMAGE_TAG demo/nginx_img:version3.0.latest
```
    
**Note:** Replace IMAGE_NAME and IMAGE_TAG with the Name and Tag of your nginx image from ### Step 3.
 
**Note:** Use 
    sudo  docker images command to see the newly tagged image under demo/nginx_img repository.

### Step 5: Tag an image for a private repository
- Use the following command to tag an image for a private repository:
```
    sudo  docker tag IMAGE_ID myregistry:5000/demo/nginx_img:version4.0
```
    
**Note:** Replace IMAGE_ID with the Image ID of your nginx image from ### Step 4.
 
**Note:** Use 
    sudo  docker images command to see the newly tagged image under myregistry:5000/demo/nginx_img repository.
--------------------------------------------------


# Lesson 3 Demo 5: Log in to a Registry

This section will guide you to:
- Log in to a local Docker registry

### Step 1: Log in to a local Docker registry
- Create a password file with a username and password used for logging in to the local registry

```
sudo docker run --entrypoint htpasswd httpd:2.4 -Bbn varun P@SSWORD > auth/httpd.htpasswd
```
**Note:** Replace USERNAME and PASSWORD with your desired username and password respectively for docker login.
 
**Note:** In case you get an error “No such file or directory”, you can install the apache2- utils package by executing the following command sudo apt-get install apache2-utils. Then find the path of htpasswd using the command whereis htpasswd. Next, you will have to change the path auth/httpd.htpasswd to the path shown after executing the whereis htpasswd command.
- Use the following command to login to the local registry created in the previous demo (Demo 3.4):
```
sudo docker login localhost:5000
```

# Disclaimer
<details>

Please note that the entire repository is owned and maintained by [Varun Kumar Manik](https://www.linkedin.com/in/vkmanik/). While every effort has been made to ensure the accuracy and reliability of the information and resources provided in this repository, Varun Kumar Manik takes full responsibility for any errors or inaccuracies that may be present.

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