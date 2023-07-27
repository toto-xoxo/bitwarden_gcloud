### MACHINE ###
instance_name = "vaultwarden" # Name of the instance (automatically suffixed with the environment name)
machine_type = "e2-micro"
disk_size = 30 # Disk size in GB
network = "default"
region = "us-central1"
zone = "us-central1-a"

### GITHUB ###
github_repo_user = "toto-xoxo" # Github username where the repo is located
github_repo_name = "bitwarden_gcloud"
github_branch = "dev" # Branch to use

### TIMEZONE ###
# Local timezone - use the TZ database name from https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
timezone = "Europe/Paris" 

### PUSH NOTIFICATIONS ###
# If true, you need to configure push_installation_id-<env> and push_private_key-<env> in GCP Secret Manager
push_enabled = true 

### BACKUP ###
backup_days = 30 # Number of days to keep backups of vaultwarden data
backup_dir = "/data/backups"
backup_rclone_conf = "/data/rclone.conf"
backup_rclone_dest = "/Backup/Vaultwarden"
