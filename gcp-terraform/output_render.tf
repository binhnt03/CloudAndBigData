resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/ansible_inventory.tpl", {
    master_ip        = google_compute_instance.spark_master.network_interface[0].access_config[0].nat_ip
    worker_ips       = google_compute_instance.spark_worker[*].network_interface.0.access_config.0.nat_ip
    edge_ip          = google_compute_instance.spark_edge.network_interface[0].access_config[0].nat_ip
  })

  filename = "${path.module}/../gcp-ansible/nodes.ini"
}

