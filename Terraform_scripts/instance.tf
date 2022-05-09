resource "aws_instance" "Master_node" {
  count = 1
  ami = var.server_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.Cluster_sg.id]
  subnet_id = element(aws_subnet.Cluster_subnets.*.id,count.index)
  key_name = var.key_name

  tags = {
    Name = "Master_node"
    Type = "Master"
  }
}

resource "aws_instance" "Worker_node" {
  count = 2
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

##resource "null_resource" "run_playbook"{
##  provisioner "local-exec" {
##    command = "ansible-playbook ../Ansible/setup.yml"
##  }
##}