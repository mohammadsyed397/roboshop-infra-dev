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
    Dev[Developer/Admin] -->|VPN Connection| VPNServer[OpenVPN Server - Public Subnet]
    VPNServer --> App[Private Subnet - Application Servers]
    VPNServer --> DB[Private DB Subnet - Databases]
    User[Customer] -->|HTTPS| ALB[Application Load Balancer - Public Subnet]
    ALB --> App
    App --> DB
    App --> Cache[Private Subnet - Cache Layer]
    Ansible[Ansible Config Mgmt] --> App
    Ansible --> DB
