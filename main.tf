resource "google_vmwareengine_private_cloud" "vmwareengine_private_clouds" {
  for_each = var.vmwareengine_private_clouds

  location                          = each.value.location
  name                              = each.value.name
  deletion_delay_hours              = each.value.deletion_delay_hours
  deletion_policy                   = each.value.deletion_policy
  description                       = each.value.description
  project                           = each.value.project
  send_deletion_delay_hours_if_zero = each.value.send_deletion_delay_hours_if_zero
  type                              = each.value.type

  management_cluster {
    dynamic "autoscaling_settings" {
      for_each = each.value.management_cluster.autoscaling_settings != null ? [each.value.management_cluster.autoscaling_settings] : []
      content {
        dynamic "autoscaling_policies" {
          for_each = autoscaling_settings.value.autoscaling_policies
          content {
            autoscale_policy_id = autoscaling_policies.value.autoscale_policy_id
            dynamic "consumed_memory_thresholds" {
              for_each = autoscaling_policies.value.consumed_memory_thresholds != null ? [autoscaling_policies.value.consumed_memory_thresholds] : []
              content {
                scale_in  = consumed_memory_thresholds.value.scale_in
                scale_out = consumed_memory_thresholds.value.scale_out
              }
            }
            dynamic "cpu_thresholds" {
              for_each = autoscaling_policies.value.cpu_thresholds != null ? [autoscaling_policies.value.cpu_thresholds] : []
              content {
                scale_in  = cpu_thresholds.value.scale_in
                scale_out = cpu_thresholds.value.scale_out
              }
            }
            node_type_id   = autoscaling_policies.value.node_type_id
            scale_out_size = autoscaling_policies.value.scale_out_size
            dynamic "storage_thresholds" {
              for_each = autoscaling_policies.value.storage_thresholds != null ? [autoscaling_policies.value.storage_thresholds] : []
              content {
                scale_in  = storage_thresholds.value.scale_in
                scale_out = storage_thresholds.value.scale_out
              }
            }
          }
        }
        cool_down_period       = autoscaling_settings.value.cool_down_period
        max_cluster_node_count = autoscaling_settings.value.max_cluster_node_count
        min_cluster_node_count = autoscaling_settings.value.min_cluster_node_count
      }
    }
    cluster_id = each.value.management_cluster.cluster_id
    dynamic "node_type_configs" {
      for_each = each.value.management_cluster.node_type_configs != null ? each.value.management_cluster.node_type_configs : []
      content {
        custom_core_count = node_type_configs.value.custom_core_count
        node_count        = node_type_configs.value.node_count
        node_type_id      = node_type_configs.value.node_type_id
      }
    }
    dynamic "stretched_cluster_config" {
      for_each = each.value.management_cluster.stretched_cluster_config != null ? [each.value.management_cluster.stretched_cluster_config] : []
      content {
        preferred_location = stretched_cluster_config.value.preferred_location
        secondary_location = stretched_cluster_config.value.secondary_location
      }
    }
  }

  network_config {
    management_cidr       = each.value.network_config.management_cidr
    vmware_engine_network = each.value.network_config.vmware_engine_network
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

