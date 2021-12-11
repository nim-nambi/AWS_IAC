output "Master_node" {
  value = aws_instance.Master_node.public_ip
}

output "Worker_node" {
  value = aws_instance.Worker_node.public_ip
}