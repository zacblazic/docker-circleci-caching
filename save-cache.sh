#!/bin/sh

set -ex

# AWS_ACCOUNT_ID=185075373143
# AWS_REGION='us-east-1'
# IMAGE_NAME='zacblazic/app'
# CIRCLE_BRANCH='master'

save_image() {
  eval $(aws ecr get-login --region $AWS_REGION)
  docker tag $IMAGE_NAME $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME-cache:$CIRCLE_BRANCH
  aws ecr describe-repositories --repository-names $IMAGE_NAME-cache || aws ecr create-repository --repository-name $IMAGE_NAME-cache
  docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME-cache:$CIRCLE_BRANCH | cat
}

save_image
