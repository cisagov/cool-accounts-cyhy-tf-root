# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows reading from
# the S3 bucket in the Terraform account where Lambda deployment packages are
# stored.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "read_cool_lambda_bucket" {
  policy_arn = aws_iam_policy.read_cool_lambda_bucket_policy.arn
  role       = module.provisionaccount.provisionaccount_role.name
}
