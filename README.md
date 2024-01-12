# Kubernetes ECR Authentication Sample

This repository provides a sample setup for integrating Kubernetes with Amazon ECR (Elastic Container Registry).

## Prerequisites

Ensure you have the following prerequisites before using this sample:

- Authentication with AWS:
  - The [AWS SDK credential chain](https://docs.aws.amazon.com/sdkref/latest/guide/standardized-credentials.html) is used to locate credentials for authenticating with AWS. For example, when you run the ECR credential provider on an EC2 instance, credentials are usually fetched from IMDS and no other configuration is necessary. If you do not run the ECR credential provider on EC2, you can specify credentials using environment variables, the ~/.aws/config file, or any other standard method in the credential chain.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/k8s-ecr-sample.git
   cd k8s-ecr-sample
   ```

2. Run [setup.sh](./setup.sh) line by line.
