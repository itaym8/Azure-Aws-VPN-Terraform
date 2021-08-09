output "customer_gateway_ip" {
  value = aws_customer_gateway.aws_customer_gateway.ip_address
}

output "customer_gateway_id" {
  value = aws_customer_gateway.aws_customer_gateway.id
}