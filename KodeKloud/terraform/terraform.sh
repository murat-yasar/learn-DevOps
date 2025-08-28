terraform init       # Initialize Terraform working directory and download required providers/modules
terraform plan       # Create an execution plan showing what changes Terraform will make
terraform apply      # Apply the changes required to reach the desired infrastructure state
terraform destroy    # Delete all infrastructure resources that are managed by the Terraform configuration

terraform show       # Inspect the current state or saved plan file
terraform output     # Output the terraform variables

terraform validate   # Show the line in the file that is causing the error with the hints to fix it
terraform fmt        # Prints out the current state of the infrastructure as seen by terraform
terraform providers  # List the providers

terraform refresh    # Sync Terraform with the real world infrastructure
terraform graph      # command is used to create a visual representation of the dependencies in a terraform configuration or an execution plan
