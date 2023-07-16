variable "project_id" {
    type = string
    description = "GCP Project ID"
}

variable "region" {
    type = string
    description = "GCP Region"
}

variable "zone" {
    type = string
    description = "GCP Zone"
}

variable "instance_name" {
    type = string
    description = "Name of the instance"
}

variable "machine_type" {
    type = string
    description = "Machine type of the instance"
}

variable "disk_size" {
    type = string
    description = "Disk size of the instance"
}

variable "network" {
    type = string
    description = "Network of the instance"
}

variable "github_repo" {
    type = string
    description = "Github repo to use"
}

variable "github_branch" {
    type = string
    description = "Github branch to use"
}

variable "domain" {
    type = string
    description = "Domain to use"
}

variable "timezone" {
    type = string
    description = "Timezone to use"
}

variable "push_enabled" {
    type = bool
    description = "Push enabled"
}

variable "push_installation_id" {
    type = string
    description = "Push installation id"
}

variable "push_installation_key" {
    type = string
    description = "Push installation key"
}

variable "email" {
    type = string
    description = "Email to use for caddy (SSL cert)"
}

variable "backup_dir" {
    type = string
    description = "Backup directory"
}

variable "backup_rclone_conf" {
    type = string
    description = "Backup rclone config"
}

variable "backup_rclone_dest" {
    type = string
    description = "Backup rclone destination"
} 
