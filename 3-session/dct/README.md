## Docker Content Trust with Signed Images

Follow these steps to create a content trust, sign an image, and upload it to Docker Hub:

1. **Enable Docker Content Trust:**



```

export DOCKER_CONTENT_TRUST=1
```

Generate a delegation key pair (private and public key) for the varun-dct key:


```

docker trust key generate varun-dct
```

Log in to Docker Hub with your varunmanik account:


```

docker login 
```

Pull the image you want to sign and push to Docker Hub (for example, let's use httpd):


```

docker pull httpd:latest
```

Tag the image with your Docker Hub account and a custom tag:


```

docker tag httpd:latest varunmanik/httpd:signed
```

Add the delegation key to your Docker Hub repository:


```

docker trust signer add --key=varun-dct.pub varun-dct varunmanik/httpd
```


Sign the image using the varun-dct key and push it to Docker Hub:


```

docker trust sign varunmanik/httpd:signed
docker push varunmanik/httpd:signed
```

Verify that the image is signed and uploaded to Docker Hub:


```

docker trust inspect --pretty varunmanik/httpd:signed
```

This guide demonstrates how to create a content trust, sign a Docker image, and upload it to Docker Hub using a custom signing key. Now, when someone pulls the varunmanik/httpd:signed image, they can be confident that it has been signed and verified.







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