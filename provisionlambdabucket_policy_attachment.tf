# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows provisioning of
# the Lambda deployment artifacts bucket.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provisionlambdabucket_policy_attachment" {
  policy_arn = aws_iam_policy.provisionlambdabucket_policy.arn
  role       = var.provisionaccount_role_name
}
