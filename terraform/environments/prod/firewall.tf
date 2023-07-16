resource "google_compute_firewall" "vaultwarden-http-ingress" {
  name    = "vaultwarden-http-ingress-${var.env}"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}

resource "google_compute_firewall" "vaultwarden-https-ingress" {
  name    = "vaultwarden-https-ingress-${var.env}"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["https-server"]
}
