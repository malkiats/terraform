# Resource-8: Create EC2 Instance
resource "aws_instance" "jenkins-vm" {
  ami                    = "ami-0f1a5f5ada0e7da53" # Amazon Linux
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  subnet_id              = aws_subnet.vpc-mslab-subnet-1.id
  vpc_security_group_ids = [aws_security_group.mslab-vpc-sg.id]
  #user_data = file("apache-install.sh")
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update –y
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum upgrade
    sudo amazon-linux-extras install java-openjdk11 -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    EOF
  tags = {
    "Name" = "jenkins-vm"
  }    
}
