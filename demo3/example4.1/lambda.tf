terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_lambda_function" "lambda_example" {
  function_name = "ServerlessExample"

  s3_bucket = "tecobserver-terraform-demo-ex3"
  s3_key    = "v${var.app_version}/minimal-node.zip"

  handler = "main.handler"
  runtime = "nodejs10.x"

  role = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.my_gateway.id
  parent_id   = aws_api_gateway_rest_api.my_gateway.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_lambda_permission" "permission_for_apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.lambda_example.function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.my_gateway.execution_arn}/*/*"
}

variable "app_version" {
}

