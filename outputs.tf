output "vmwareengine_private_clouds_id" {
  description = "Map of id values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no id are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vmwareengine_private_clouds_create_time" {
  description = "Map of create_time values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no create_time are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "vmwareengine_private_clouds_delete_time" {
  description = "Map of delete_time values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no delete_time are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.delete_time if v.delete_time != null && length(v.delete_time) > 0 }
}
output "vmwareengine_private_clouds_deletion_delay_hours" {
  description = "Map of deletion_delay_hours values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no deletion_delay_hours are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.deletion_delay_hours if v.deletion_delay_hours != null }
}
output "vmwareengine_private_clouds_deletion_policy" {
  description = "Map of deletion_policy values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no deletion_policy are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "vmwareengine_private_clouds_description" {
  description = "Map of description values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no description are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.description if v.description != null && length(v.description) > 0 }
}
output "vmwareengine_private_clouds_expire_time" {
  description = "Map of expire_time values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no expire_time are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.expire_time if v.expire_time != null && length(v.expire_time) > 0 }
}
output "vmwareengine_private_clouds_hcx" {
  description = "Map of hcx values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no hcx are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.hcx if v.hcx != null && length(v.hcx) > 0 }
}
output "vmwareengine_private_clouds_location" {
  description = "Map of location values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no location are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.location if v.location != null && length(v.location) > 0 }
}
output "vmwareengine_private_clouds_management_cluster" {
  description = "Map of management_cluster values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no management_cluster are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => one(v.management_cluster) if v.management_cluster != null && length(v.management_cluster) > 0 }
}
output "vmwareengine_private_clouds_name" {
  description = "Map of name values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no name are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vmwareengine_private_clouds_network_config" {
  description = "Map of network_config values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no network_config are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => one(v.network_config) if v.network_config != null && length(v.network_config) > 0 }
}
output "vmwareengine_private_clouds_nsx" {
  description = "Map of nsx values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no nsx are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.nsx if v.nsx != null && length(v.nsx) > 0 }
}
output "vmwareengine_private_clouds_project" {
  description = "Map of project values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no project are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.project if v.project != null && length(v.project) > 0 }
}
output "vmwareengine_private_clouds_send_deletion_delay_hours_if_zero" {
  description = "Map of send_deletion_delay_hours_if_zero values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no send_deletion_delay_hours_if_zero are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.send_deletion_delay_hours_if_zero if v.send_deletion_delay_hours_if_zero != null }
}
output "vmwareengine_private_clouds_state" {
  description = "Map of state values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no state are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.state if v.state != null && length(v.state) > 0 }
}
output "vmwareengine_private_clouds_type" {
  description = "Map of type values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no type are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.type if v.type != null && length(v.type) > 0 }
}
output "vmwareengine_private_clouds_uid" {
  description = "Map of uid values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no uid are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "vmwareengine_private_clouds_update_time" {
  description = "Map of update_time values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no update_time are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "vmwareengine_private_clouds_vcenter" {
  description = "Map of vcenter values across all vmwareengine_private_clouds, keyed the same as var.vmwareengine_private_clouds except keys with no vcenter are omitted"
  value       = { for k, v in google_vmwareengine_private_cloud.vmwareengine_private_clouds : k => v.vcenter if v.vcenter != null && length(v.vcenter) > 0 }
}

