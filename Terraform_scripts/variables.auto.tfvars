variable "aws_region" {
    type        = string
    default     = "ap-south-1"

}

variable "key_name" {
    default     = "key-name"
    description = "name of key ssh into EC2 instances"
}

variable "key_path" {
    default     = "path/"
    description = "pem file location"
}

variable "vpc_cidr" {
    type        = string
    default     = "172.0.0.0/24"
}

variable "subnet_cidr" {
    type        = list(string)
    default     = ["172.0.0.0/25", "172.0.0.128/25"]
}

variable "server_ami" {
    type        = string
    default     = "..."
}

variable "instance_type" {
    default     = "what ever is the biggest and free"
    type        = string
}