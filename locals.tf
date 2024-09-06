# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is
# authorized.  This is used to determine the CyHy account ID.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "cyhy" {}

# Retrieve the information for all accounts in the organization.  This is used,
# for instance, to lookup the account ID for the Users account.
data "aws_organizations_organization" "cool" {
  provider = aws.organizationsreadonly
}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Find the Users account
  users_account_id = [
    for account in data.aws_organizations_organization.cool.accounts :
    account.id
    if account.name == "Users"
  ][0]

  # Get the CyHy account ID.
  cyhy_account_id = data.aws_caller_identity.cyhy.id
}
