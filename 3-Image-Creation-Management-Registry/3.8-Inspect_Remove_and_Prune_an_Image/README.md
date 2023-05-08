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