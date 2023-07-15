terraform {
  cloud {
    organization = "mtc-terraform-lelis685"

    workspaces {
      name = "mtcv-dev"
    }
  }
}