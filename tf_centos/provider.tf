terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.85.0"
    }
  }
}

provider "google" {
  project = "devops-labs-366504"
  region = "asia-southeast2"
  zone = "asia-southeast2-a"
  credentials = "keys.json"
}