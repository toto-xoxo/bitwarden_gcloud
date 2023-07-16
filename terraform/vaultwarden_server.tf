resource "google_compute_instance" "vaultwarden" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  metadata = {
    "user-data" = <<-EOF
      #cloud-config
      write_files:
        - path: ${var.home_dir}/.env
          content: |
            ### VAULTWARDEN ###

            DOMAIN= "${var.domain}"
            TZ= "${var.timezone}"
            ADMIN_TOKEN= "${var.admin_token}"
            PUSH_ENABLED= ${var.push_enabled}
            PUSH_INSTALLATION_ID= "${var.push_installation_id}}"
            PUSH_INSTALLATION_KEY= "${var.push_installation_key}}"

            ### BACKUP ###

            BACKUP_SCHEDULE=0 0 * * *
            BACKUP_DAYS=30
            BACKUP_DIR=${var.backup_dir}
            BACKUP=rclone
            BACKUP_RCLONE_CONF=${var.backup_rclone_conf}
            BACKUP_RCLONE_DEST=${var.backup_rclone_dest}

            ### CADDY ###

            EMAIL= "${var.email}"

            ### COUNTRYBLOCK ###

            COUNTRIES=CN HK AU
            COUNTRYBLOCK_SCHEDULE=0 0 * * *

            ### WATCHTOWER ###

            WATCHTOWER_SCHEDULE=0 0 3 ? * 0

      runcmd:
        - curl -sSfL "https://raw.githubusercontent.com/${var.github_repo}/bitwarden_gcloud/${var.script_url}/utilities/install-alias.sh" | bash
        - docker-compose up -d
      EOF
    "startup-script-url" = "https://github.com/${var.github_repo}/bitwarden_gcloud/blob/${var.script_url}/utilities/reboot-on-update.sh"
  }

  boot_disk {
    initialize_params {
      size = var.disk_size
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = var.network
    access_config {
        // Ephemeral IP
    }
  }

  tags = ["http-server", "https-server"]

  service_account {
    scopes = ["compute-rw"]
  }
}
