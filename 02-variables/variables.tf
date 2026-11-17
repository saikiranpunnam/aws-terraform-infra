variable "ami_id" {
    type = string
    default = "ami-096ef200a877f36af"
    description = "Ami id of an instance"
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "instance type of an instance"
  
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "dev"
        Environment = "true"
        Project = "roboshop"
        Component = "mongodb"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
  
}