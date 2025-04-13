# API using AWS ECS Cluster Fargate with Terraform and GitHub Actions

This project demonstrates how to create a Node.js API and deploy it to AWS ECS Fargate using Terraform for infrastructure provisioning and GitHub Actions.

## Project Overview
The application consists of:
- Node.js Express REST API (port 3000)
- AWS ECS Fargate for containerized hosting
- Application Load Balancer for HTTP traffic (port 80)
- Terraform scripts for infrastructure management
- CI/CD pipeline using GitHub Actions

## Requirements

### Local Development
- Node.js >= 18
- AWS CLI configured
- Terraform CLI
- Docker
- ssh key pair

### AWS Resources
- AWS Account with appropriate permissions
- S3 Bucket for Terraform state

## Setup Instructions

### 1. AWS Configuration
```shell
# Configure AWS CLI credentials
aws configure

# Create ssh key if needed
ssh-keygen
```

### 2. Application Setup
```shell
# Install dependencies
npm init -y
npm install express

# Build and push Docker image
cd app
docker build -t alismed/ecs-fargate:latest .
docker login
docker push alismed/ecs-fargate:latest
```

### 3. Infrastructure Deployment
```shell
# Initialize Terraform
terraform -chdir=infra init

# Plan changes
terraform -chdir=infra plan

# Deploy infrastructure
terraform -chdir=infra apply -auto-approve
```

### 4. Testing the Deployment

```shell
# Get the ALB DNS name
terraform -chdir=infra output alb_dns_name

# Test the endpoint
curl http://<alb_dns_name>

# Alternative: use the full URL output
terraform -chdir=infra output alb_url
curl $(terraform -chdir=infra output -raw alb_url)
```

### 5. Clean Up
```shell
# Destroy infrastructure
terraform -chdir=infra destroy -auto-approve
```

### Local Testing

```shell
# Run container locally
docker run -d -p 3000:3000 alismed/ecs-fargate:latest

# Test local endpoint
curl http://localhost:3000/
```

## Infrastructure Details

- ECS Cluster running on Fargate
- Application Load Balancer (port 80)
- Containers running on port 3000
- Auto-scaling configuration
- CloudWatch logs enabled
- Security groups for ALB and ECS tasks

## GitHub Actions Workflow

The deployment process is automated using GitHub Actions with three stages:

1. **Validation** (01-validate.yaml)
   - Terraform validation
   - Variable checking

2. **Terraform Execution** (02-terraform.yaml)
   - AWS credentials setup
   - Infrastructure deployment

3. **PR Notification** (03-notify.yaml)
   - Deployment status updates
   - PR comments

### Testing Actions Locally

1. Install Act:
```bash
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

2. Run test workflow:
```bash
# List available workflows
act -l

# Run workflow with pull request event
act pull_request -e .act/pull_request.json

# Run specific workflow
act -W .github/workflows/main.yaml \
    -e .act/pull_request.json \
    --secret-file .act/.env \
    --container-architecture linux/amd64

# Run with verbose output
act -v pull_request -e .act/pull_request.json --secret-file .act/.env
```

## Troubleshooting

- Check ECS task status in AWS Console
- Review CloudWatch logs for container outputs
- Verify security group rules if connection fails
- Check ALB health check status