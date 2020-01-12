resource "google_container_cluster" "gke-cluster" {
  name                        = var.cluster_name
  location                    = var.region_zone

  remove_default_node_pool    = true 
  initial_node_count          = 1


  network                     = google_compute_network.gkelan.name
  subnetwork                  = google_compute_subnetwork.gkelan-net.name

  master_auth {
    username                  = var.username
    password                  = var.password
  }

}


resource "google_container_node_pool" "voting-app-pool" {

  name                        = "voting-app-pool"
  project                     = var.project_name
  location                    = var.region_zone
  cluster                     = google_container_cluster.gke-cluster.name

  initial_node_count = "1"

  autoscaling {
    min_node_count            = "2"
    max_node_count            = "5"
  }

  management {
    auto_repair               = "true"
    auto_upgrade              = "true"
  }

  node_config {
    image_type                = "Ubuntu"
    machine_type              = "n1-standard-4"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  lifecycle {
    ignore_changes            = [initial_node_count]
  }

  timeouts {
    create                    = "20m"
    update                    = "20m"
    delete                    = "20m"
  }
}
