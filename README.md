# Basic Ubuntu Server Vultr VPS With Terraform
---

## Summary
---

This is a baseplate for deploying a basic Ubuntu Server to Vultr using the
Vultr Terraform provider. I use this mostly used for minimal deployments that I 
use for basic labs or small networking services.

This is a deployment of Ubuntu server that will setup a Vultr VC2 instance with 
1 CPU and 2 GB of RAM. I turn off backups and DDOS protection to save money on
the deployment.

## Dependences
---

Vultr API key will be needed to use this. This can be accomplished by generating
an API key from the Vultr console.

## Setup
---

To set this up there are a few things that will need to be changed in the
main.tf file.

API key generated from the console needs to be added to the provider section of 
the file.

```terraform
# Configure the Vultr Provider
provider "vultr" {
  api_key = "VULTR_API_KEY"
  rate_limit = 100
  retry_limit = 3
}
```

Update the resources section to specify the Ubuntu servers name in
UBUNTU-SERVER-NAME.

```terraform
resource "vultr_instance" "UBUNTU-SERVER-NAME" {
```

The label and the hostname can be updated to make the system name and the Vultr
label more suited towards what's needed. The label will be the instances anme in
the Vultr console and the hostname will be shown in the console of the VPS after
logging in.

```terraform
    label = "INSTANCE_LABEL_CHANGEME"
    hostname = "INSTANCE_HOSTNAME_CHANGEME"
```

I provide those for general customization. But all of it can be modified given
that the syntax is correct. Feel free to change it to suit your needs. The
[vultr/vultr provider](https://registry.terraform.io/providers/vultr/vultr/latest/docs) 
is well documented.


## Deployment
---

Clone the repository, change directories to it, and make changes to the main.tf
file.

Initialize the directory.

```sh
terraform init
```

Create the infrastructure.

```sh
terraform apply
```

To see informaiton about the deployment. The show command is a good check.

```sh
terraform show
```
