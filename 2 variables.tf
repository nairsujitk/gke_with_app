variable "cluster_name" {
  default             = "skn-demo-gke"
}

variable "region" {
  default             = "us-west1"
}

variable "region_zone" {
  default             = "us-west1-a"
}

variable "project_name" {
  description         = "ID of the GCP project"
  default             = "for-prags"
}

variable "cred_file_name" {
  description         = "Path to credentials local file location"
  default             = "test-project-creds.json"
}

variable "password" {
  description         = "Password for GKE cluster & PCCE Console"
  default             = "Sknpcceadmin@123"
}

variable "username" {
  description         = "Username for GKE cluster & PCCE Console"
  default             = "sknadmin"
}


