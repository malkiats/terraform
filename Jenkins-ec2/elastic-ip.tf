# Resource-9: Create Elastic IP
resource "aws_eip" "jenkins-eip" {
  instance = aws_instance.jenkins-vm.id
  vpc      = true
  # Meta-Argument
  depends_on = [aws_internet_gateway.vpc-mslab-igw]
}
