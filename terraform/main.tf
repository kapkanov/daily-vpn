resource "aws_lightsail_key_pair" "wireguard" {
  name = "daily_wireguard"
}

resource "local_sensitive_file" "ssh_private_key" {
  content  = aws_lightsail_key_pair.wireguard.private_key
  filename = "${path.module}/../id_rsa"
  file_permission = "0600"
}

resource "aws_lightsail_instance" "wireguard" {
  name              = "daily_vpn_wireguard"
  availability_zone = "eu-central-1b"
  blueprint_id      = "debian_11"
  bundle_id         = "nano_2_0"
  key_pair_name     = aws_lightsail_key_pair.wireguard.id
  tags = {
    foo = "bar"
  }
}

resource "aws_lightsail_instance_public_ports" "test" {
  instance_name = aws_lightsail_instance.wireguard.name

  port_info {
    protocol  = "udp"
    from_port = 51820
    to_port   = 51820
  }

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }
}

resource "local_file" "ansible_inventory" {
  content  = "lightsail ansible_user=admin ansible_host=${aws_lightsail_instance.wireguard.public_ip_address} ansible_ssh_private_key_file=../id_rsa"
  filename = "${path.module}/../ansible/hosts"
}

