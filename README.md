# Bitwarden self-hosted on Google Cloud for Free
[Forked from here](https://github.com/dadatuputi/bitwarden_gcloud) 

---
## *Modified few things to make it work for me :*
- push notifications
- terraform implementation

and small things here and there.

Navigate to Cloud Build, enable Cloud Build API
Navigate to settings, note your Service account email
Create your project folder structure
.
├── cloudbuild.yaml
└── terraform
    └── environments
        └── master
            └── main.tf

Go to IAM > IAM and grant Editor role to your Service account

