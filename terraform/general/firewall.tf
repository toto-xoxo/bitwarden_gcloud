resource "google_compute_firewall" "vaultwarden-http-ingress" {
  name    = "http-ingress"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}

resource "google_compute_firewall" "vaultwarden-https-ingress" {
  name    = "https-ingress"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["https-server"]
}
