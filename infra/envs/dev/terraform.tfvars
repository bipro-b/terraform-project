project_name     = "node-api-dev"
region           = "us-west-2"
instance_type    = "t2.medium"
app_port         = 3000
allowed_ssh_cidr = "0.0.0.0/0" # tighten in real prod
image_tag        = "dev-latest"
key_name         = "mega"        # or "your-existing-keypair-name"
