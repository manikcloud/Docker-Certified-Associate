# Lesson 3 Demo 5: Log in to a Registry

This section will guide you to:
- Log in to a local Docker registry

## Step 1: Log in to a local Docker registry
- Create a password file with a username and password used for logging in to the local registry

1. Make sure the auth directory is created:

```
mkdir -p auth
```

2. Run the Docker command using the httpd:2.4-alpine image to generate the httpd.htpasswd file with admin as both the username and password:

```
sudo docker run --entrypoint htpasswd httpd:2.4-alpine -Bbn admin admin > auth/httpd.htpasswd
```

- sudo docker run: Runs a Docker container.
--entrypoint htpasswd: Overrides the default entrypoint of the container with the htpasswd utility.
- httpd:2.4-alpine: Specifies the Docker image to use, which is httpd:2.4-alpine.

- `-Bbn` admin admin: Passes arguments to the htpasswd utility. 
`-B `uses bcrypt encryption, -b specifies that the password follows the username, and `-n` means the result will be displayed instead of saved to a file. 

- `admin admin` sets the username and password to admin.

- > auth/httpd.htpasswd: Redirects the output of the command to the auth/httpd.htpasswd file.

- This command generates an httpd.htpasswd file in the auth directory with admin as the username and password, using bcrypt encryption.

**Note:** Replace USERNAME and PASSWORD with your desired username and password respectively for docker login.
 
**Note:** In case you get an error “No such file or directory”, you can install the apache2- utils package by executing the following command 

```
sudo  apt-get install apache2-utils -y
```

- Then find the path of htpasswd using the command 
```
whereis htpasswd
```

 Next, you will have to change the path auth/httpd.htpasswd to the path shown after executing the whereis htpasswd command.

- Use the following command to login to the local registry created in the previous demo (Demo 3.4):

```
sudo  docker login localhost:5000
``` 
