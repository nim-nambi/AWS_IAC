resource "aws_instance" "Master_node" {
  count = 1
  ami = var.server_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.Cluster_sg.id]
  subnet_id = element(aws_subnet.Cluster_subnets.*.id,count.index)
  key_name = var.key_name

  provisioner "remote-exec" {
    type = "ssh"
    user = local.ss_user
    private_key = file(local.key_path)
    host = aws_instance.Master_node.public_ip
  }

  tags = {
    Name = "Master_node"
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

  provisioner "remote-exec" {
    type = "ssh"
    user = local.ss_user
    private_key = file(local.key_path)
    host = aws_instance.Worker_node.public_ip
  }

  tags = {
    Name = "Worker_node"
    Type = "Worker"
  }
}