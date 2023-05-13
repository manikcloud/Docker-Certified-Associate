# Lesson 3 Demo 6: Push an Image to Docker Hub

## Simple Flask Application

This repository contains a minimal Flask application that displays a greeting message along with the hostname of the container it's running on.

### Application Code

The application is written in Python using the Flask web framework. 

#### This section will guide you to: 
- Push an image to Docker Hub

## Step  1: Create a Docker image from the Dockerfile
- Use the following commands to create a directory and navigate to it:
```
    
    mkdir pythonapp
	cd pythonapp
```
    
- Use the following command to create a Python app:
```
    
	nano app.py
```
    
 
- Write the following code in the app.py file:

```

from flask import Flask
import os
import socket

app = Flask(__name__)

@app.route("/")
def hello():
    html = "<h3>Hello {name}!</h3><b>Hostname:</b> {hostname}<br/>"
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname())

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)

```
    
 
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to create a requirements.txt file:
```
    
	nano requirements.txt
```
    
 
- Write the following code in the requirements.txt file:
```
    
Flask
```
    
 
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to create a Dockerfile:
```
    
nano Dockerfile
 
```
    
- Write the following code in the Dockerfile:
```
    
FROM python
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 80
ENV NAME world
CMD [“python”, “app.py”]
```
    
 
**Note:** Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.
- Use the following command to list all the files created in the pythonapp folder:
```
    
	ls
```
    
 
- Build the Docker image from the newly created Dockerfile
	
```
sudo  docker build -t varunmanik/flask-python_hostname . 

```
    

 
- List all the running images to check the newly created image

```
sudo docker images
```
    
 

## Step  2: Push the image to a Docker Hub repository

**Note:** In case you do not have a Docker Hub account, navigate to hub.docker.com and create an account.
- Use the following command to log in to your Docker Hub account:

```
sudo docker login
```
 
- Use the following command to tag the Docker image:

```
sudo docker tag varunmanik/flask-python_hostname varunmanik/flask-python_hostname:version1
```
**Note:** Replace USERNAME with the username of your Docker Hub account.

- Use the following command to push the Docker image to your Docker Hub repository:

```
sudo docker push varunmanik/flask-python_hostname 
```
-  Replace `varunmanik` with the username of your Docker Hub account.
 
- Go to your Docker Hub account and navigate to Repositories to see your recently pushed image
 

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