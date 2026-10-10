variable "dynamodb_tables" {
  description = <<EOT
Map of dynamodb_tables, attributes below
Required:
    - name
Optional:
    - billing_mode
    - deletion_protection_enabled
    - hash_key
    - range_key
    - read_capacity
    - region
    - restore_backup_arn
    - restore_date_time
    - restore_source_name
    - restore_source_table_arn
    - restore_to_latest_time
    - stream_enabled
    - stream_view_type
    - table_class
    - tags
    - tags_all
    - write_capacity
    - attribute (block):
        - name (required)
        - type (required)
    - global_secondary_index (block):
        - hash_key (optional)
        - key_schema (optional, block):
            - attribute_name (required)
            - key_type (required)
        - name (required)
        - non_key_attributes (optional)
        - on_demand_throughput (optional, block):
            - max_read_request_units (optional)
            - max_write_request_units (optional)
        - projection_type (required)
        - range_key (optional)
        - read_capacity (optional)
        - warm_throughput (optional, block):
            - read_units_per_second (optional)
            - write_units_per_second (optional)
        - write_capacity (optional)
    - global_table_witness (block):
        - region_name (optional)
    - import_table (block):
        - input_compression_type (optional)
        - input_format (required)
        - input_format_options (optional, block):
            - csv (optional, block):
                - delimiter (optional)
                - header_list (optional)
        - s3_bucket_source (required, block):
            - bucket (required)
            - bucket_owner (optional)
            - key_prefix (optional)
    - local_secondary_index (block):
        - name (required)
        - non_key_attributes (optional)
        - projection_type (required)
        - range_key (required)
    - on_demand_throughput (block):
        - max_read_request_units (optional)
        - max_write_request_units (optional)
    - point_in_time_recovery (block):
        - enabled (required)
        - recovery_period_in_days (optional)
    - replica (block):
        - consistency_mode (optional)
        - deletion_protection_enabled (optional)
        - kms_key_arn (optional)
        - point_in_time_recovery (optional)
        - propagate_tags (optional)
        - region_name (required)
    - server_side_encryption (block):
        - enabled (required)
        - kms_key_arn (optional)
    - ttl (block):
        - attribute_name (optional)
        - enabled (optional)
    - warm_throughput (block):
        - read_units_per_second (optional)
        - write_units_per_second (optional)
EOT

  type = map(object({
    name                        = string
    tags                        = optional(map(string))
    table_class                 = optional(string)
    stream_view_type            = optional(string)
    stream_enabled              = optional(bool)
    restore_to_latest_time      = optional(bool)
    restore_source_table_arn    = optional(string)
    restore_source_name         = optional(string)
    restore_date_time           = optional(string)
    restore_backup_arn          = optional(string)
    region                      = optional(string)
    read_capacity               = optional(number)
    range_key                   = optional(string)
    hash_key                    = optional(string)
    deletion_protection_enabled = optional(bool)
    billing_mode                = optional(string)
    tags_all                    = optional(map(string))
    write_capacity              = optional(number)
    attribute = optional(list(object({
      name = string
      type = string
    })))
    global_secondary_index = optional(list(object({
      hash_key = optional(string)
      key_schema = optional(list(object({
        attribute_name = string
        key_type       = string
      })))
      name               = string
      non_key_attributes = optional(set(string))
      on_demand_throughput = optional(object({
        max_read_request_units  = optional(number)
        max_write_request_units = optional(number)
      }))
      projection_type = string
      range_key       = optional(string)
      read_capacity   = optional(number)
      warm_throughput = optional(object({
        read_units_per_second  = optional(number)
        write_units_per_second = optional(number)
      }))
      write_capacity = optional(number)
    })))
    global_table_witness = optional(object({
      region_name = optional(string)
    }))
    import_table = optional(object({
      input_compression_type = optional(string)
      input_format           = string
      input_format_options = optional(object({
        csv = optional(object({
          delimiter   = optional(string)
          header_list = optional(set(string))
        }))
      }))
      s3_bucket_source = object({
        bucket       = string
        bucket_owner = optional(string)
        key_prefix   = optional(string)
      })
    }))
    local_secondary_index = optional(list(object({
      name               = string
      non_key_attributes = optional(list(string))
      projection_type    = string
      range_key          = string
    })))
    on_demand_throughput = optional(object({
      max_read_request_units  = optional(number)
      max_write_request_units = optional(number)
    }))
    point_in_time_recovery = optional(object({
      enabled                 = bool
      recovery_period_in_days = optional(number)
    }))
    replica = optional(list(object({
      consistency_mode            = optional(string)
      deletion_protection_enabled = optional(bool)
      kms_key_arn                 = optional(string)
      point_in_time_recovery      = optional(bool)
      propagate_tags              = optional(bool)
      region_name                 = string
    })))
    server_side_encryption = optional(object({
      enabled     = bool
      kms_key_arn = optional(string)
    }))
    ttl = optional(object({
      attribute_name = optional(string)
      enabled        = optional(bool)
    }))
    warm_throughput = optional(object({
      read_units_per_second  = optional(number)
      write_units_per_second = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.global_secondary_index == null || alltrue([for item in v.global_secondary_index : (item.hash_key == null || (length(item.hash_key) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.global_secondary_index == null || alltrue([for item in v.global_secondary_index : (item.key_schema == null || alltrue([for item in item.key_schema : (length(item.attribute_name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.global_secondary_index == null || alltrue([for item in v.global_secondary_index : (item.warm_throughput == null || (item.warm_throughput.read_units_per_second == null || (item.warm_throughput.read_units_per_second >= 12000)))])
      )
    ])
    error_message = "must be at least 12000"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.global_secondary_index == null || alltrue([for item in v.global_secondary_index : (item.warm_throughput == null || (item.warm_throughput.write_units_per_second == null || (item.warm_throughput.write_units_per_second >= 4000)))])
      )
    ])
    error_message = "must be at least 4000"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.point_in_time_recovery == null || (v.point_in_time_recovery.recovery_period_in_days == null || (v.point_in_time_recovery.recovery_period_in_days >= 1 && v.point_in_time_recovery.recovery_period_in_days <= 35))
      )
    ])
    error_message = "must be between 1 and 35"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.warm_throughput == null || (v.warm_throughput.read_units_per_second == null || (v.warm_throughput.read_units_per_second >= 12000))
      )
    ])
    error_message = "must be at least 12000"
  }
  validation {
    condition = alltrue([
      for k, v in var.dynamodb_tables : (
        v.warm_throughput == null || (v.warm_throughput.write_units_per_second == null || (v.warm_throughput.write_units_per_second >= 4000))
      )
    ])
    error_message = "must be at least 4000"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

