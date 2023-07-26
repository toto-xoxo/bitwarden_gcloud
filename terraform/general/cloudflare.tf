provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "vaultwarden" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_zone_A_name
  value   = google_compute_instance.vaultwarden.network_interface.0.access_config.0.nat_ip
  type    = "A"
  proxied = false
  allow_overwrite = true
}
