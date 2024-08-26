data "amazon-ami" "ubuntu2204" {
  filters = {
    architecture        = "x86_64"
    virtualization-type = "hvm"
    root-device-type    = "ebs"
    name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  }
  owners      = ["099720109477"]
  most_recent = true
  region      = var.aws_primary_region
}

source "amazon-ebs" "vm" {
  region        = var.aws_primary_region
  ami_name      = "${var.image_name}-${var.image_version}"
  instance      = var.aws_instance_type
  ssh_interface = "public_ip"
  communicator  = "ssh"
  source_ami    = data.amazon-ami.ubuntu2204.id
}