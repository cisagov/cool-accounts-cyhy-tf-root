# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the permissions necessary
# to read from the bucket containing the COOL Lambda deployments.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "read_cool_lambda_bucket_policy_doc" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::${var.cool_lambda_artifacts_s3_bucket}",
      "arn:aws:s3:::${var.cool_lambda_artifacts_s3_bucket}/*"
    ]
  }
}

resource "aws_iam_policy" "read_cool_lambda_bucket_policy" {
  description = var.read_cool_lambda_bucket_policy_description
  name        = var.read_cool_lambda_bucket_policy_name
  policy      = data.aws_iam_policy_document.read_cool_lambda_bucket_policy_doc.json
}
