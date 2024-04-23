# variable "ecs_task_execution_role_name" {
#   description = "ECS task execution role name"
# }

# variable "ecs_auto_scale_role_name" {
#   description = "ECS auto scale role name"
# }

# variable "az_count" {
#     description = "Number of AZs to cover in a given region"
# }

# variable "app_image" {
#     description = "Docker image to run in the ECS cluster"
# }

# variable "app_port" {
#   description = "Port exposed by the ddocker image to reddirect traffic to"
# }

# variable "app_count" {
#   description = "Number of docker containers to run"
# }

# variable "health_check_path" {
#   default = "/"
# }

# variable "fargate_cpu" {
#   description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
# }

# variable "fargate_cpu" {
#   description = "Fargate instance memory to provision (in MiB)"
# }

# variable "vpc_id" {
#   description = "VPC ID"
# }

variable "security_group_config" { }

variable "load_balancer_config" { }