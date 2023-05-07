# BuildKit Example commands 

```
export DOCKER_BUILDKIT=1
docker build -t buildkit-example .
docker run -d -p 3000:3000 --name buildkit-example-container buildkit-example

```