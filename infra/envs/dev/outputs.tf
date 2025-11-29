output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "app_url" {
  value = "http://${module.compute.public_dns}"
}
