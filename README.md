# AWS Secure Web Infrastructure with Terraform

## Project Overview

This project demonstrates the design and deployment of a secure, scalable, and production-style AWS cloud infrastructure using Terraform.

Built as a hands-on **Cloud Engineering & DevOps portfolio project**, it showcases:

- ✅ Infrastructure as Code (IaC)
- ✅ High Availability Architecture
- ✅ Secure AWS Networking
- ✅ Auto Scaling
- ✅ Monitoring & Alerting
- ✅ Remote Terraform State Management
- ✅ AWS Security Best Practices

> Deployed in the **AWS eu-west-1 (Ireland)** region using Terraform.

---

## Architecture Diagram

![Architecture Diagram](images/architecture-diagram.png)

---

## AWS Services Used

| Service | Purpose |
|---|---|
| Amazon VPC | Isolated networking environment |
| Public & Private Subnets | Segmentation and security |
| Internet Gateway | Internet connectivity |
| NAT Gateway | Secure outbound internet for private resources |
| EC2 | Web application servers |
| Application Load Balancer (ALB) | Traffic distribution |
| Auto Scaling Group (ASG) | High availability and elasticity |
| Launch Templates | Standardised EC2 deployments |
| RDS MySQL | Private managed database |
| S3 | Secure object storage |
| IAM Roles & Policies | Least-privilege access control |
| CloudWatch | Monitoring and metrics |
| SNS | Email alert notifications |
| Terraform S3 Backend | Remote state management |

---

## Infrastructure Features

### Networking
- Custom VPC with CIDR segmentation
- Two public subnets across multiple Availability Zones
- Two private subnets across multiple Availability Zones
- Route Tables and Internet Gateway configuration
- NAT Gateway for private subnet outbound traffic

### Security
- IAM roles attached to EC2 instances
- No hardcoded AWS credentials
- Private RDS deployment (`publicly_accessible = false`)
- Security Groups with least-privilege access
- S3 public access blocking enabled
- S3 encryption enabled (AES256)
- Terraform remote backend protected with versioning

### High Availability
- Multi-AZ subnet architecture
- Application Load Balancer across public subnets
- Auto Scaling Group with multiple EC2 instances
- Health checks integrated with Target Groups

### Monitoring & Alerts
- CloudWatch alarms for EC2 CPU utilisation
- CloudWatch alarms for RDS CPU utilisation
- SNS email notifications for infrastructure alerts
- ALB target health monitoring

---

## Getting Started

```bash
git clone https://github.com/sammyboy80/-AWS-Secure-Web-Infrastructure-with-Terraform.git
cd -AWS-Secure-Web-Infrastructure-with-Terraform
terraform init
terraform plan
terraform apply
```

---

## Author

**(Bidemi Olawumi)**  
Cloud Security Engineer | DevSecOps  
[GitHub](https://github.com/sammyboy80)
