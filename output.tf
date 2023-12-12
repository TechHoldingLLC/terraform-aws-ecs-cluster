output "arn" {
  value = aws_ecs_cluster.main.arn
}

output "name" {
  value = aws_ecs_cluster.main.name
}

output "id" {
  value = aws_ecs_cluster_capacity_providers.main.id
}