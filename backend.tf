terraform {

  backend "s3" {

    bucket = "terraform-state-company"

    key = "network/terraform.tfstate"

    region  = "us-west-2"

    dynamodb_table = "terraform-lock-table"
  }
}
