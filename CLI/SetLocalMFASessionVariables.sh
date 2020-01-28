#!/bin/bash

AWS_CREDENTIALS_JSON="$(aws sts get-session-token --serial-number $1 --token-code $2)"

export AWS_ACCESS_KEY_ID="$(echo $AWS_CREDENTIALS_JSON | jq '.Credentials.AccessKeyId')"
export AWS_SECRET_ACCESS_KEY="$(echo $AWS_CREDENTIALS_JSON | jq '.Credentials.SecretAccessKey')"
export AWS_SESSION_TOKEN="$(echo $AWS_CREDENTIALS_JSON | jq '.Credentials.SessionToken')"
