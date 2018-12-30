APP_NAME = aws-serverless-lambda-template
AWS_ACCOUNT = $(shell aws sts get-caller-identity | jq '.Account')
BUCKET_NAME = $(APP_NAME)-bucket

create-bucket:
	aws s3 mb s3://$(BUCKET_NAME)

delete-bucket:
	aws s3 rb s3://$(BUCKET_NAME) --force

delete-stack:
	aws cloudformation delete-stack --stack-name $(APP_NAME)

deploy:
	sam deploy \
 		--parameter-overrides AppName=$(APP_NAME) \
		--template-file ./aws/package.yml \
		--stack-name $(APP_NAME) \
		--capabilities CAPABILITY_IAM

package:
	sam package \
		--template-file ./aws/cloudformation.yml \
		--output-template-file ./aws/package.yml \
		--s3-bucket $(BUCKET_NAME)

validate-template:
	aws cloudformation validate-template \
		--template-body file://./aws/cloudformation.yml
