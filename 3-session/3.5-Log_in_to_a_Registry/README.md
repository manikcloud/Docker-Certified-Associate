# Lesson 3 Demo 5: Log in to a Registry

This section will guide you to:
- Log in to a local Docker registry

## Step 1: Log in to a local Docker registry
- Create a password file with a username and password used for logging in to the local registry
```
sudo  docker run --entrypoint htpasswd httpd:2.4 -Bbn USERNAME PASWORD > auth/httpd.htpasswd

```

**Note:** Replace USERNAME and PASSWORD with your desired username and password respectively for docker login.
 
**Note:** In case you get an error “No such file or directory”, you can install the apache2- utils package by executing the following command 

```
sudo  apt-get install apache2-utils
```

- Then find the path of htpasswd using the command whereis htpasswd. Next, you will have to change the path auth/httpd.htpasswd to the path shown after executing the whereis htpasswd command.

- Use the following command to login to the local registry created in the previous demo (Demo 3.4):

```
sudo  docker login localhost:5000
``` 
