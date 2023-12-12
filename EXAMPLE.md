# ecs-cluster

Below is an example of calling this module.

## Create ECS Cluster
ECS cluster with fargate capacity provider is created.
```
module "ecs_cluster" {
  source = "./ecs-cluster"
  name   = "my-ecs-cluster"
}
```

## Recommendations
Enable [container insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html) for production

```
container_insights = "enabled"
```

## Create ECS Cluster with Fargate and Fargate-Spot capacity provider
Key is capacity_provider and value is weight. Only one capacity provider in a capacity provider strategy can have a base defined. Either define it for FARGATE or define it for FARGATE_SPOT. 
```
module "ecs_cluster" {
  source             = "./ecs-cluster"
  name               = "my-ecs-fargate-cluster"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy = {
    "FARGATE" = {
      base   = 2
      weight = 1
    },
    "FARGATE_SPOT" = {
      weight = 1
    }
  }
}
```

## Create ECS Cluster with service connect defaults
Configures a default Service Connect namespace. You can see namespace id for your cluster in Cloud Map with the name specified in `aws_service_discovery_http_namespace`. In namespace, the ARN of the `aws_service_discovery_http_namespace` is used when you create a service and don't specify a Service Connect configuration.
```
resource "aws_service_discovery_http_namespace" "cluster" {
  name        = "example"
  description = "CloudMap namespace for ecs cluster"
}

module "ecs_cluster" {
  source    = "./ecs-cluster"
  name      = "my-ecs-cluster"
  namespace = aws_service_discovery_http_namespace.cluster.arn
}
```