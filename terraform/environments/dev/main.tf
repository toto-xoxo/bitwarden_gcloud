module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.2"

  project_id = var.project_id

  activate_apis = ["compute.googleapis.com", "iam.googleapis.com", "storage.googleapis.com", "cloudresourcemanager.googleapis.com", "cloudbilling.googleapis.com", "serviceusage.googleapis.com"]

  disable_dependent_services = false
  disable_services_on_destroy	= false
}

resource "google_compute_instance" "vaultwarden" {
  name         = "${var.instance_name}-${var.env}"
  machine_type = var.machine_type
  zone         = var.zone
  depends_on = [ module.project-services ]

  metadata = {
    "user-data" = <<-EOF
      #cloud-config
      
      write_files:
        - path: ${var.home_dir}/.env
          owner: ${var.home_user}:${var.home_user}
          content: |
            ### VAULTWARDEN ###

            DOMAIN= "${var.domain}"
            TZ= "${var.timezone}"
            ADMIN_TOKEN= "${var.admin_token}"
            PUSH_ENABLED= ${var.push_enabled}
            PUSH_INSTALLATION_ID= "${var.push_installation_id}"
            PUSH_INSTALLATION_KEY= "${var.push_installation_key}"

            ### BACKUP ###

            BACKUP_SCHEDULE=0 0 * * *
            BACKUP_DAYS=${var.backup_days}
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
        - cd ${var.home_dir}
        - su -c 'curl -sSfL "https://raw.githubusercontent.com/${var.github_repo_user}/${var.github_repo_name}/${var.github_branch}/utilities/install-alias.sh" | bash' - ${var.home_user}
        - su -c 'git clone --branch ${var.env} https://github.com/${var.github_repo_user}/${var.github_repo_name}.git' - ${var.home_user}
        - mv ${var.home.dir}/.env ${var.github_repo_name}/.env
        - cd ${var.github_repo_name}
        - su -c 'source ~/.bashrc; docker-compose up -d' - ${var.home_user}
      EOF
    "startup-script-url" = "https://raw.githubusercontent.com/${var.github_repo_user}/${var.github_repo_name}/${var.github_branch}/utilities/reboot-on-update.sh"
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
