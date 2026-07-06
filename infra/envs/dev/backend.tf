terraform {
  backend "s3" {
    bucket = "dev-terraform-state-bucket-example"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}