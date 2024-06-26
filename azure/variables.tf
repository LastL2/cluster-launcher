variable "name" {
  description = "The base name used for all resources"
  type        = string
}

variable "location" {
  description = "The location (region or zone) in which the cluster will be created. If you specify a zone (such as centralus-1), the cluster will be a zonal cluster. If you specify a region (such as westus), the cluster will be a regional cluster spread across zones in the region."
  type        = string
}

variable "node_pool_settings" {
  description = "Cluster node pool settings"
  type        = map(string)
  default = {
    desired_capacity = 1
    min_capacity     = 1
    max_capacity     = 10
    instance_type    = "Standard_D16as_v4" # 16CPU/64GB
    disk_size        = 100
  }
}

variable "regional_availability_zones" {
  description = "Availability zones when using regional clusters"
  type        = list(number)
  default     = [1, 2, 3]
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster"
  type        = string
  default     = "1.21.9"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    Terraform = true
    LastNode  = true
  }
}

locals {
  is_zonal           = length(regexall("-", var.location)) == 1
  region             = local.is_zonal ? regex("(.*)(..$)", var.location)[0] : var.location
  availability_zones = local.is_zonal ? tolist([regex("(.*)(.$)", var.location)[1]]) : var.regional_availability_zones
  measure            = length(local.availability_zones)
}
