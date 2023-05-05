
Here's a step-by-step guide with examples for the remaining Docker commands using the varunmanik/httpd:blue image. This guide assumes you have Docker installed and are familiar with the basic concepts.



## Step-by-step Guide

1. **Create a container**: Create a new container without starting it:

docker create --name my-httpd varunmanik/httpd:blue




2. **Attach to a running container**: Attach local standard input, output, and error streams to a running container:

First, start the container:

```

docker start my-httpd
```

Then, attach to the container:

```

docker attach my-httpd
```




Press `Ctrl+C` to detach from the container.

3. **Commit changes**: Create a new image from a container's changes:

First, make changes to the container's filesystem, such as adding a new file:

```

docker exec my-httpd bash -c "echo 'Hello, World!' > /usr/local/apache2/htdocs/hello.txt"
```

Then, commit the changes:

```

docker commit my-httpd varunmanik/httpd:blue-changes
```



4. **Copy files/folders**: Copy files/folders between a container and the local filesystem:

To copy a file from the container to your local machine:

```

docker cp my-httpd:/usr/local/apache2/htdocs/hello.txt ./hello.txt
```


5. **Inspect changes**: Show changes to files or directories on a container's filesystem:

```

docker diff my-httpd
```


6. **Get real-time events**: Display real-time events from the Docker server:

```

docker events
```


Press `Ctrl+C` to stop the event stream.

7. **Export container's filesystem**: Export a container's filesystem as a tar archive:

```

docker export my-httpd > my-httpd.tar
```





8. **Show image history**: Display the history of an image:

```

docker history varunmanik/httpd:blue

```


This guide provides examples of additional Docker commands using the varunmanik/httpd:blue image.