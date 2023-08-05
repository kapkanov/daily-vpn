resource "aws_lightsail_key_pair" "wireguard" {
  name = "home_wireguard"
}

resource "local_sensitive_file" "ssh_private_key" {
  content  = aws_lightsail_key_pair.wireguard.private_key
  filename = "${path.module}/id_rsa"
}

resource "aws_lightsail_instance" "wireguard" {
  name              = "wireguard"
  availability_zone = "eu-central-1b"
  blueprint_id      = "debian_11"
  bundle_id         = "nano_2_0"
  key_pair_name     = aws_lightsail_key_pair.wireguard.id
  tags = {
    foo = "bar"
  }
}
