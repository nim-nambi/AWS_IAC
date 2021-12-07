resource "aws_instance" "Master_node" {
  count = 1
  ami = var.server_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.Cluster_sg.id]
  subnet_id = element(aws_subnet.Cluster_subnets.*.id,count.index)
  key_name = var.key_name

  tags = {
    Name = "Master_Node"
    Type = "Master"
  }
}

resource "aws_instance" "Worker_node" {
  count = 1
  ami = var.server_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.Cluster_sg.id]
  subnet_id = element(aws_subnet.Cluster_subnets.*.id, count.index)
  key_name = var.key_name

  tags = {
    Name = "Worker_node"
    Type = "Worker"
  }
}

output "Master_node" {
  value = aws_instance.Master_node.public_ip
}

output "Worker_node" {
  value = aws_instance.Worker_node.public_ip
}