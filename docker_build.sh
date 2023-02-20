#!/bin/bash

# Check that Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit
fi

# Check that AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install AWS CLI and try again."
    exit
fi

IMAGE_NAME="app"
ECR_REPOSITORY="ecr-repo"
REGION="eu-west-2"
ACCOUNT_ID="675211575174"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Login to ECR
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# Tag the Docker image with the ECR repository URL
ECR_URL=$(aws ecr describe-repositories --repository-names $ECR_REPOSITORY --query 'repositories[0].repositoryUri' --output text)
echo $ECR_URL
docker tag $IMAGE_NAME $ECR_URL:$IMAGE_NAME
docker tag $IMAGE_NAME $ECR_URL:latest

# Push the Docker image to ECR
docker push $ECR_URL:$IMAGE_NAME
docker push $ECR_URL:latest

# Check that the image was successfully uploaded
if [ "$(docker images -q $ECR_URL:$IMAGE_NAME)" ]; then
  echo "Image uploaded successfully"
else
  echo "Image failed to upload"
fi
