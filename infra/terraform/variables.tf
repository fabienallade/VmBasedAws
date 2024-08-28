variable "primary_region" {
  type        = string
  description = "Aws primary region"
}
variable "application_name" {
  type        = string
  description = "Application name"
}
variable "environment_name" {
  type        = string
  description = "Environment name"
}
variable "frontend_image_name" {
  type        = string
  description = "Frontend Image name"
}
variable "backend_image_name" {
  type        = string
  description = "Backend Image Name"
}
variable "backend_instance_type" {
  type        = string
  description = "Backend Instance Type"
}
variable "domain_name" {
  type        = string
  description = "Domain name"
}
variable "frontend_instance_type" {
  type        = string
  description = "Frontend Instance Type"
}
variable "ssh_public_key" {
  type        = string
  description = "Ssh public key"
}
variable "vpc_cidr_block" {
  type        = string
  description = "Base routing vpc"
}
variable "cidr_split_bits" {
  type    = number
  default = 8
}
variable "az_count" {
  type        = number
  description = "Available in n number of zone"
}