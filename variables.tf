# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources for the Cyber Hygiene account are to be provisioned (e.g. \"us-east-1\")."
  type        = string
}

variable "lambda_artifacts_s3_bucket" {
  default     = "cool-cyhy-lambda-deployment-artifacts"
  description = "The name of the bucket where any Lambda deployment artifacts for a CyHy environment will be stored.  Note that in production Terraform workspaces, the string '-production' will be appended to the bucket name.  In non-production workspaces, '-<workspace_name>' will be appended to the bucket name."
  type        = string
}

variable "provisionaccount_role_description" {
  default     = "Allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  description = "The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  type        = string
}

variable "provisionaccount_role_name" {
  default     = "ProvisionAccount"
  description = "The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the Cyber Hygiene account."
  type        = string
}

variable "provisionlambdabucket_policy_description" {
  default     = "Allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket."
  description = "The description to associate with the IAM policy that allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket."
  type        = string
}

variable "provisionlambdabucket_policy_name" {
  default     = "ProvisionLambdaArtifactsBucket"
  description = "The name to assign the IAM policy that allows sufficient permissions to provision the Lambda deployment artifacts S3 bucket."
  type        = string
}

variable "provisionssmsessionmanager_policy_description" {
  default     = "Allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  description = "The description to associate with the IAM policy that allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  type        = string
}

variable "provisionssmsessionmanager_policy_name" {
  default     = "ProvisionSSMSessionManager"
  description = "The name to assign the IAM policy that allows sufficient permissions to provision the SSM Document resource and set up SSM session logging in the Cyber Hygiene account."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources provisioned."
  type        = map(string)
}
