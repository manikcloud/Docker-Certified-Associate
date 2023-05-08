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