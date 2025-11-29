variable "project_name"   { type = string }
variable "region"         { type = string }
variable "instance_type"  { type = string }
variable "app_port"       { type = number }
variable "allowed_ssh_cidr" { type = string }
variable "image_tag"      { type = string }
variable "key_name" {
  type    = string
  default = null
}
