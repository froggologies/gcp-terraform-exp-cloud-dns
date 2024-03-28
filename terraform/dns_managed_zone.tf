resource "google_dns_managed_zone" "private-zone" {
  project     = google_project.main_project.project_id
  name        = "private-zone"
  dns_name    = "private.example.com."
  description = "Example private DNS zone"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.default.id
    }
  }
}

resource "google_dns_record_set" "private-zone-instance-1" {
  project = google_project.main_project.project_id
  name    = google_dns_managed_zone.private-zone.dns_name
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.private-zone.name
  rrdatas      = [google_compute_instance.instance-1.network_interface[0].network_ip]
}
