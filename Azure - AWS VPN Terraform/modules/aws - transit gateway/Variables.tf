variable "aws_asn" {
  type = number
}

variable "tags" {
  type = map(string)
  default = {}
}