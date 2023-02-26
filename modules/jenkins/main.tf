resource "aws_security_group" "jenkins" {
  name_prefix = "jenkins-"
  description = "Security group for Jenkins"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami                    = var.jenkins_ami
  instance_type         = var.jenkins_instance_type
  key_name              = var.key_name
  subnet_id             = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  user_data             = base64encode(templatefile("${path.module}/userdata.sh",
                              { k8s_endpoint = module.kubernetes.endpoint,
                                aws_region   = var.region,
                                aws_profile  = var.profile }))

  tags = {
    Name = "jenkins"
  }

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
