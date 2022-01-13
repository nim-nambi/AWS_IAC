variable "aws_region" {
    type        = string
    default     = "ap-south-1"
}

variable "aws_availability_zone" {
    type = string
    default = "ap-south-1a"
}

variable "key_name" {
    default     = "devops"
    description = "name of key ssh into EC2 instances"
}

variable "key_path" {
    default     = "../devops.pem"
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
    default     = "ami-08ee6644906ff4d6c"
}

variable "instance_type" {
    default     = "t2.micro"
    type        = string
}