variable "env" {
  description = "this is the env for dev, prod & stg"
  type = string
}

variable "instance_type" {
  description = "this is instance type"
  type = string
}

variable "instance_count" {
  description = "instance count for dev, prod & stg"
  type = number
}

variable "ami" {
  description = "ami of instance image"
  type = string
}

variable "instance_volume_size" {
  description = "this is the volume size"
  type = number
}

