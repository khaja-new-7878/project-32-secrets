# Project 32: Secure Secret Injection with AWS Secrets Manager

This project demonstrates how to securely manage secrets using **AWS Secrets Manager** 
and inject them into an ECS Fargate task.

## Steps
1. Store DB credentials in Secrets Manager.
2. Create IAM role + policy to allow ECS to read the secret.
3. Configure ECS Task Definition to mount secrets into container.
4. Deploy ECS service and test.

