Terraform Managed AWS ENV
##### Objective to create a terraform managed env with the following resources

++ VPC

++ subnet

++ IG

++ Security group

++ EIP

++ IAM users and policies

++ assigns values based on environment

++ Stores state in s3 along with version

++ create SNS 


in-progress 


++ create cloud trail ?? (api availalbe?)

++ create lambda function

++ attach policies for lambda function


GRAPH
##### Pre-req: brew install graphviz to generate graph. 
##### tf command: terraform graph

TIPS
##### use terraform apply --auto-approve to skip approve step
##### always terraform init to install a new module 
##### keep the folder structure clean with separate modules for group of resources
##### keep secrets in .tfvars and include in .gitignore