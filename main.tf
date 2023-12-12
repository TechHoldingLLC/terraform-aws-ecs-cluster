###############################################
# ecs-cluster/main.tf #
###############################################

#tfsec:ignore:aws-ecs-enable-container-insight
resource "aws_ecs_cluster" "main" {
  name = var.name

  setting {
    name  = "containerInsights"
    value = var.container_insights
  }

  dynamic "service_connect_defaults" {
    for_each = var.service_connect_namespace != null ? [true] : []
    content {
      namespace = var.service_connect_namespace
    }
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = var.name
  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy

    content {
      # Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers#default_capacity_provider_strategy-configuration-block 
      base              = lookup(default_capacity_provider_strategy.value, "base", 0)
      weight            = default_capacity_provider_strategy.value["weight"]
      capacity_provider = default_capacity_provider_strategy.key
    }
  }
  depends_on = [aws_ecs_cluster.main]
}