terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket         = "<YOUR_TFSTATE_BUCKET>" # <- replace with your S3 bucket name
    key            = "bio-gitops-enterprise/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "<YOUR_DYNAMODB_TABLE>" # <- replace with your DynamoDB table
    encrypt        = true
  }
}
