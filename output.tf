output "ip_zone1" {
  value = google_compute_instance.meson_instance1[*].network_interface.0.access_config.0.nat_ip
}

output "ip_zone2" {
  value = google_compute_instance.meson_instance2[*].network_interface.0.access_config.0.nat_ip
}

output "ip_zone3" {
  value = google_compute_instance.meson_instance3[*].network_interface.0.access_config.0.nat_ip
}
