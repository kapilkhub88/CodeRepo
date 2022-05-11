# ---------------------------------------------
#           Required Variables
# ---------------------------------------------

variable "region" {
  type        = string
  description = "(required)AWS region"
  default     = null
}

variable "alb_name" {
  type        = string
  description = "(required)Name of the ALB"
  default     = null
}

variable "targetgroup_name" {
  type        = string
  description = "(required)ALB Target group name"
  default     = null
}

variable "allocated_storage" {
  type        = string
  description = "(required)Storage size"
  default     = null
}

variable "engine" {
  type        = string
  description = "(required)RDS Engine"
  default     = null
}

variable "engine_version" {
  type        = string
  description = "(required)RDS Engine version"
  default     = null
}

variable "instance_class" {
  type        = string
  description = "(required)RDS instance class"
  default     = null
}

variable "db_name" {
  type        = string
  description = "(required)RDS db name"
  default     = null
}

variable "username" {
  type        = string
  description = "(required)Username to login DB"
  default     = null
}

variable "password" {
  type        = string
  description = "(required)Password to login DB"
  default     = null
}

variable "db_subnet_group_name" {
  type        = string
  description = "(required)Name of DB subnet group"
  default     = null
}

variable "cidr_vpc" {
  type        = string
  description = "(required)VPC cidr block"
  default     = null
}

variable "cidr_web_subnet_1" {
  type        = string
  description = "(required)Web 1 subnet cidr block"
  default     = null
}

variable "cidr_web_subnet_2" {
  type        = string
  description = "(required)Web 2 subnet cidr block"
  default     = null
}

variable "cidr_application_subnet_1" {
  type        = string
  description = "(required)App 1 subnet cidr block"
  default     = null
}

variable "cidr_application_subnet_2" {
  type        = string
  description = "(required)App 2 subnet cidr block"
  default     = null
}

variable "cidr_database_subnet_1" {
  type        = string
  description = "(required)DB 1 subnet cidr block"
  default     = null
}

variable "cidr_database_subnet_2" {
  type        = string
  description = "(required)DB 2 subnet cidr block"
  default     = null
}

variable "availability_zone_1" {
  type        = string
  description = "(required)Availability zone 1"
  default     = null
}

variable "availability_zone_2" {
  type        = string
  description = "(required)Availability zone 2"
  default     = null
}

variable "web_security_group_name" {
  type        = string
  description = "(required)web security group name"
  default     = null
}

variable "server_security_group_name" {
  type        = string
  description = "(required)web server security group name"
  default     = null
}

variable "db_security_group_name" {
  type        = string
  description = "(required)DB security group name"
  default     = null
}

variable "ami" {
  type        = string
  description = "(required)AMI id of webserver"
  default     = null
}

variable "instance_type" {
  type        = string
  description = "(required)Instance type of webserver"
  default     = null
}

variable "access_key" {
  type        = string
  description = "(required)AWS access key"
  default     = null
}

variable "secret_key" {
  type        = string
  description = "(required)AWS secret key"
  default     = null
}
