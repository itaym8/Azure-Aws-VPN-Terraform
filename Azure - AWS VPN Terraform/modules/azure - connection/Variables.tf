variable "location" {
  type = string
  description = "Connection location"
}

variable "connection_name" {
  type = string
  description = "Connection name"
}

variable "connection_resource_group_name" {
  type = string
  description = "Connection resource group name"
}

variable "connection_type" {
  type = string
  description = "Connection type"
  default = "IPsec"
}

variable "virtual_network_gateway_id" {
  type = string
  description = "VNG ID"
}

variable "shared_key" {
  type = string
}

variable "local_network_gateway_id" {
  type = string
  description = "Azure Local Network Gateway id"
}

variable "enable_bgp" {
  type = bool
  description = "Enable BGP - true or false"
  default = true
}