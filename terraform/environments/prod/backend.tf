terraform {
   backend "gcs" {
    bucket = "vault-392321-tf-state"
    prefix = "${var.env}"
  } 
}