# Inception

## Overview
This project is designed to deepen your understanding of **system administration** using Docker. You will virtualize multiple Docker images and create them within your personal virtual machine, ensuring they interact correctly within a defined network.

## Table of Contents
- [What is Docker?](#what-is-docker)
- [How Docker Works with the Linux Kernel](#how-docker-works-with-the-linux-kernel)
- [Docker CLI, API, Daemon, and Engine](#docker-cli-api-daemon-and-engine)
- [Docker Compose](#docker-compose)
- [Project Requirements](#project-requirements)
- [Bonus Features](#bonus-features)
-------------------------------------
- [Mandatory Services](#mandatory-services)
- [Bonus Services](#bonus-services)
---


## What is Docker?
![Image 1](https://www.appsdeveloperblog.com/wp-content/uploads/2023/05/docker-tutorial-for-beginners.gif)
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

---

## Docker CLI, API, Daemon, and Engine
![Image 1](https://s7280.pcdn.co/wp-content/uploads/2015/04/key-1.png)

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

![Image 1](https://user-images.githubusercontent.com/54292953/147146268-a616f39a-3f16-41f8-80c9-db5494c3dfe7.png)

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


## Mandatory Services
This project requires setting up a small infrastructure composed of different services under specific rules. Each service runs inside its own container, and all containers communicate through a Docker network.

### 1. **NGINX (Web Server with TLS)**
![Image 1](https://cdn.botpenguin.com/assets/website/NGINX_11e20532e2.webp)
   - **What is NGINX?**
     - NGINX is a high-performance web server, reverse proxy, and load balancer known for its efficiency in handling concurrent connections.
     - It is event-driven and asynchronous, making it more efficient than traditional thread-based web servers like Apache.
   - **How it works:**
     - Handles HTTP and HTTPS requests.
     - Serves static files and proxies dynamic requests to backend servers.
     - Implements TLS encryption for secure communication.

### 2. **WordPress + PHP-FPM**
![Image 1](https://blog.cpanel.com/wp-content/uploads/2020/10/00-cpanel-php-fpm.png)
   - **What is WordPress?**
     - WordPress is an open-source Content Management System (CMS) used for building websites and blogs.
     - It runs on PHP and requires a MySQL/MariaDB database for storing content.
   - **What is PHP-FPM?**
     - PHP-FPM (FastCGI Process Manager) is an alternative PHP FastCGI implementation that improves performance by handling requests more efficiently.
   - **How it works:**
     - WordPress processes dynamic requests using PHP-FPM, which communicates with the MariaDB database for content storage.
     - PHP-FPM allows PHP scripts to run efficiently by managing worker processes.

### 3. **MariaDB (Database Server)**
![Image 1](https://mariadb.com/wp-content/uploads/2018/10/mariadb-social-share.jpg)
   - **What is MariaDB?**
     - MariaDB is an open-source relational database management system (RDBMS), developed as a fork of MySQL.
     - It is used to store structured data and efficiently manage SQL queries.
   - **How it works:**
     - Stores all WordPress site data, including user content and settings.
     - Uses SQL for data manipulation and retrieval.
     - Provides authentication and role-based access control.

### 4. **Volumes**
   - **What are Docker Volumes?**
     - Volumes provide persistent storage for data inside Docker containers.
     - Unlike bind mounts, Docker manages volumes, making them more efficient and portable.
   - **How it works:**
     - WordPress files are stored in a volume, ensuring data persists across container restarts.
     - MariaDB stores its database in a volume to retain data across reboots.

### 5. **Docker Network**
   - **What is a Docker Network?**
     - A Docker network enables containers to communicate securely and efficiently.
     - It isolates services from the host system and the internet unless explicitly configured otherwise.
   - **How it works:**
     - Containers communicate via a user-defined bridge network in `docker-compose.yml`.
     - Ensures controlled and secure communication between services.

---



## Bonus Services
### 1. **Redis Cache**
   - Redis is an in-memory key-value store used to cache frequently accessed data, reducing database load and improving performance.
   - It can be used with WordPress to cache pages, sessions, and database queries.

### 2. **FTP Server**
   - An FTP server allows remote access to files within a container, useful for managing WordPress uploads and themes.
   - It provides secure file transfers using protocols like FTPS.

### 3. **Static Website**
   - A simple static website can be deployed alongside the WordPress instance.
   - Useful for hosting documentation or landing pages without requiring PHP or a database.

### 4. **Adminer**
   - A lightweight, web-based database management tool for MariaDB.
   - Provides an easy-to-use interface for executing queries and managing databases.

### 5. **Portainer**
   - Portainer is a web-based UI for managing Docker containers, images, networks, and volumes.
   - Simplifies container monitoring, deployment, and management tasks.

---

## Conclusion
This project challenges you to master **Docker**, **networking**, and **security best practices**. By completing it, you will gain valuable experience in **containerized application deployment** and **system administration**.

Happy coding! 🚀
