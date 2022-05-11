# .DESCRIPTION

This terraform code will deploy a three - tier architecture setup using web, application and database layer at AWS Cloud. The resources that will be created include -

- EC2 Instance
- AWS RDS DB Instance
- Apache Web Server
- AWS VPC
- AWS Public and Private Subnet
- AWS Security Groups
- AWS Application Load Balancer


#. STEPS TO PRODUCE

- Install terraform cli on windows device
- Update AWS Access Key and Secret Key in terraform.tfvars
- Run 'terraform init' command to initialize a working directory and providers plugin
- Run 'terraform plan' command to create an execution plan of infrastructure that will be provisioned at AWS
- Run 'terraform apply' command to apply the changes and provision infrastructure at AWS
- Run 'terraform destroy' command to delete the infrastructure at AWS created through terraform apply
