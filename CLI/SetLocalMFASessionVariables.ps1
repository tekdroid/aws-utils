param (
    [string]$MFADeviceARN = $(throw "-MFADeviceARN is required."),
    [string]$TokenCode = $(throw "-TokenCode is required.")
)

$AWS_CREDENTIALS_JSON=(aws sts get-session-token --serial-number "$MFADeviceARN" --token-code $TokenCode | ConvertFrom-Json)

$AWS_ACCESS_KEY_ID=$AWS_CREDENTIALS_JSON.Credentials.AccessKeyId
$AWS_SECRET_ACCESS_KEY=$AWS_CREDENTIALS_JSON.Credentials.SecretAccessKey
$AWS_SESSION_TOKEN=$AWS_CREDENTIALS_JSON.Credentials.SessionToken

set AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
set AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
set AWS_SESSION_TOKEN $AWS_SESSION_TOKEN
