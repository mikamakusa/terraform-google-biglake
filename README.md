## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_biglake_catalog.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/biglake_catalog) | resource |
| [google_biglake_database.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/biglake_database) | resource |
| [google_biglake_table.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/biglake_table) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog"></a> [catalog](#input\_catalog) | n/a | <pre>list(object({<br>    id       = number<br>    location = string<br>    name     = string<br>  }))</pre> | `[]` | no |
| <a name="input_database"></a> [database](#input\_database) | n/a | <pre>list(object({<br>    id         = number<br>    catalog_id = any<br>    name       = string<br>    type       = string<br>    hive_options = list(object({<br>      location_uri = optional(string)<br>      parameters   = optional(map(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_table"></a> [table](#input\_table) | n/a | <pre>list(object({<br>    id          = number<br>    name        = string<br>    database_id = any<br>    hive_options = optional(list(object({<br>      parameters = optional(map(string))<br>      table_type = optional(string)<br>      storage_descriptor = optional(list(object({<br>        location_uri  = optional(string)<br>        input_format  = optional(string)<br>        output_format = optional(string)<br>      })))<br>    })))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_catalog_id"></a> [catalog\_id](#output\_catalog\_id) | n/a |
| <a name="output_catalog_name"></a> [catalog\_name](#output\_catalog\_name) | n/a |
| <a name="output_database_id"></a> [database\_id](#output\_database\_id) | n/a |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | n/a |
| <a name="output_table_id"></a> [table\_id](#output\_table\_id) | n/a |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | n/a |
