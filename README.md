
[![Lint Terraform and Ansible](https://github.com/Fitah-farah/AIC-ANSIBLE-NGINX-AZURE/actions/workflows/ci.yml/badge.svg)](https://github.com/Fitah-farah/AIC-ANSIBLE-NGINX-AZURE/actions/workflows/ci.yml) 
# Terraform-Ansible-Nginx-Azure

🚀 A fully automated project that provisions an Azure VM using Terraform, configures it with Ansible, and deploys a Dockerized Nginx web server with a custom HTML page.

![Diagram](Screenshots/Diagram.png)


---

## 🌐 Overview

This project demonstrates Infrastructure as Code (IaC) and Configuration Management using:
- **Terraform** for provisioning Azure infrastructure
- **Ansible** for software configuration and app deployment
- **Docker** to containerize and run an Nginx web server
- **Azure Virtual Machine** to host the application

---

## ⚙️ Technologies Used

- [Terraform](https://www.terraform.io/)
- [Microsoft Azure](https://azure.microsoft.com/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/)
- [Nginx](https://www.nginx.com/)

---

## 🛠️ How It Works

1. **Terraform** provisions:
   - Resource Group
   - Virtual Network & Subnet
   - Public IP & NIC
   - NSG with ports 22 and 80 open
   - Linux VM with SSH access

2. **Ansible** connects to the VM and:
   - Installs Docker
   - Copies `Dockerfile` and `index.html`
   - Builds a custom Docker image
   - Runs Nginx container exposing port 80

3. **Web app** is live and accessible via the VM's public IP.

---

## 🚀 Getting Started

### 🔧 Prerequisites
   - Azure CLI
   - Terraform
   - Ansible
   - SSH key pair (`id_rsa` and `id_rsa.pub`)

### 🧱 Deploy Infrastructure

   bash

   cd terraform

   terraform init
   
   ![terraform init](Screenshots/terraform-init.png)

   terraform apply

   ![creating resources](Screenshots/terraform-res-creation.png)

🔐 Get Public IP
   
   bash
   
   Copy the terraform output public_ip add to the ansible inventory.ini file

   verify the created resources in azure.


   ![resources in azure](Screenshots/azure-resources.png)

### ⚙️ Configure & Deploy the app to azure vm with Ansible

   bash

   cd ../ansible

   ansible-playbook -i inventory.ini deploy.yml


   ![deploying ansible](Screenshots/deploying-the-app.png)


   ![live web](Screenshots/Deployed-to-azure.png)

### 🌍 Access Web App

Visit:
Copy

http://<your_public_ip>

Web app running in browser

![web live](Screenshots/Live-web.png)

### 🧠 Lessons Learned
   Modular Terraform structure improves reusability

   Ansible roles make configuration clean and reusable

   Dockerized apps simplify deployment on cloud VMs


### 🤝 Contributions
   Pull requests are welcome. Feel free to open issues for feature requests or bugs.


### LICENSE
[MIT](./LICENSE)

### Version
Current Release v1.0
