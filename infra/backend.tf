terraform {
  backend "s3" {
    bucket  = "alismed-terraform"
    key     = "ecs-fargate/terraform.tfstate"
    region  = "us-east-1" // Must be a static value
    encrypt = true
  }
}
