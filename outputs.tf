output "catalog_id" {
  value = try(google_biglake_catalog.this.*.id)
}

output "catalog_name" {
  value = try(google_biglake_catalog.this.*.name)
}

output "database_id" {
  value = try(google_biglake_database.this.*.id)
}

output "database_name" {
  value = try(google_biglake_database.this.*.name)
}

output "table_id" {
  value = try(google_biglake_table.this.*.id)
}

output "table_name" {
  value = try(google_biglake_table.this.*.name)
}