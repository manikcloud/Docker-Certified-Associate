## Docker Private Registry on Port 5000

### Step 1: Pull the Docker Registry Image
1. Pull the official Docker registry image:
    ```
    docker pull registry:2
    ```

### Step 2: Run the Registry Container
2. Run the registry container on port 5000:
    ```
    docker run -d -p 5000:5000 --name my-private-registry registry:2
    ```

### Step 3: Push an Image to the Private Registry
3. Pull an example image from Docker Hub (if not already pulled):
    ```
    docker pull nginx
    ```

4. Tag the example image for your private registry:
    ```
    docker tag nginx localhost:5000/my-nginx
    ```

5. Push the tagged image to your private registry:
    ```
    docker push localhost:5000/my-nginx
    ```

### Step 4: Pull an Image from the Private Registry
6. Remove the local copy of the example image to simulate pulling it from the private registry:
    ```
    docker image rm nginx localhost:5000/my-nginx
    ```

7. Pull the example image from your private registry:
    ```
    docker pull localhost:5000/my-nginx
    ```
