terraform {
  backend "s3" {
    bucket = "manchester-terraform-2026-state"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}
