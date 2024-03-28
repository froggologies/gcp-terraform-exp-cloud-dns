# Google Cloud Private DNS

Private Cloud DNS in Google Cloud Platform (GCP) enables the management of DNS zones and records for private network resources. It facilitates the organization and accessibility of internal assets within a secure network environment, without exposing them to the public internet. This functionality ensures streamlined communication among virtual machine instances, Kubernetes clusters, and other resources using domain names within the confines of the private network.

## Requirements:
Google Cloud Platform:
- folder ID
- billing ID
- Service Account Key

Local machine:
- gcloud CLI
- git CLI
- terraform CLI

## Clone this repo

```sh
git clone https://github.com/froggologies/gcp-terraform-exp-cloud-dns.git && cd gcp-terraform-exp-cloud-dns
```

## Set environment variables:

```sh
export GOOGLE_APPLICATION_CREDENTIALS=<PATH_TO_SERVICE_ACCOUNT_KEY>
export TF_VAR_billing_account=<BILLING_ACCOUNT_ID>
export TF_VAR_folder_id=<FOLDER_ID>
```

## Provision resources

Main resources that are created for this project are:

- instance-1: GCE instance for nginx server
- instance-2: GCE instance for testing the private dns
- private-zone (private.example.com): Private Cloud DNS


> Change the backend in `terraform/backend.tf` to your backend configuration or delete it if you want to use local backend.

Initialize Terraform:
```sh
terraform -chdir=terraform init
```

Apply Terraform:
```sh
terraform -chdir=terraform apply -auto-approve
```

## Testing
