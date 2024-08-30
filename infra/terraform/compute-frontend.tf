data "aws_ami" "frontend" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = [var.frontend_image_name]
  }
}

data "aws_key_pair" "temp" {
  key_name = "temp_key"
}

resource "aws_network_interface" "frontend" {
  for_each = aws_subnet.frontend

  subnet_id = each.value.id
}

resource "aws_instance" "frontend" {

  for_each      = aws_subnet.frontend
  ami           = data.aws_ami.frontend.id
  instance_type = var.frontend_instance_type
  key_name      = data.aws_key_pair.temp.key_name
  user_data     = data.cloudinit_config.frontend.rendered

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.frontend[each.key].id
  }
}

resource "aws_network_interface_sg_attachment" "frontend" {
  for_each = aws_instance.frontend

  network_interface_id = each.value.primary_network_interface_id
  security_group_id    = aws_security_group.frontend.id
}

resource "aws_eip" "frontend" {
  for_each = aws_instance.frontend
  instance = each.value.id
}

data "cloudinit_config" "frontend" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOF
                   #cloud-config
                   EOF
  }
}