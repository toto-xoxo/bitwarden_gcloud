# Bitwarden self-hosted on Google Cloud for Free
[Forked from here](https://github.com/dadatuputi/bitwarden_gcloud) 

---
## *Changes*
- push notifications
- terraform implementation

**Please be aware i've adapted this to my own needs, so it might not work for you out of the box.**

## How to use Terraform

On GCP, you need to create in Secret Manager theses variables suffixed with your environment name (dev, prod, etc...).

Example if you have a "dev" env and a "prod" env. You need to create the following secrets:

- admin_token-dev
- admin_token-prod
- domain-dev
- domain-prod
- email
- home_dir-dev
- home_dir-prod
- home_user-dev
- home_user-prod
- push_installation_id-dev
- push_installation_id-prod
- push_installation_key-dev
- push_installation_key-prod

You can obtain push_installation_id and push_installation_key by going [here](https://bitwarden.com/host/)

If you manage your domain on cloudflare, you can also create cloudflare_api_token-env and cloudflare_zone_id-env secrets to automatically create the DNS record (you can edit "name" in `cloudflare.tf` to specify your desired A name). If you dont want to use cloudflare, you can remove the `cloudflare.tf` file and delete cloudflare provider in `provider.tf` to avoid errors.

Then, you need to create a GCP service account and download the json key. You need to put this key in terraform/general folder as `account.json`. Verify that the service account can perform required actions on GCP (compute admin, storage admin,...).

Adapt the `terraform.tfvars` file to your needs.