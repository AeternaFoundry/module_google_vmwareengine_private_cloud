variable "vmwareengine_private_clouds" {
  description = <<EOT
Map of vmwareengine_private_clouds, attributes below
Required:
    - location
    - name
    - management_cluster (block):
        - autoscaling_settings (optional, block):
            - autoscaling_policies (required, block):
                - autoscale_policy_id (required)
                - consumed_memory_thresholds (optional, block):
                    - scale_in (required)
                    - scale_out (required)
                - cpu_thresholds (optional, block):
                    - scale_in (required)
                    - scale_out (required)
                - node_type_id (required)
                - scale_out_size (required)
                - storage_thresholds (optional, block):
                    - scale_in (required)
                    - scale_out (required)
            - cool_down_period (optional)
            - max_cluster_node_count (optional)
            - min_cluster_node_count (optional)
        - cluster_id (required)
        - node_type_configs (optional, block):
            - custom_core_count (optional)
            - node_count (required)
            - node_type_id (required)
        - stretched_cluster_config (optional, block):
            - preferred_location (optional)
            - secondary_location (optional)
    - network_config (block):
        - management_cidr (required)
        - vmware_engine_network (optional)
Optional:
    - deletion_delay_hours
    - deletion_policy
    - description
    - project
    - send_deletion_delay_hours_if_zero
    - type
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location                          = string
    name                              = string
    deletion_delay_hours              = optional(number)
    deletion_policy                   = optional(string)
    description                       = optional(string)
    project                           = optional(string)
    send_deletion_delay_hours_if_zero = optional(bool)
    type                              = optional(string)
    management_cluster = object({
      autoscaling_settings = optional(object({
        autoscaling_policies = list(object({
          autoscale_policy_id = string
          consumed_memory_thresholds = optional(object({
            scale_in  = number
            scale_out = number
          }))
          cpu_thresholds = optional(object({
            scale_in  = number
            scale_out = number
          }))
          node_type_id   = string
          scale_out_size = number
          storage_thresholds = optional(object({
            scale_in  = number
            scale_out = number
          }))
        }))
        cool_down_period       = optional(string)
        max_cluster_node_count = optional(number)
        min_cluster_node_count = optional(number)
      }))
      cluster_id = string
      node_type_configs = optional(list(object({
        custom_core_count = optional(number)
        node_count        = number
        node_type_id      = string
      })))
      stretched_cluster_config = optional(object({
        preferred_location = optional(string)
        secondary_location = optional(string)
      }))
    })
    network_config = object({
      management_cidr       = string
      vmware_engine_network = optional(string)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vmwareengine_private_clouds : (
        v.management_cluster.autoscaling_settings == null || (length(v.management_cluster.autoscaling_settings.autoscaling_policies) >= 1)
      )
    ])
    error_message = "Each autoscaling_policies list must contain at least 1 items"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

