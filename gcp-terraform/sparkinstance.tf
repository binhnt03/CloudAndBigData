resource "google_compute_instance" "spark_master" {
  name         = "spark-master"
  machine_type = "e2-medium"          
  zone         = "asia-southeast1-b" 

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-arm64"
      size  = 20  # 
    }
  }

  network_interface {
    network    = google_compute_network.spark_vpc.name
    subnetwork = google_compute_subnetwork.spark_subnet.name

    network_ip = "10.0.1.10"

    access_config {}
  }

  tags = ["spark-node"]

  metadata = {
    ssh-keys = "Add public ssh key here"
  }
}
resource "google_compute_instance" "spark_worker" {
  count        = 2                
  name         = "spark-worker-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-arm64"
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.spark_vpc.name
    subnetwork = google_compute_subnetwork.spark_subnet.name

    access_config {}
  }

  tags = ["spark-node"]

  metadata = {
    ssh-keys = " Add public ssh key here"
}
}
resource "google_compute_instance" "spark_edge" {
  name         = "spark-edge"
  machine_type = "e2-medium"          
  zone         = "asia-southeast1-b" 

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-arm64"
      size  = 20  # 
    }
  }

  network_interface {
    network    = google_compute_network.spark_vpc.name
    subnetwork = google_compute_subnetwork.spark_subnet.name

    access_config {}
  }

  tags = ["spark-node"]

  metadata = {
    ssh-keys = " Add public ssh key here "
  }
}
