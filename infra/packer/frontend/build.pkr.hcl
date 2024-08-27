build {
  sources = [
    "sources.amazon-ebs.vm"
  ]

  provisioner "shell" {
    execute_command = local.execute_command
    script = "./scripts/install-nodejs.sh"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    script = "./scripts/install-nginx.sh"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    inline = [
      "apt-get install unzip -y"
    ]
  }

  provisioner "file" {
    source = "./deployment.zip"
    destination = "/tmp/deployment.zip"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    inline = [
      "unzip /tmp/deployment.zip -d /usr/share/nginx/html/fleetportal"
    ]
  }

  provisioner "shell" {
    execute_command = local.execute_command
    inline=[
      "pm2 start /usr/share/nginx/html/fleetportal/server/server.mjs --name='ssr app'"
    ]
  }
}
