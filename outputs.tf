output "cw_alarm_sns_topic" {
  description = "The SNS topic to which a message is sent when a CloudWatch alarm is triggered."
  value       = module.cw_alarm_sns.sns_topic
}

output "lambda_artifacts_bucket" {
  description = "The S3 bucket in the Cyber Hygiene account where Lambda artifacts are stored."
  value       = aws_s3_bucket.lambda_artifacts
}

output "provisionaccount_role" {
  description = "The IAM role that allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  value       = module.provisionaccount.provisionaccount_role
}

output "ssm_session_role" {
  description = "An IAM role that allows creation of SSM SessionManager sessions to any EC2 instance in this account."
  value       = module.session_manager.ssm_session_role
}
