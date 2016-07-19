variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "pre_tag" {}
variable "post_tag" {}

variable "aws_region" {
  description = "EC2 Region for the VPC"
}

variable "amis" {
  description = "Centos AMIs by region"
  default = {
    ap-southeast-1 = "ami-f068a193"
    ap-northeast-1 = "ami-eec1c380"
  }
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}

output "aws_nat_gateway_id" {
  value = "${aws_nat_gateway.nat.id}"
}

output "public_security_group_id" {
  value = "${aws_security_group.public.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.availability-zone-public.id}"
}

output "vpc_id" {
  value = "${aws_vpc.default.id}"
}