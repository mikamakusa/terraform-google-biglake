variable "catalog" {
  type = list(object({
    id       = number
    location = string
    name     = string
  }))
  default = []
}
variable "database" {
  type = list(object({
    id         = number
    catalog_id = any
    name       = string
    type       = string
    hive_options = list(object({
      location_uri = optional(string)
      parameters   = optional(map(string))
    }))
  }))
  default = []
}
variable "table" {
  type = list(object({
    id          = number
    name        = string
    database_id = any
    hive_options = optional(list(object({
      parameters = optional(map(string))
      table_type = optional(string)
      storage_descriptor = optional(list(object({
        location_uri  = optional(string)
        input_format  = optional(string)
        output_format = optional(string)
      })))
    })))
  }))
  default = []

  validation {
    condition     = length([for a in var.table : true if contains(["MANAGED_TABLE", "EXTERNAL_TABLE"], a.hive_options.table_type)]) == length(var.table)
    error_message = "Hive table type. For example, MANAGED_TABLE, EXTERNAL_TABLE."
  }
}