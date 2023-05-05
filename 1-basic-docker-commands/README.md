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

cd Docker-Certified-Associate
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




