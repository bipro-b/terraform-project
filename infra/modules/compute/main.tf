data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io awscli
    systemctl start docker
    systemctl enable docker

    REGION="${var.region}"
    IMAGE="${var.ecr_repo_url}:${var.image_tag}"

    # login to ecr
    aws ecr get-login-password --region $REGION | \
      docker login --username AWS --password-stdin ${var.ecr_repo_url}

    docker pull $IMAGE || exit 1

    docker stop app || true
    docker rm app || true

    docker run -d --name app -p 80:${var.app_port} $IMAGE
  EOF

  tags = {
    Name = "${var.project_name}-ec2"
  }
}
