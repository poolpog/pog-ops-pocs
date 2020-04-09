#!/usr/bin/env bash
set -x
set -e

aws ec2 run-instances \
--image-id ami-0d3537e1397cd4de5 \
--user-data file://test-instance-userdata.sh \
--instance-type t2.micro \
--key-name poolpog-xps \
--associate-public-ip-address  \
--subnet-id subnet-00f46bfe3a0b43b03

sleep 20

aws ec2 describe-instances --filters Name=instance-state-name,Values=running | jq -r '.Reservations[].Instances[].InstanceId'

echo aws ec2 modify-instance-attribute --groups sg-032b0d08eec69ab3a --instance-id  "${INSTANCE_ID}"
