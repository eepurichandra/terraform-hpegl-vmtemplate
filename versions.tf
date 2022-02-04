terraform {
  required_version = ">= 0.13"
  required_providers {
    hpegl = {
      source  = "hewlettpackard/hpegl"
      version = "0.1.0-beta5"
    }
  }
}