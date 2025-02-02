# Inception

  The Inception project introduces system administration using Docker. You will set up a containerized infrastructure with NGINX, WordPress, and MariaDB, ensuring security, networking, and automation. This hands-on exercise strengthens DevOps skills by enforcing best practices in containerization and deployment.



## Docker & Docker Compose Explained

  ### 📌 What is Docker?
  Docker is an open-source containerization platform that allows you to package applications and their dependencies into lightweight, portable containers. These containers ensure that applications run consistently across different environments.
  ### 📌 What is Docker Compose?
  Docker Compose is a tool for managing multi-container applications. Instead of running multiple docker run commands, you define services in a docker-compose.yml file and start them all at once with: docker compose up
  #### How Docker Works in the Linux Kernel
  Docker uses Linux kernel features like:
  - **✅ Namespaces → Isolates processes (each container runs as if it's in its own OS).
  - **✅ Control Groups (cgroups) → Limits resource usage (CPU, RAM, etc.) per container.
  - **✅ UnionFS (OverlayFS, AUFS, etc.) → Creates lightweight, layered filesystems.
  - **✅ IPTables & Networking → Manages container communication.

Docker does NOT create a full virtual machine—it shares the host OS kernel, making it more efficient than VMs.
