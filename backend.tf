terraform {
  backend "gcs" {
    bucket = "jenkins-iac"  # GCS bucket name
    prefix = "terraform/state"              # Path within the bucket (e.g., a folder structure)
  }
}