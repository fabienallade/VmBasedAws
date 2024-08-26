variable "image_name" {
  type        = string
  description = "Image name"
}

variable "image_version" {
  type        = string
  description = "Image version"
}
variable "agent_ipaddress" {
  type        = string
  description = "Ip Address of agent"
}
variable "aws_primary_region" {
  type        = string
  description = "Aws EC2 Primary Region"
}
variable "aws_instance_type" {
  type        = string
  description = "Aws Instance type"
}