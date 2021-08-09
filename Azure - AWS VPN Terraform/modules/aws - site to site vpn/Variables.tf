variable "customer_gateway_id" {
  type = string
}

variable "type" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}

variable "tunnel1_inside_cidr" {
  type = string
}

variable "tunnel1_preshared_key" {
  type = string
}

variable "static_routes_only" {
  type = bool
  default = false
}

variable "tags" {
  type = map(string)
  default = {}
}