terraform {
  backend "s3" {
    bucket         = "my-tf-state-bipro-us-west-2" # same bucket
    key            = "prod/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
