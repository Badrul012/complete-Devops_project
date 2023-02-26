variable "vpc_id" {
  description = "ID of the VPC to deploy the Jenkins instance in."
}

variable "subnet_id" {
  description = "ID of the subnet to deploy the Jenkins instance in."
}

variable "jenkins_ami" {
  description = "ID of the AMI for the Jenkins instance."
}

variable "jenkins_instance_type" {
  description = "Instance type for the Jenkins instance."
}

variable "key_name" {
  description = "Name of the EC2 key pair to use for the Jenkins instance."
}

variable "region" {
  description = "AWS region to deploy the resources in."
}

variable "profile" {
  description = "AWS profile to use for authentication."
}
