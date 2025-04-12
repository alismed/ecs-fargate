# Profile
# - 'github-actions' is the github actions profile
# - 'localstack' is the localstack profile
# - 'default' is the default profile
profile                    = "github-actions"
region                     = "us-east-1"
vpc_id                     = "vpc-0bbb42131ef1b5ad7"
cluster_name               = "my-ecs-cluster"
service_name               = "my-ecs-service"
task_definition_name       = "my-ecs-task"
security_group_description = "Allow HTTP traffic"
security_group_name        = "my-ecs-security-group"
container_name             = "my-ecs-container"
subnet_ids                 = ["subnet-0c56f6efbe2fec4de", "subnet-0ac630be8257bccc9"]
container_image            = "alismed/ecs-fargate:latest"

tags = {
  Environment = "dev"
  Description = "API infraestructure"
  Department  = "Engineering"
  Service     = "API ECS Fargate"
}