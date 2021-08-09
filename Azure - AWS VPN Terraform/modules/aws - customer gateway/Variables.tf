variable "bgp_asn" {
  type = number
}

variable "ip_address" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}