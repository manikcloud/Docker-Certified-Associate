# BuildKit Example commands 

This repository demonstrates the usage of Docker BuildKit to build and run a Docker image.

## Prerequisites

- Docker (with BuildKit enabled)

## Enabling BuildKit

To enable BuildKit, set the `DOCKER_BUILDKIT` environment variable to `1`:

```
export DOCKER_BUILDKIT=1
```
### Building the Docker Image
To build the Docker image, run the following command:


```

docker build -t buildkit-example .
```

This command builds a Docker image with the tag buildkit-example using the Dockerfile in the current directory.

#### Running the Docker Container
To run the Docker container, execute the following command:


```


docker run -d -p 3000:3000 --name buildkit-example-container buildkit-example
```

- This command runs the buildkit-example image in a container named buildkit-example-container. It also maps the container's port 3000 to the host's port 3000.

Now, the application should be accessible at http://localhost:3000.