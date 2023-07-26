terraform {
   backend "gcs" {
    bucket = "vault-392321-tf-state"  # Replace with your bucket name
    prefix = "dev"  # Replace with your environment name
  } 
}

module "general" {
source = "../../general"

project_id = var.project_id
region = var.region
zone = var.zone
env = var.env
instance_name = var.instance_name
machine_type = var.machine_type
disk_size = var.disk_size
network = var.network
github_repo_user = var.github_repo_user
github_repo_name = var.github_repo_name
github_branch = var.github_branch
home_dir = var.home_dir
home_user = var.home_user
domain = var.domain
admin_token = var.admin_token
timezone = var.timezone
push_enabled = var.push_enabled
push_installation_id = var.push_installation_id
push_installation_key = var.push_installation_key
email = var.email
backup_days = var.backup_days
backup_dir = var.backup_dir
backup_rclone_conf = var.backup_rclone_conf
backup_rclone_dest = var.backup_rclone_dest
cloudflare_api_token = var.cloudflare_api_token
cloudflare_zone_id = var.cloudflare_zone_id
cloudflare_zone_A_name = var.cloudflare_zone_A_name
}
