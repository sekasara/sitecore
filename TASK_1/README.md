## Terraform Execution:

### Checkout git repository
`git clone https://github.com/sekasara/sitecore.git`

### Change Directory to Terraform Module
`cd sitecore/TASK_1/terraform`

### Initialize Terraform Repository
`terraform init`

### Plan Terraform Resources
`terraform plan`

### Apply Terraform Resource
`terraform apply` (It asks for approval) /
`terraform apply --auto-approve`

### Destroy Terraform Resource
`terraform destroy` (It asks for approval) /
`terraform destroy --auto-approve`

### Note: 
Before doing Terraform executions, Please authenticate azure subscription using Azure CLI. (`az login`)



## Script Execution:

### fetch_azure_monitoring_metrics.sh
It reads the below metrics from Azure Monitoring using Azure CLI and stored it in file.
- Percentage CPU
- Network In Total
- Network Out Total
Note: Execute the script where terraform get executed

### fetch_system_metrics.sh
It will print available, total and used disk storage  
#### Note: 
Execute the script inside the virtual machine
