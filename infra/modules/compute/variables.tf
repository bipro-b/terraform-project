variable "project_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "app_port" {
  type = number
}

variable "ecr_repo_url" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "key_name" {
  type    = string
  default = null  # optional SSH key
}
