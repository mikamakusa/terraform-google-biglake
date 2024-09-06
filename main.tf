resource "google_biglake_catalog" "this" {
  count    = length(var.catalog)
  location = lookup(var.catalog[count.index], "location")
  name     = lookup(var.catalog[count.index], "name")
  project  = data.google_project.this.id
}

resource "google_biglake_database" "this" {
  count   = length(var.catalog) == 0 ? 0 : length(var.database)
  catalog = try(element(google_biglake_catalog.this.*.id, lookup(var.database[count.index], "catalog_id")))
  name    = lookup(var.database[count.index], "name")
  type    = lookup(var.database[count.index], "type")

  dynamic "hive_options" {
    for_each = lookup(var.database[count.index], "hive_options")
    iterator = hive
    content {
      location_uri = join("/", ["gs:/", lookup(hive.value, "location_uri")])
      parameters   = lookup(hive.value, "parameters")
    }
  }
}

resource "google_biglake_table" "this" {
  count    = length(var.database) == 0 ? 0 : length(var.table)
  name     = lookup(var.table[count.index], "name")
  type     = "HIVE"
  database = try(element(google_biglake_database.this.*.id, lookup(var.table[count.index], "database_id")))

  dynamic "hive_options" {
    for_each = try(lookup(var.table[count.index], "hive_options") == null ? [] : ["hive_options"])
    iterator = hive
    content {
      parameters = lookup(hive.value, "parameters")
      table_type = lookup(hive.value, "table_type")

      dynamic "storage_descriptor" {
        for_each = try(lookup(hive.value, "storage_descriptor") == null ? [] : ["storage_descriptor"])
        iterator = sto
        content {
          location_uri  = lookup(sto.value, "location_uri")
          input_format  = lookup(sto.value, "input_format")
          output_format = lookup(sto.value, "output_format")

        }
      }
    }
  }
}