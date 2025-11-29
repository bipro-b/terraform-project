terraform {
  backend "s3" {
    bucket         = "my-tf-state-bipro-us-west-2" # change
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
