APP_NAME = aws-serverless-lambda-template
AWS_ACCOUNT = $(shell aws sts get-caller-identity | jq '.Account')
BUCKET_NAME = hello-world-sam-spenserca

delete-stack:
	aws cloudformation delete-stack --stack-name $(APP_NAME)

deploy:
	sam deploy \
		--template-file ./aws/package.yml \
		--stack-name hello-world-sam-spenserca \
		--capabilities CAPABILITY_IAM

package:
	sam package \
		--template-file ./aws/cloudformation.yml \
		--output-template-file ./aws/package.yml \
		--s3-bucket $(BUCKET_NAME)

validate-template:
	aws cloudformation validate-template \
		--template-body file://./aws/cloudformation.yml
