output "dynamodb_tables_id" {
  description = "Map of id values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dynamodb_tables_arn" {
  description = "Map of arn values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "dynamodb_tables_attribute" {
  description = "Map of attribute values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.attribute if v.attribute != null && length(v.attribute) > 0 }
}
output "dynamodb_tables_billing_mode" {
  description = "Map of billing_mode values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.billing_mode if v.billing_mode != null && length(v.billing_mode) > 0 }
}
output "dynamodb_tables_deletion_protection_enabled" {
  description = "Map of deletion_protection_enabled values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.deletion_protection_enabled if v.deletion_protection_enabled != null }
}
output "dynamodb_tables_global_secondary_index" {
  description = "Map of global_secondary_index values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.global_secondary_index if v.global_secondary_index != null && length(v.global_secondary_index) > 0 }
}
output "dynamodb_tables_global_table_witness" {
  description = "Map of global_table_witness values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.global_table_witness) if v.global_table_witness != null && length(v.global_table_witness) > 0 }
}
output "dynamodb_tables_hash_key" {
  description = "Map of hash_key values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.hash_key if v.hash_key != null && length(v.hash_key) > 0 }
}
output "dynamodb_tables_import_table" {
  description = "Map of import_table values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.import_table) if v.import_table != null && length(v.import_table) > 0 }
}
output "dynamodb_tables_local_secondary_index" {
  description = "Map of local_secondary_index values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.local_secondary_index if v.local_secondary_index != null && length(v.local_secondary_index) > 0 }
}
output "dynamodb_tables_name" {
  description = "Map of name values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dynamodb_tables_on_demand_throughput" {
  description = "Map of on_demand_throughput values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.on_demand_throughput) if v.on_demand_throughput != null && length(v.on_demand_throughput) > 0 }
}
output "dynamodb_tables_point_in_time_recovery" {
  description = "Map of point_in_time_recovery values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.point_in_time_recovery) if v.point_in_time_recovery != null && length(v.point_in_time_recovery) > 0 }
}
output "dynamodb_tables_range_key" {
  description = "Map of range_key values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.range_key if v.range_key != null && length(v.range_key) > 0 }
}
output "dynamodb_tables_read_capacity" {
  description = "Map of read_capacity values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.read_capacity if v.read_capacity != null }
}
output "dynamodb_tables_region" {
  description = "Map of region values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.region if v.region != null && length(v.region) > 0 }
}
output "dynamodb_tables_replica" {
  description = "Map of replica values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.replica if v.replica != null && length(v.replica) > 0 }
}
output "dynamodb_tables_restore_backup_arn" {
  description = "Map of restore_backup_arn values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.restore_backup_arn if v.restore_backup_arn != null && length(v.restore_backup_arn) > 0 }
}
output "dynamodb_tables_restore_date_time" {
  description = "Map of restore_date_time values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.restore_date_time if v.restore_date_time != null && length(v.restore_date_time) > 0 }
}
output "dynamodb_tables_restore_source_name" {
  description = "Map of restore_source_name values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.restore_source_name if v.restore_source_name != null && length(v.restore_source_name) > 0 }
}
output "dynamodb_tables_restore_source_table_arn" {
  description = "Map of restore_source_table_arn values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.restore_source_table_arn if v.restore_source_table_arn != null && length(v.restore_source_table_arn) > 0 }
}
output "dynamodb_tables_restore_to_latest_time" {
  description = "Map of restore_to_latest_time values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.restore_to_latest_time if v.restore_to_latest_time != null }
}
output "dynamodb_tables_server_side_encryption" {
  description = "Map of server_side_encryption values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.server_side_encryption) if v.server_side_encryption != null && length(v.server_side_encryption) > 0 }
}
output "dynamodb_tables_stream_arn" {
  description = "Map of stream_arn values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.stream_arn if v.stream_arn != null && length(v.stream_arn) > 0 }
}
output "dynamodb_tables_stream_enabled" {
  description = "Map of stream_enabled values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.stream_enabled if v.stream_enabled != null }
}
output "dynamodb_tables_stream_label" {
  description = "Map of stream_label values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.stream_label if v.stream_label != null && length(v.stream_label) > 0 }
}
output "dynamodb_tables_stream_view_type" {
  description = "Map of stream_view_type values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.stream_view_type if v.stream_view_type != null && length(v.stream_view_type) > 0 }
}
output "dynamodb_tables_table_class" {
  description = "Map of table_class values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.table_class if v.table_class != null && length(v.table_class) > 0 }
}
output "dynamodb_tables_tags" {
  description = "Map of tags values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "dynamodb_tables_tags_all" {
  description = "Map of tags_all values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "dynamodb_tables_ttl" {
  description = "Map of ttl values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.ttl) if v.ttl != null && length(v.ttl) > 0 }
}
output "dynamodb_tables_warm_throughput" {
  description = "Map of warm_throughput values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => one(v.warm_throughput) if v.warm_throughput != null && length(v.warm_throughput) > 0 }
}
output "dynamodb_tables_write_capacity" {
  description = "Map of write_capacity values across all dynamodb_tables, keyed the same as var.dynamodb_tables"
  value       = { for k, v in aws_dynamodb_table.dynamodb_tables : k => v.write_capacity if v.write_capacity != null }
}

