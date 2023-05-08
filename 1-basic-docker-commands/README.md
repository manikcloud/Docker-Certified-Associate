# Docker Basic Commands with Examples

## Prerequisites

- Make sure you have Docker installed on your system.
- Have a Docker Hub account and be logged in to the Docker CLI.

## Docker Commands

1. **Clone the GitHub repo:**

```

git clone https://github.com/manikcloud/Docker-Certified-Associate.git
```





2. **Build the Docker image:**

```

cd Docker-Certified-Associate/1-basic-docker-commands/
docker build -t varunmanik/httpd:latest .
```


3. **List images:**

```

docker images
```





4. **Run a Docker container:**

```

docker run -d -p 80:80 --name httpd-container varunmanik/httpd:latest
```





5. **List running containers:**

```

docker ps
```



6. **Execute a command inside a running container:**

```

docker exec httpd-container ps aux
```





7. **Pull an image from Docker Hub:**

```

docker pull varunmanik/httpd:latest

```




8. **Push an image to Docker Hub:**

```

docker login
docker push varunmanik/httpd:latest
```





9. **Search for images on Docker Hub:**

```

docker search httpd

```


10. **Show Docker version information:**

 ```
 docker version
 ```

11. **Display system-wide information:**

 ```
 docker info
 ```

12. **Stop a running container:**

 ```
 docker stop httpd-container
 ```

13. **Remove a container:**

 ```
 docker rm httpd-container
 ```

14. **Remove an image:**

 ```
 docker rmi varunmanik/httpd:latest
 ```

15. **Log out from Docker Hub:**

 ```
 docker logout
 ```
This guide covers the basic Docker commands using examples with the provided varunmanik/httpd Docker Hub repository and the GitHub repository.





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