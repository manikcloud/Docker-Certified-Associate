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