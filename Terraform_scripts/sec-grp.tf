resource "aws_security_group" "Cluster_sg" {
  name        = "Allow_All_Ports"
  description = "Allow all port protocols"
  vpc_id      = aws_vpc.Cluster_vpc.id
  ingress = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}