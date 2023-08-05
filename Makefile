.PHONY: all
all: terraform ansible

.PHONY: terraform
terraform:
	@cd terraform \
	&& terraform init \
	&& terraform validate \
	&& terraform plan -out=tfplan \
	&& terraform apply tfplan

.PHONY: ansible
ansible:
	@cd ansible \
	&& ansible-playbook -i hosts main.yaml
	
