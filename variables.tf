variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "project" {
  type        = string
  description = "Project final"
}

variable "environment" {
  type        = string
  description = "Environment code (dev, qa, prod)"
}

variable "container_image" {
  type        = string
  description = "Container image (DockerHub or ACR)"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container"
  default     = 80
}

variable "cpu" {
  type        = number
  description = "vCPU for the container app (e.g., 0.25, 0.5, 1.0)"
  default     = 0.25
}

variable "memory" {
  type        = string
  description = "Memory for the container app (e.g., 0.5Gi, 1Gi, 2Gi)"
  default     = "0.5Gi"
}

variable "min_replicas" {
  type        = number
  description = "Minimum replicas for autoscaling"
  default     = 1
}

variable "max_replicas" {
  type        = number
  description = "Maximum replicas for autoscaling"
  default     = 5
}


