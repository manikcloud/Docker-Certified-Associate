# Lesson 3 Demo 4: Configure a Registry

This section will guide you to configure a registry in Docker.

## Step 1: Create an Environment Variable

1. Create an environment variable named `REGISTRY_variable` where `variable` is the name of the configuration option and `_` represents the indentation level.

2. Use the following command to override the root directory value by specifying a configuration variable from the environment using the `-e` argument:

```
sudo  docker run -d -p 5000:5000 --restart=always --name registry -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/somewhere registry:2
```




3. List the running containers to check the newly created registry with a new Storage filesystem root directory:

```
sudo  docker ps
```



## Step 2: Override the Entire Configuration File

1. Navigate to `/etc/docker/` folder and create a `config.yml` file:

cd /etc/docker
```
sudo  vi config.yml
```




2. Add the following code in the `config.yml` file:

```

version: 0.1
log:
  fields:
    service: registry
storage:
  cache:
    blobdescriptor: inmemory
  filesystem:
    rootdirectory: /var/lib/registry
http:
  addr: :5000
  headers:
    X-Content-Type-Options: [nosniff]
auth:
  htpasswd:
    realm: basic-realm
    path: /etc/registry
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3


```


**Note:** After writing the above mentioned code, press the `ESC` button and enter `:wq` to save the file and exit from the editor.

3. Use the following command to run a registry container with a new `config.yml` file specified in it:

```
sudo  docker run -d -p 8000:80 --restart=always --name registry2 -v pwd/config.yml:/etc/docker/config.yml registry:2
```





**Note:** You can use the Sudo  docker ps` command to check the running containers.

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