# LAB Troublsoot

This project focuses on resolving common problems related to package dependencies in Ubuntu, specifically Docker and `containerd`.

## Common Problem

The common problem faced is as follows:

```
The following packages have unmet dependencies:
docker.io : Depends: containerd (>= 1.2.6-0ubuntu1~)
E: Unable to correct problems, you have held broken packages.
```

## Solution

To solve this issue, follow the ### Steps mentioned below:

1. Update your package list:

```
sudo apt-get update
```

2. Upgrade the packages:

```
sudo apt-get upgrade
```

3. If the problem persists, try to install the containerd package manually:

```
sudo apt-get install containerd
```

4. Then, try to install Docker again:

```
sudo apt-get install docker.io
```

5. **If none of the above works**, you might want to consider using Docker's official installation script, which handles dependencies and configures Docker's repositories for you. You can use it like this:

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

6. If you're still having trouble, you might have "held" packages, which means there are packages that the system will not update. You can find these with:

```
sudo apt-mark showhold
```

7. If any packages are shown as held, you can try unholding them with:

```
sudo apt-mark unhold <package-name>
```

Replace <package-name> with the name of the package that is held. Once this is done, you can try installing Docker again.

----------------------------------------------------------------------------------------

