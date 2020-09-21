# Screenplay for Demo 3

* Open AWS CloudFormation
* Show stacks from Copilot
* Show sample template for Wordpress
* Explain the main parts of the designer
* Show multi-AZ template for Wordpress
* Create simple Wordpress
* Show all the various tabs
  * Events
  * Resources --> Connect to EC2 (remark how that was not possible for Beanstalk)
* Delete stack, move on to Terraform, `cd /demo3/example1/`
* Show `example1.tf` file, explain structure
* `terraform init`
* `terraform apply` (already contains planning step since 0.11)
* Highlight that we can't connect :/
* `terraform destroy`
* `cd ../example2/`, show `example2.tf`, explain provisioners
* `terraform apply`
* Show that connection is not working, enable inbound port 22 and explain how it could be done (specify already existing SG, define one as a resource, use a bastion host, ...)
* `cd ../example3/`, show `lambda.tf`, explain
* `terraform apply`
* `aws lambda invoke --region=us-east-1 --function-name=ServerlessExample output.txt`
* `cd ../example4/`, *TODO*
