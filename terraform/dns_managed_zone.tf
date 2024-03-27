resource "google_dns_managed_zone" "zone-1" {
  project  = google_project.main_project.project_id
  name     = "zone-1"
  dns_name = "nginx.fajarmaftuhfadli.com."
}

resource "google_dns_record_set" "a" {
  project = google_project.main_project.project_id
  name    = google_dns_managed_zone.zone-1.dns_name
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.zone-1.name
  rrdatas      = [google_compute_instance.instance-1.network_interface[0].access_config[0].nat_ip]
}

# resource "google_dns_record_set" "cname" {
#   project = google_project.main_project.project_id
#   name    = google_dns_managed_zone.zone-1.dns_name
#   type    = "CNAME"
#   ttl     = 300

#   managed_zone = google_dns_managed_zone.zone-1.name
#   rrdatas      = ["nginx.fajarmaftuhfadli.com."]
# }
