terraform {
  backend "gcs" {
    bucket = "terraform-testt"  # GCS bucket name
    prefix = "terraform/state"              # Path within the bucket (e.g., a folder structure)
  }
}