terraform {
  backend "s3" {
    bucket = "prod-terraform-state-bucket-example"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}