#!/bin/sh

set -ex

# AWS_ACCOUNT_ID=185075373143
# AWS_REGION='us-east-1'
# IMAGE_NAME='zacblazic/app'
# CIRCLE_BRANCH='master'

restore_image() {
  eval $(aws ecr get-login --region $AWS_REGION)
  docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME-cache:$CIRCLE_BRANCH | cat

  # if [ aws ecr describe-repositories --repository-names $IMAGE_NAME-cache ]; then
  #   docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME | cat
  # fi
}

restore_image
