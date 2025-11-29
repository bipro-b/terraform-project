project_name     = "node-api-prod"
region           = "us-west-2"
instance_type    = "t2.medium"      # or m5.large etc
app_port         = 3000
allowed_ssh_cidr = "0.0.0.0/0"      # in real prod, restrict or VPN
image_tag        = "prod-latest"
key_name         = null
