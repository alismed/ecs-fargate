variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = ""
}

variable "profile" {
  description = "The AWS profile to use"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID to deploy the infrastructure"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "The ECS cluster name"
  type        = string
  default     = ""
}

variable "service_name" {
  description = "The ECS service name"
  type        = string
  default     = ""
}

variable "task_definition_name" {
  description = "The ECS task definition name"
  type        = string
  default     = "may-task"
}

variable "container_name" {
  description = "The ECS container name"
  type        = string
  default     = ""
}

variable "container_port" {
  description = "The ECS container port"
  type        = number
  default     = 80
}

variable "container_image" {
  description = "The ECS container image"
  type        = string
  default     = ""
}

variable "cpu" {
  description = "The ECS task CPU"
  type        = number
  default     = 256
}

variable "memory" {
  description = "The ECS task memory"
  type        = number
  default     = 512
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed for ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_port" {
  description = "The HTTP port to allow"
  type        = number
  default     = 80
}

variable "ssh_port" {
  description = "The SSH port to allow"
  type        = number
  default     = 22
}

variable "ingress_from_port" {
  description = "The ingress from port"
  type        = number
  default     = 0
}

variable "ingress_to_port" {
  description = "The ingress to port"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "The egress to port"
  type        = number
  default     = 0
}

variable "egress_from_port" {
  description = "The egress from port"
  type        = number
  default     = 0
}


variable "egress_protocol" {
  description = "The egress protocol"
  type        = string
  default     = "-1"
}

variable "security_group_name" {
  description = "The security group name"
  type        = string
  default     = ""
}

variable "security_group_description" {
  description = "The security group description"
  type        = string
  default     = ""
}

variable "desired_count" {
  description = "The desired count of ECS tasks"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
  default     = []
}

