output "spark_master_public_ip" {
  description = "Public IP của máy Master"
  value       = google_compute_instance.spark_master.network_interface.0.access_config.0.nat_ip
}

output "spark_worker_public_ips" {
  description = "Danh sách Public IP của các Worker"
  value       = google_compute_instance.spark_worker[*].network_interface.0.access_config.0.nat_ip
}

output "spark_edge_public_ip" {
  description = "Public IP của máy Edge"
  value       = google_compute_instance.spark_edge.network_interface.0.access_config.0.nat_ip
}
