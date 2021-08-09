variable "location" {
  type = string
  description = "Public IP location"
}

variable "public_ip_name" {
  type = string
  description = "Public IP name"
}

variable "allocation_method" {
  type = string
  description = "Allocation Method - Static or Dynamic"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group name which Public IP will be deployed to"
}

variable "public_ip_sku" {
  type = string
  description = "Public IP SKU"
  default = "Basic"
}