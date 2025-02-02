# Inception Project

## Overview
This project is designed to deepen your understanding of **system administration** using Docker. You will virtualize multiple Docker images and create them within your personal virtual machine, ensuring they interact correctly within a defined network.

## Table of Contents
- [What is Docker?](#what-is-docker)
- [How Docker Works with the Linux Kernel](#how-docker-works-with-the-linux-kernel)
- [Docker CLI, API, Daemon, and Engine](#docker-cli-api-daemon-and-engine)
- [Docker Compose](#docker-compose)
- [Project Requirements](#project-requirements)
- [Bonus Features](#bonus-features)
- [Submission Guidelines](#submission-guidelines)

---

## What is Docker?
Docker is a **containerization platform** that allows developers to package applications and their dependencies into lightweight, portable containers. These containers can run consistently across various environments, eliminating the "it works on my machine" problem.

### Key Features:
- **Isolation**: Containers run independently with their own dependencies.
- **Portability**: Works across different OS and cloud environments.
- **Efficiency**: Uses fewer resources compared to virtual machines.
- **Scalability**: Easy to scale up and manage with orchestration tools.

---

## How Docker Works with the Linux Kernel
Docker utilizes several Linux kernel features to create and manage containers efficiently:

### 1. **Namespaces** (Process Isolation)
Namespaces ensure that each container has its own separate view of the system (e.g., processes, network, filesystem, users). Key namespaces used by Docker:
- `pid` – Process isolation
- `net` – Separate networking stack
- `mnt` – Isolated filesystem mount points
- `uts` – Hostname and domain name isolation

### 2. **Cgroups** (Resource Control)
Control Groups (cgroups) allow Docker to limit and allocate resources (CPU, memory, disk I/O) to specific containers, ensuring fair resource usage.

### 3. **UnionFS (OverlayFS, AUFS, etc.)**
Union File Systems enable Docker to use a layered approach, making images lightweight and efficient by reusing common layers.

### 4. **Seccomp, AppArmor, SELinux** (Security Controls)
Docker enhances security by enforcing process restrictions and applying security policies.

---

## Docker CLI, API, Daemon, and Engine

### **1. Docker Engine**
Docker Engine is the core of Docker, responsible for creating and managing containers. It consists of:
- **Docker Daemon (`dockerd`)**: Runs in the background, handling container management.
- **REST API**: Allows external applications to communicate with the daemon.
- **CLI (`docker` command)**: User-friendly interface to interact with Docker.

### **2. Docker Daemon**
The Docker daemon (`dockerd`) runs as a background process and is responsible for managing:
- Containers
- Images
- Networks
- Storage volumes

### **3. Docker CLI**
The Docker Command-Line Interface (CLI) allows users to interact with the Docker Daemon via commands such as:
```sh
# List all running containers
docker ps

# Run a new container
docker run -d nginx

# Stop a container
docker stop <container_id>
```

### **4. Docker API**
The Docker REST API provides a programmatic way to manage Docker resources. Example:
```sh
curl --unix-socket /var/run/docker.sock http://localhost/images/json
```

---

## Docker Compose
Docker Compose is a tool that allows you to define and run multi-container Docker applications using a `docker-compose.yml` file.

### **How Docker Compose Works**
Instead of running multiple `docker run` commands manually, Docker Compose automates the process.
Example `docker-compose.yml` file:
```yaml
version: '3.8'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  database:
    image: mariadb
    environment:
      MYSQL_ROOT_PASSWORD: example
```
Run all services using:
```sh
docker-compose up -d
```

---

## Project Requirements
The project consists of setting up a small infrastructure with Docker under the following rules:

- Use Docker Compose.
- Each service runs in its dedicated container.
- Build containers from the latest stable version of **Alpine** or **Debian**.
- You must create your own Dockerfiles.
- Prohibited:
  - Pulling ready-made images (except Alpine/Debian).
  - Using `network: host` or `--link`.
  - Running infinite loops (`tail -f`, `sleep infinity`).
  
### **Mandatory Containers:**
- **NGINX** (with TLSv1.2 or TLSv1.3)
- **WordPress + PHP-FPM** (without NGINX)
- **MariaDB** (without NGINX)
- **Volumes:**
  - WordPress database
  - WordPress files
- **Custom Docker network** (containers must communicate via an internal network)

### **Security Measures:**
- No passwords in Dockerfiles.
- Use environment variables (`.env` file recommended).
- Store credentials securely using Docker secrets.

---

## Bonus Features
- **Redis Cache**: Improve WordPress performance by setting up Redis.
- **FTP Server**: Access WordPress files via FTP.
- **Static Website**: Deploy a simple website (no PHP allowed).
- **Adminer**: Web-based database management tool.
- **Custom Service**: Any additional useful service.

> ⚠️ **Bonus is evaluated only if the mandatory part is perfect.**

---

## Submission Guidelines
- Push your project to a Git repository.
- Double-check folder and file names.
- Use Git best practices (meaningful commits, organized structure).

---

## Conclusion
This project challenges you to master **Docker**, **networking**, and **security best practices**. By completing it, you will gain valuable experience in **containerized application deployment** and **system administration**.

Happy coding! 🚀
