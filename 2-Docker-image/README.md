# Docker Image for Custom HTTPD Server

This Docker image is based on the `varunmanik/httpd:cicd` image and serves a custom `index.html` file.

## Dockerfile

The Dockerfile is as follows:

```Dockerfile
FROM varunmanik/httpd:cicd
LABEL maintainer="Varun Manik"

COPY ./index.html /usr/local/apache2/htdocs/

EXPOSE 80
```

## Usage

1. **Build the Docker image:**

   ```
   docker build -t my-custom-httpd .
   ```

2. **Run the Docker container:**

   ```
   docker run -d -p 80:80 --name my-httpd my-custom-httpd
   ```

3. **Access the custom HTTPD server:**

   Open your browser and visit `http://localhost`.

## Stopping the Container

To stop the running container, execute the following command:

```
docker stop my-httpd 
```

## Removing the Container

To remove the stopped container, execute the following command:

```
docker rm my-httpd
```
