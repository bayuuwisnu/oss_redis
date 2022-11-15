resource "google_compute_firewall" "firewall" {
  name    = "oss-firewall-externalssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}

resource "google_compute_firewall" "webserverrule" {
  name    = "oss-webserver"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver"]
}

resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = "devops-labs-366504"
  region = "asia-southeast2"
  depends_on = [ google_compute_firewall.firewall ]
}

resource "google_compute_instance" "vm-oss-dev" {
  name = "vm-oss-dev"
  zone = "asia-southeast2-a"
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = 35
      
    }
    auto_delete = false
  }

   
  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  labels = {
    "env" = "tfleaning"
  }
  
  scheduling {
    preemptible = false
    automatic_restart = false
  }
  
  service_account {
    email = "admin-devops@devops-labs-366504.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 30
  zone = "asia-southeast2-a"
  type = "pd-ssd"
}