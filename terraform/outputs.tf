output "ssh_connect_command" {
  value = "ssh -i ./id_rsa admin@${aws_lightsail_instance.wireguard.public_ip_address}"
}
