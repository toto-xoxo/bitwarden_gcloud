resource "google_compute_firewall" "vaultwarden-http-ingress" {
  name    = "vaultwarden-http-ingress"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http-server"]
}

resource "google_compute_firewall" "vaultwarden-https-ingress" {
  name    = "vaultwarden-https-ingress"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["https-server"]
}
