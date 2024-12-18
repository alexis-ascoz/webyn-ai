# Webyn-ai

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Setup

### Login & setup to Google Cloud

> [!NOTE]
> If you don't have a google cloud account, you can create one [here](https://cloud.google.com/). You will need to provide a credit card, but you will get $300 free credit for few months.

login to gcloud, select an account and a project (create one if needed)

```bash
gcloud init
```

Enable `Compute Engine API` to be able to create virtual machines.

> [!WARNING]
> This step is required to setup the billing information for the project. Make sure to have a valid billing account.

```bash
gcloud services enable compute.googleapis.com
```

Enable `Kubernetes Engine API` to be able to create a kubernetes cluster.

```bash
gcloud services enable container.googleapis.com
```

### Login to terraform

> [!NOTE]
> This is required to use terraform cloud to store the state of the infrastructure. You will need to create an account [here](https://app.terraform.io/signup/account) and create a new organization.

```bash
terraform login
```

### Clone the repository

```bash
git clone git@github.com:alexis-ascoz/webyn-ai.git
```

### Update the variables

Move to the terraform directory

```bash
cd webyn-ai/terraform
```

Copy the `terraform.tfvars.example` file to `terraform.tfvars` and update the variables with your own values.

```bash
cp terraform.tfvars.example terraform.tfvars
```

- `project_id` : The google cloud project id. You can find it by running `gcloud projects list`.
- `region` : The region where the infrastructure will be created. You can find the available regions [here](https://cloud.google.com/compute/docs/regions-zones). For Paris, the region is `europe-west1`.

## Deploy the application

### Create the infrastructure & deploy the application

Install the required terraform providers

```bash
terraform init
```

Create the infrastructure & deploy the application

```bash
terraform apply
```

### Access the application

Get the external ip of the service

```bash
terraform output -raw application_endpoint
```

Open the browser and go to `http://<EXTERNAL_IP>:3000`.

## Destroy the infrastructure

```bash
terraform destroy
```

## [Optional] Configure kubectl

Get the credentials of the kubernetes cluster

> [!NOTE]
> Is it possible to have the following error: `You cannot perform this action because the Google Cloud CLI component manager is disabled for this installation.`. To fix it, you can run `gcloud components install gke-gcloud-auth-plugin`.

```bash
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)-b
```
