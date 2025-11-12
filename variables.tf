# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cool_lambda_artifacts_s3_bucket" {
  description = "The name of the bucket where COOL Lambda deployment packages are to be stored."
  nullable    = false
  type        = string
}

variable "disable_inactive_users_lambda_key" {
  description = "The S3 key associated with the Lambda function deployment package to disable inactive IAM users."
  nullable    = false
  type        = string
}

variable "wiz_external_id" {
  description = "The external ID of the Wiz AWS Connector.  This value must be retrieved from the Wiz portal when creating the AWS Connector."
  nullable    = false
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.wiz_external_id))
    error_message = "The wiz_external_id must match the pattern XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX (UUID format)."
  }
}

variable "wiz_remote_arn" {
  description = "The AWS Trust Policy Role ARN for your Wiz data center.  It can be retrieved from the Wiz portal (User Settings, Tenant)."
  nullable    = false
  type        = string
  validation {
    condition     = can(regex("^arn:aws:iam::[0-9]{12}:role/.*$", var.wiz_remote_arn))
    error_message = "The wiz_remote_arn must be a valid AWS IAM Role ARN (e.g., arn:aws:iam::123456789012:role/RoleName)."
  }
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources for the Cyber Hygiene account are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "cyhy_lambda_artifacts_s3_bucket_prefix" {
  default     = "cool-cyhy-lambda-deployment-artifacts"
  description = "The prefix of the name of the bucket in the Cyber Hygiene account where any Lambda deployment artifacts for a CyHy environment will be stored.  A unique bucket name beginning with the specified prefix will be created."
  nullable    = false
  type        = string
}

variable "provisionaccount_role_description" {
  default     = "Allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  description = "The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "provisionaccount_role_name" {
  default     = "ProvisionAccount"
  description = "The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "provisioncyhyroot_policy_description" {
  default     = "Allows sufficient permissions to provision all AWS resources required by cisagov/cyhy-tf-root."
  description = "The description to associate with the IAM policy that allows sufficient permissions to provision all AWS resources required by cisagov/cyhy-tf-root."
  nullable    = false
  type        = string
}

variable "provisioncyhyroot_policy_name" {
  default     = "ProvisionCyHyRoot"
  description = "The name to assign the IAM policy that allows sufficient permissions to provision all AWS resources required by cisagov/cyhy-tf-root."
  nullable    = false
  type        = string
}

variable "provisionlambdabucket_policy_description" {
  default     = "Allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket in the Cyber Hygiene account."
  description = "The description to associate with the IAM policy that allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "provisionlambdabucket_policy_name" {
  default     = "ProvisionLambdaArtifactsBucket"
  description = "The name to assign the IAM policy that allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "provisionssmsessionmanager_policy_description" {
  default     = "Allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  description = "The description to associate with the IAM policy that allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "provisionssmsessionmanager_policy_name" {
  default     = "ProvisionSSMSessionManager"
  description = "The name to assign the IAM policy that allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  nullable    = false
  type        = string
}

variable "read_cool_lambda_bucket_policy_description" {
  default     = "Allows read-only access to the bucket in the Terraform account containing Lambda deployments."
  description = "The description to associate with the IAM role that allows read-only access to the bucket in the Terraform account containing Lambda deployments."
  nullable    = false
  type        = string
}

variable "read_cool_lambda_bucket_policy_name" {
  default     = "LambdaBucketReadOnly"
  description = "The name to assign the IAM policy that allows read-only access to the bucket in the Terraform account containing Lambda deployments."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources provisioned."
  nullable    = false
  type        = map(string)
}
