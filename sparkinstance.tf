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
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC69zRrIiBg4krQbBusRQ6NwzFzQ1+BlL3LkN5tMor0Om/Y7BMKfBg2hc8GdHwrOtZVL/+82EkeZgVF9JHt78vOlHYJOFWwEVjvq6TcJaIoukDjZfQR99ndwyi91naCC0UBKDfbcGsQRjiBKz5t0r+jExwg9QHCpKZkm/ykZnYW7CelxSxst1RUoFdbAdr6Dun5d9iLMRneEOYtaeVL/kLUV2zUgfzsvxAMTdHcHEyWiOrnf9wWRKC2y/tiZhc4G5v2HI0ODatmiC9PM71dFC6+N0kZqO6ekwdqDUh/YGQ+YliNwPsx3XJdPgRD1G0npNkHiU8ZmuvGMBDMJhVWB5wr btn150103@gmail.com"
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
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC69zRrIiBg4krQbBusRQ6NwzFzQ1+BlL3LkN5tMor0Om/Y7BMKfBg2hc8GdHwrOtZVL/+82EkeZgVF9JHt78vOlHYJOFWwEVjvq6TcJaIoukDjZfQR99ndwyi91naCC0UBKDfbcGsQRjiBKz5t0r+jExwg9QHCpKZkm/ykZnYW7CelxSxst1RUoFdbAdr6Dun5d9iLMRneEOYtaeVL/kLUV2zUgfzsvxAMTdHcHEyWiOrnf9wWRKC2y/tiZhc4G5v2HI0ODatmiC9PM71dFC6+N0kZqO6ekwdqDUh/YGQ+YliNwPsx3XJdPgRD1G0npNkHiU8ZmuvGMBDMJhVWB5wr btn150103@gmail.com"
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
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC69zRrIiBg4krQbBusRQ6NwzFzQ1+BlL3LkN5tMor0Om/Y7BMKfBg2hc8GdHwrOtZVL/+82EkeZgVF9JHt78vOlHYJOFWwEVjvq6TcJaIoukDjZfQR99ndwyi91naCC0UBKDfbcGsQRjiBKz5t0r+jExwg9QHCpKZkm/ykZnYW7CelxSxst1RUoFdbAdr6Dun5d9iLMRneEOYtaeVL/kLUV2zUgfzsvxAMTdHcHEyWiOrnf9wWRKC2y/tiZhc4G5v2HI0ODatmiC9PM71dFC6+N0kZqO6ekwdqDUh/YGQ+YliNwPsx3XJdPgRD1G0npNkHiU8ZmuvGMBDMJhVWB5wr btn150103@gmail.com"
  }
}
