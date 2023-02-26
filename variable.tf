variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "my-cluster"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-123456", "subnet-789012"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-1234567890"
}
