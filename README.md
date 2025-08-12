# Roboshop Infrastructure – Terraform

A complete AWS infrastructure deployment for the **Roboshop e-commerce platform**, built with **Terraform** using a **modular architecture**.  
This setup is production-ready, scalable, and secure — ideal for e-commerce or web applications.

---

## 📌 Features
- **Networking:** VPC with public & private subnets across multiple AZs
- **Security:** Security Groups, Bastion Host, VPN access
- **Application Delivery:** Application Load Balancers (ALB) with SSL (ACM)
- **Databases:** RDS and NoSQL options
- **Scalability:** Auto Scaling Groups and target tracking policies
- **Modularity:** Each component is a reusable Terraform module
- **Multi-Environment Ready:** Can be configured for dev, stage, and prod

---

## 🏗 Architecture Diagram

```mermaid
graph TD
    A[User] --> B[ALB - HTTPS]
    B --> C[Public Subnet EC2 / App Servers]
    B --> D[Private Subnet - RDS Database]
    A -->|SSH| E[Bastion Host]
    E --> C
    C --> D
    B --> F[S3 Bucket for Assets]

