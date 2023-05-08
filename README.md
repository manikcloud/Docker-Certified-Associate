# Docker-Certified-Associate
## Docker Certification Training (Simplilearn Course)

**Course:** DOCKER CERTIFICATION TRAINING\
**Duration:** 24 hours

## Lessons

1. **Course Introduction**

2. **Introduction to Docker**

3. **Image Creation, Management, and Registry**
   - Image creation
   - Managing images
   - Docker registry

4. **Networking**
   - Docker network
   - Network types
   - Network configuration

5. **Orchestration**
   - Docker Compose
   - Docker Swarm
   - Other orchestration tools

6. **Installation and Configuration of Mirantis Products**
   - Mirantis Container Cloud
   - Mirantis Container Runtime
   - Mirantis Secure Registry

7. **Security**
   - Docker security best practices
   - Security scanning
   - Secrets management

8. **Docker Kubernetes Service (DKS)**
   - Introduction to Kubernetes
   - Kubernetes architecture
   - Deploying applications with Kubernetes


# Full Course Outline
<details>

## 1: Course Introduction

    1. What Is Docker?
    2. Features of Docker
    3. Virtual Machine vs. Docker
    4. Industries Using Docker
    5. Exam Information
    6. Examination Format
    7. Course Outline
    8. Course Outcome
    9. Course Components
    10. Customer Support

## 2: Introduction to Docker

    1. Docker Introduction
    2. Docker Engine
    3. Docker Properties
    4. Installation of Docker Community Edition
    5. Assisted practice: Install, Upgrade, and Uninstall Docker CE for Linux
    6. Assisted practice: Configure Docker Daemon to Start on Boot
    7. Docker: Architecture
    8. Assisted Practice: Images and Containers
    9. Knowledge Check

## 3: Image Creation, Management, and Registry

    1. Images
    2. Containers
    3. Service
    4. Overview and Instructions
    5. Assisted Practice: Create a Docker Image
    6. Layers of Images
    7. Flattening
    8. Docker Commit
    9. Tag an Image
    10. Assisted Practice: Image Tagging
    11. Filter and Format
    12. Basic Commands
    13. The copy-on-write (COW) Strategy
    14. Registry
    15. Repositories
    16. Private Repositories
    17. Docker Push, Content Trust, and Pull
    18. Assisted Practice: Deploy a registry
    19. Assisted Practice: Configure a registry
    20. Assisted Practice: Log in to a registry
    21. Assisted Practice: Push an Image to Docker Hub
    22. Assisted Practice: Push an image to a registry
    23. Prune Images and Containers
    24. Assisted Practice: Inspect, Remove and Prune Images
    25. Assisted Practice: Pull and Delete an Image
    26. Knowledge Check

## 4: Networking

    1. Network Architecture
    2. Bridge networks
    3. Assisted Practice: Create a Bridge Network
    4. Assisted Practice: Create a User-Defined Bridge Network
    5. Host networking
    6. Assisted practice: Create a Host Network
    7. Overlay networks
    8. Macvlan networks
    9. Assisted practice: Create Macvlan networks
    10. None Network
    11. Prune Network
    12. Container networking model
    13. Container Networking
    14. Use Cases of Network Drivers
    15. Identifying Ports
    16. Publishing Ports
    17. Assisted Practice: Publishing Ports
    18. Traffic
    19. Assisted Practice: Configure Docker to Use External DNS
    20. Docker Link
    21. Knowledge Check


## 5: Orchestration

    1. Container: Overview
    2. Services and types (replicated and global)
    3. Tasks
    4. Swarm
    5. Nodes 
    6. Manager nodes
    7. Worker nodes
    8. Assisted practice: Set Up Swarm Cluster with Manager and Worker Nodes
    9. Assisted practice: Join nodes to swarm
    10. Assisted Practice: Create Replicated and Global Services
    11. Assisted practice: Running Container vs. Running Service
    12. Assisted practice: Create Overlay networks
    13. Assisted practice: Deploy a Service on an Overlay Network
    14. Assisted practice: Run a Container into a Running Service under Swarm
    15. Assisted practice: Demonstrate Locking in Swarm Cluster
    16. Drain swarm node
    17. Assisted practice: Draining the swarm node
    18. Docker Inspect
    19. Assisted practice: Inspect a service on swarm
    20. Compose
    21. Compose: Configuration
    22. Docker stack deploy
    23. Assisted practice: Convert an Application Deployment into a Stack
    24. Manipulate services in stack
    25. Scaling
    26. Assisted practice: Increase the Number of Replicas
    27. Persistent Storage
    28. Volumes
    29. Bind Mounts
    30. tmpfs Mounts
    31. Assisted practice: Mount Volumes via Swarm Services
    32. Assisted Practice: Demonstrate How to Use Storage Across Cluster Nodes
    33. Prune Volumes
    34. Docker Storage Drivers
    35. DeviceMapper
    36. Devicemapper Workflow
    37. Devicemapper and Docker Performance
    38. Assisted Practice: Select Storage Driver and Configure Device Mapper
    39. Graph Driver
    40. Labels
    41. Assisted practice: Apply Node Labels, Inspect the Labels, and Filter Swarm Nodes by Labels
    42. Quorum of managers
    43. Fault Tolerance
    44. Loss of Quorum
    45. Quorum Recovery
    46. Templates
    47. Assisted practice: Usage of Templates
    48. Logs
    49. Accessing Logs
    50. Troubleshooting Services
    51. Debugging
    52. Assisted practice: Troubleshoot a Service that Is Unable to Deploy
    53. Logging Drivers
    54. Configure Logging Drivers
    55. Assisted Practice: Logging Drivers
    56. Network Troubleshooting
    57. Assisted Practice: Troubleshooting container networking
    58. Backup: Swarm
    59. Backup: Restore
    60. Assisted Practice: Set up a Backup Schedule
    61. Swarm Disaster Recovery
    62. Knowledge Check
    63. LEP1: Containerizing Legacy Application
    64. LEP2: Creating a Docker Image and Creating a Replicated Service on Swarm Cluster

## 6: Installation and Configuration of Mirantis Products

    1. Mirantis Products: Overview
    2. Introduction to Mirantis Container Runtime
    3. Features of MCR
    4. Installation Requirements
    5. Installation Methods
    6. Uninstall MCR
    7. Introduction to Mirantis Kubernetes Engine
    8. Features of MKE
    9. Orchestration
    10. MKE Architecture
    11. Interaction with MKE
    12. Installation Requirements
    13. Install MKE
    14. Uninstall MKE
    15. Mirantis Launchpad: Overview
    16. Mirantis Launchpad: Installation
    17. Assisted Practice: Install Mirantis Launchpad CLI
    18. Uninstall Launchpad
    19. Upgrade Launchpad
    20. Joining Manager Nodes
    21. High Availability
    22. Load Balancing on MKE
    23. Load Balancing MKE and MSR
    24. Configuring Load Balancer
    25. Deploying Load Balancer
    26. Deploy
    26. Deploy Swarm Service Using MKE
    27. Access Control
    28. Grant
    29. Subject
    30. Assisted Practice: Create and Manage Teams and Users
    31. Role
    32. Built-in Roles
    33. Create a Custom Role
    34. Resource Collection
    35. Create a Grant
    36. Create a Kubernetes Grant
    37. Create a Swarm Grant
    38. Service Deployment
    39. Grant Composition
    40. Introduction to Mirantis Secure Registry
    41. Feature of MSR
    42. MSR Architecture
    43. MSR Components
    44. Networks
    45. Volumes
    46. Image Storage
    47. Installation Requirements
    48. Assisted Practice: Install Mirantis Secure Registry
    49. Post-Installation
    50. Uninstall MSR
    51. High Availability
    52. MSR Failure Tolerance
    53. Sizing MSR Installation
    54. Add Replicas
    55. Remove Replicas
    56. Load Balancer
    57. Configure Load Balancer
    58. Health Check of Replicas
    59. Load Balancer: Configuration and Deployment
    60. MKE: Backup
    61. MKE: Restore
    62. MSR: Backup
    63. MSR: Restore
    64. MKE Disaster Recovery
    65. MSR Disaster Recovery
    66. Knowledge Check
    67. LEP3: Creating a Grant with Custom Roles

## 7. Security

    1. Docker Security
    2. Default Engine Security
    3. Namespace
    4. Control Groups
    5. Docker Daemon Attack Surface
    6. Linux Kernel Capabilities
    7. Docker Content Trust
    8. Docker Content Trust Signature Verification
    9. Sign an Image
    10. Sign Images that MKE Can Trust
    11. Vulnerabilities
    12. Scan Images for Vulnerabilities
    13. MKE Client Bundle
    14. Integrate MKE with LDAP
    15. Configure the LDAP Integration
    16. LDAP Enabled
    17. LDAP Server
    18. LDAP User Search Configurations
    19. LDAP Test Login
    20. LDAP Sync Configuration
    21. Revoke User Access
    22. Data Synced from an Organization’s LDAP Directory
    23. Assisted Practice: Create MKE Client Bundles
    24. External Certificates with MKE
    25. External Certificates with MSR
    26. Configuration of Certificates
    27. Swarm Security
    28. Roles
    29. Secrets
    30. How Docker Manages Secrets
    31. Docker Secret Commands
    32. Knowledge Check

## 8. Docker Kubernetes Service (DKS)

### Kubernetes: Overview
    1. Introduction to Kubernetes
    2. Kubernetes Cluster
    3. Kubernetes Architecture

### Kubernetes CLI
    4. Kubernetes CLI
    5. kubectl Commands for Docker
    6. Assisted Practice: Access Kubernetes Cluster from Docker CLI

### Kubernetes Orchestration for Docker Enterprise
    7. Docker Kubernetes Service
    8. Kubernetes Orchestration for Docker Enterprise
    9. Security Features
    10. Kubernetes Orchestration in UCP

### Routing traffic to Kubernetes Pods
    11. Kubernetes Service
    12. Assisted Practice: Create a Service to Route Traffic From Frontend to Backend Pods
    13. Kubernetes ServiceTypes
    14. Kubernetes Networking Model

### Persistent Storage to Kubernetes
    15. Persistent Volumes
    16. Assisted Practice: Configure a Pod to Use a PersistentVolume for Storage
    17. Container Storage Interface
    18. Storage Classes

### Deployments and Configurations
    19. ReplicaSets
    20. Workload Deployments
    21. Configurations
    22. Assisted Practice: Create a ConfigMap and Secret for a Pod

### RBAC (Role-Based Access)
    23. Kubernetes grants
    24. RBAC Authorization


### Course-end Assessment Instructions
    25. Course-end Assessment Instructions
    26. Knowledge Check


</details>


We wish you all the best for your upcoming training with us.
Please contact your Teaching Assistants for further assistance and information.



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