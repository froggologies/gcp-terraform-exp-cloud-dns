resource "google_compute_firewall" "default-allow-icmp" {
  network = google_compute_network.default.name
  project = google_project.main_project.project_id

  description = "Allows ICMP connections from any source to any instance on the network."

  name          = "default-allow-icmp"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "default-allow-rdp" {
  network = google_compute_network.default.name
  project = google_project.main_project.project_id

  description = "Allows RDP connections from any source to any instance on the network using port 3389."

  name          = "default-allow-rdp"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}

resource "google_compute_firewall" "default-allow-ssh" {
  network = google_compute_network.default.name
  project = google_project.main_project.project_id

  description = "Allows TCP connections from any source to any instance on the network using port 22."

  name          = "default-allow-ssh"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "default-allow-custom" {
  network = google_compute_network.default.name
  project = google_project.main_project.project_id

  description = "Allows TCP connections from any source to any instance on the network using port 22."

  name          = "default-allow-custom"
  priority      = 65534
  source_ranges = ["10.128.0.0/9"]

  allow {
    protocol = "all"
  }
}
