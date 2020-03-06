terraform {
    backend "s3" {
        bucket = "s3-to-store-state-99jnlk"
        key = "terraform/tfstate.tfstate"
        region = "eu-west-2"
    }
}