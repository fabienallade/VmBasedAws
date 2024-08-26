build {
  sources = [
    "sources.amazon-ebs.vm"
  ]

  provisioner "shell" {
    execute_command = local.execute_command
    script = "./scripts/install-nginx.sh"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    script = "./scripts/install-nodejs.sh"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    inline = [
      "apt-get install unzip -y"
    ]
  }
}
