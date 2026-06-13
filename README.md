# AWS Secure Web Infrastructure with Terraform

![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform&logoColor=white)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-blue)
![License](https://img.shields.io/badge/license-MIT-green)

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

"The diagram below illustrates the multi-tier architecture across two availability zones" 

<img width="1536" height="1024" alt="architecture-diagram" src="https://github.com/user-attachments/assets/6c9e3f0f-f50b-4632-9e81-5ec6809473dc" />


## VPC
<img width="1906" height="466" alt="VPC" src="https://github.com/user-attachments/assets/63f81126-020c-4507-9d76-125755de422b" />


## SUBNET

<img width="1894" height="523" alt="VPC Subnets" src="https://github.com/user-attachments/assets/ccfcc5ac-b7d3-4b3e-bef5-1b5c4ada3928" />


## ALB 

<img width="1893" height="361" alt="ALB" src="https://github.com/user-attachments/assets/d50e5206-3d76-4f1d-b079-ae4b1ec0168f" />

## AUTO SCALING GROUP

<img width="1906" height="357" alt="Auto Scaling Group" src="https://github.com/user-attachments/assets/c223b624-a9a1-4b56-84f1-8252ec898556" />

## EC2 instances

<img width="1872" height="342" alt="EC2 instances" src="https://github.com/user-attachments/assets/9fc97d3f-69f1-43ad-b916-7b4e83098786" />


##  CloudWatch alarms

<img width="1900" height="517" alt="CloudWatch alarms" src="https://github.com/user-attachments/assets/82f46216-81f6-4d85-a70b-d6282c21ebfe" />


## SNS

<img width="963" height="356" alt="SNS" src="https://github.com/user-attachments/assets/36ff9114-5f46-4303-9c07-e5eb3841ff6d" />

##  TERRAFORM PLAN

<img width="1219" height="678" alt="Terraform apply" src="https://github.com/user-attachments/assets/0afd4004-e53c-47e4-b551-50f3b12d7c40" />


## TERRAFORM APPLY

<img width="1210" height="459" alt="Terraform Apply" src="https://github.com/user-attachments/assets/5e398719-4237-4134-894b-410553c4512b" />



## Problem Faced: Invalid RDS Master Password

<img width="1218" height="433" alt="RDS" src="https://github.com/user-attachments/assets/2cd1b74d-2d09-4da8-b66e-24bbd5553128" />


While creating the RDS MySQL instance with Terraform, I encountered the following error:

```text
Error: creating RDS DB Instance (cloud-devops-mysql): operation error RDS: CreateDBInstance, https response error StatusCode: 400, api error InvalidParameterValue: The parameter MasterUserPassword is not a valid password because it is shorter than 8 characters.
```

### Cause

The RDS master password supplied through the Terraform variable `var.db_password` did not meet the AWS RDS password requirement. AWS requires the master password to be at least 8 characters long. Because the password was too short, the RDS instance creation failed.

### Resolution

I fixed the issue by supplying a stronger password using an environment variable instead of hardcoding it in Terraform files:

```bash
export TF_VAR_db_password='!'
```

Terraform automatically maps environment variables prefixed with `TF_VAR_` to Terraform input variables. In this case, `TF_VAR_db_password` was used as the value for:

```hcl
password = var.db_password
```

### Security Lesson Learned

I avoided storing the database password directly inside `terraform.tfvars` or committing it to GitHub. This follows better DevSecOps practice because secrets should not be stored in source code.

### Key Takeaway

This issue helped me understand that Terraform configuration can be syntactically correct, but cloud provider APIs may still reject resources if service-specific requirements are not met. It also reinforced the importance of secret management and validating cloud service constraints before deployment.








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


**Bidemi Olawumi**  
Cloud Security Engineer | DevSecOps  
[GitHub](https://github.com/sammyboy80) · [LinkedIn](https://www.linkedin.com/in/YOUR-PROFILE-URL)
