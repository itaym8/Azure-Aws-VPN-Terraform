variable "location" {
  type = string
  description = "Virtual Network location"
}

variable "vnet_name" {
  type = string
  description = "Virtual Network name"
}

variable "address_space" {
  type = list(string)
  description = "Virtual Network Address Space"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group name which Virtual Network will be deployed to"
}