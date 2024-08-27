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
      "curl -fsSL https://fnm.vercel.app/install | bash",
      "source ~/.bashrc",
      "fnm use --install-if-missing 20",
      "nvm install --lts",
      "npm install -g pm2",
      "pm2 start /usr/share/nginx/html/fleetportal/server/main.js --name='ssr app'"
    ]
  }
}
