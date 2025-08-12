# Roboshop Infrastructure – Terraform & VPN Secured AWS Environment

This repository contains a **production-ready AWS infrastructure** deployment for the **Roboshop e-commerce platform**, built with **Terraform** and secured with a **VPN gateway** using AWS OpenVPN Community Edition.  

The setup includes modular Terraform components to build a secure, scalable, and highly available cloud environment — ideal for ecommerce or similar workloads requiring strong security and automation.

---

## 📌 Features

- **Networking:** VPC with public, private, and dedicated DB subnets across multiple availability zones  
- **Security:** Bastion host, VPN gateway (OpenVPN server), and strict Security Groups  
- **Application Delivery:** Application Load Balancers (ALB) with SSL certificates (ACM)  
- **Databases:** RDS instances and NoSQL databases in isolated DB subnets  
- **Configuration Management:** Post-provisioning setup automated using Ansible  
- **Modularity:** Infrastructure split into reusable Terraform modules  
- **Multi-environment Ready:** Supports dev, staging, and production configurations  

---

## 🏗 Architecture Diagram

```mermaid
graph TD
    %% Define icons with labels (replace if you upload images to repo)
    classDef awsIcon fill:#232F3E,color:#fff,stroke:#fff,stroke-width:0.5px,font-weight:bold,font-family:Arial,sans-serif;

    Dev[Developer/Admin]:::awsIcon -->|VPN Connection| VPNServer[VPN Server (OpenVPN)\nPublic Subnet]:::awsIcon
    VPNServer --> App[Application Servers\nPrivate Subnet]:::awsIcon
    VPNServer --> DB[Databases (RDS / NoSQL)\nPrivate DB Subnet]:::awsIcon
    User[Customer]:::awsIcon -->|HTTPS| ALB[Application Load Balancer (ALB)\nPublic Subnet]:::awsIcon
    ALB --> App
    App --> DB
    Bastion[Bastion Host\nPublic Subnet]:::awsIcon --> App
    Ansible[Ansible Config Mgmt] --> App
    Ansible --> DB
