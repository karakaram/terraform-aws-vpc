.PHONY: help init plan apply destroy get
.DEFAULT_GOAL := help

env = production
option := -var-file=$(env).tfvars

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize a Terraform configuration
	rm -f .terraform/terraform.tfstate
	terraform init \
		-backend-config='backend.tfvars'
	-terraform workspace new production
	-terraform workspace new development

plan: get ## Generate and show an execution plan
	terraform workspace select $(env)
	terraform plan $(option)

apply: get ## Builds or changes infrastructure
	terraform workspace select $(env)
	terraform apply $(option) -auto-approve

destroy: get ## Destroy Terraform-managed infrastructure
	terraform workspace select $(env)
	terraform destroy $(option)

get: ## Download and install modules for the configuration
	terraform get
