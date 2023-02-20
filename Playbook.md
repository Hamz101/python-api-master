# PLAYBOOK - Interview Task 
                                                           
# THE TASK
1. To containerize a Flask API

2. To build Infra to deploy the app using ECS with Terraform

3. Create a bash script for deployment to AWS (build and push to ECR) with a health
check

# Arch diagram
<img width="461" alt="Screenshot 2023-02-20 at 09 49 55" src="https://user-images.githubusercontent.com/47979509/220071406-11a612bc-dd8b-4596-9feb-85563e5cd312.png">

# Steps taken to complete task
1.	Containerized the Flask API: By creating a Docker image from the Dockerfile.

2.	Created an ECR repository: Created a Elastic Container Registry (ECR) repository in my AWS account to store the Docker image.

3.	Wrote Terraform code to provision the infrastructure: To create necessary resources for deploying the flask api on ECS. This includes creating a VPC, subnets, ECS cluster, and Application Load Balancer

4.	I wrote a bash script that builds and pushes Docker image to ECR, registers the task definition, updates the ECS service, and performs a health check.


