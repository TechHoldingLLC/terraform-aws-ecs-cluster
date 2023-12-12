## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | Capacity providers to associate with the cluster | `list(string)` | `[]` | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | ECS cluster container insights | `string` | `"disabled"` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | key is capacity\_provider and value is weight | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | ECS Cluster name | `string` | n/a | yes |
| <a name="input_service_connect_namespace"></a> [service\_connect\_namespace](#input\_service\_connect\_namespace) | The ARN of the aws\_service\_discovery\_http\_namespace that's used when you create a service and don't specify a Service Connect configuration | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |