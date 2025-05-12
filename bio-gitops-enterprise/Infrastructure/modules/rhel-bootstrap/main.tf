terraform {
  required_providers { aws = { source = "hashicorp/aws" } }
}

provider "aws" { region = var.region }

resource "null_resource" "bootstrap_rhel" {
  triggers = {
    instance_ids = join(",", var.instance_ids)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo subscription-manager register --username=${var.rhsm_username} --password=${var.rhsm_password}",
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo systemctl enable --now docker"
    ]

    connection {
      type        = "ssh"
      host        = element(var.private_ips, 0)
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
    }
  }
}
