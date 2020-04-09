#!/usr/bin/env bash
set -o errexit
set -o xtrace

# POC for Devops task

CHANGESET_ID=$( date "+%Y%m%d-%H%M%S" )

aws cloudformation create-change-set \
--stack-name csdevops-poc \
--change-set-name "csdevops-poc-${CHANGESET_ID}" \
--template-body file://csdevops-cloudformation.json

