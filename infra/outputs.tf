output "cluster_name" {
  description = "The name of the ECS cluster"
  value       = aws_ecs_cluster.this.name
}

output "cluster_id" {
  description = "The ID of the ECS cluster"
  value       = aws_ecs_cluster.this.id
}

output "service_name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.this.name
}

output "task_definition_arn" {
  description = "The ARN of the Task Definition"
  value       = aws_ecs_task_definition.this.arn
}

output "security_group_name" {
  description = "The name of the ECS tasks security group"
  value       = aws_security_group.backend.name
}

output "security_group_id" {
  description = "The ID of the ECS tasks security group"
  value       = aws_security_group.backend.id
}

output "task_execution_role_arn" {
  description = "The ARN of the ECS Task Execution Role"
  value       = aws_iam_role.ecsTaskExecutionRole.arn
}

