terraform {
  backend "s3" {
    bucket = "cloud-devops-terraform-state-108865094397"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}
