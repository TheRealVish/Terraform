Terraform Managed AWS ENV
##### Objective to create a terraform managed env with the following resources

++ VPC

++ subnet

++ IG

++ security group

++ EIP

++ IAM users and policies

++ assigns values based on environment

++ stores state in s3 along with version

++ create SNS 

++ create cloudwatch event rule for EC2, any state change on ec2 will be captured and published to SNS

++ attach iam policy to publish to sns

++ adopted for v0.12

++ create Node.JS lambda function to publish on slack webhook. Node.JS Lambda repo --> https://github.com/TheRealVish/awslambda

++ Note: Add slack webhook as an env variable using process.env in lambda

++ attach policies for lambda function

++ attach lambda permission to trigger lambda

GRAPH

##### Pre-req: brew install graphviz to generate graph. 
##### tf command: terraform graph | dot -Tsvg > graph.svg

TIPS

##### use terraform apply --auto-approve to skip approve step
##### always terraform init to install a new module 
##### keep the folder structure clean with separate modules for group of resources
##### keep secrets in .tfvars and include in .gitignore
##### replicate the steps on console to get accurate policy JSON


@realvish