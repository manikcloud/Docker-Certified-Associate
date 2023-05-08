# BuildKit Example commands 

This repository demonstrates the usage of Docker BuildKit to build and run a Docker image.

## What is Docker BuildKit?

Docker BuildKit is a modern, high-performance builder toolkit for Docker images. It improves the build process by introducing features such as:

- Concurrent building of multiple layers
- Advanced layer caching
- More efficient storage management
- Support for new Dockerfile features and syntax

BuildKit is designed to work with the current Dockerfile format but also enables the possibility of creating new frontend build systems with different syntax and features.


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