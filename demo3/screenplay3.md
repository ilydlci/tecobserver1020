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
* `terraform destroy`
* `cd ../example3/`, show `lambda.tf`, explain
* `terraform apply`
* `aws lambda invoke --region=eu-central-1 --function-name=ServerlessExample output.txt`
* `terraform destroy`
* `cd ../example4/`, show files, explain
* `terraform apply`
* Show gateway in AWS console
* `curl $URL && echo`, show output
* Load up new version
  * `cp ../example3/main.js .`
  * `nano main.js`, change output type to JSON
  * `zip minimal-node.js main.js` 
  * `aws s3 cp minimal-node.js s3://tecobserver-terraform-demo-ex3/v2/minimal-node.zip`
* Add variable for new version: `cp ../example4.1/lambda.tf .`, show difference `git diff`
* `terraform apply`, enter value `2` --> highlight difference in plan ("s3_key")
* `curl $BASE_URL && echo`, show new value
* Rollback to v1: `terraform apply -var="app_version=1"`
* `curl $BASE_URL && echo`, show new value
* `terraform destroy`
