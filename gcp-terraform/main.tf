terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "fine-branch-478814-e2"
  region  = "asia-southeast1"
  zone    = "asia-southeats1-b"
}



