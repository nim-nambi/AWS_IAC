output "Master_node" {
  value = aws_instance.Master_node[0].public_ip
}

output "Worker_node" {
  value = aws_instance.Worker_node[0].public_ip
}