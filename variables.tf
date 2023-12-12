# ------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ------------------------------------------------------------------------------

variable "name" {
  description = "ECS Cluster name"
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ------------------------------------------------------------------------------

variable "capacity_providers" {
  description = "Capacity providers to associate with the cluster"
  type        = list(string)
  default     = []
}

variable "container_insights" {
  description = "ECS cluster container insights"
  type        = string
  default     = "disabled"
}

variable "service_connect_namespace" {
  description = "The ARN of the aws_service_discovery_http_namespace that's used when you create a service and don't specify a Service Connect configuration"
  type        = string
  default     = null
}

variable "default_capacity_provider_strategy" {
  description = "key is capacity_provider and value is weight"
  type        = map(any)
  default     = {}
}