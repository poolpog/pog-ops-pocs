#!/usr/bin/env bash
set -o errexit
set -o xtrace

# POC for Devops task

STACK_NAME="csdevops-poc"
#STACK_NAME="${STACK_NAME}-$$"
#echo "STACK NAME: $STACK_NAME"

aws cloudformation delete-stack --stack-name "${STACK_NAME}"

while aws cloudformation describe-stacks --stack-name "${STACK_NAME}";  do
    echo "waiting for stack to delete"
    sleep 2
done

aws cloudformation create-stack \
--stack-name "${STACK_NAME}" \
--template-body file://csdevops-cloudformation.json

