output "outside_ip_address" {
  value = aws_vpn_connection.aws_site2site_vpn.tunnel1_address
}