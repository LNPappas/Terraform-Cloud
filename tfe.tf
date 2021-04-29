# Testing enviornment to use 1 workspace to spin up 2 others
# workspace uses a runs trigger on workspaces b & c  when variables are set

resource "tfe_workspace" "workspace_b" {
  name              = "Workspace-b"
  organization      = "Factory_Test"
  terraform_version = "0.13.12"
  queue_all_runs    = false

  vcs_repo {
    identifier     = github_repository.repo_b.full_name
    branch         = github_branch_protection_v3.main_b.branch
    oauth_token_id = var.github_token
  }
}

resource "tfe_workspace" "workspace_c" {
  name              = "Workspace-c"
  organization      = "Factory_Test"
  terraform_version = "0.13.12"
  queue_all_runs    = false

  vcs_repo {
    identifier     = github_repository.repo_c.full_name
    branch         = github_branch_protection_v3.main_c.branch
    oauth_token_id = var.github_token
  }
}

resource "tfe_variable" "b_tfvars_plan" {
  key          = "TF_CLI_ARGS_plan"
  value        = "repo_b.tfvars"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "c_tfvars_plan" {
  key          = "TF_CLI_ARGS_plan"
  value        = "repo_c.tfvars"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}

# resource "tfe_team" "team" {
#   name         = "ops"
#   organization = "Factory_Test"
# }

# resource "tfe_team_access" "access_b" {
#   permissions {
#     runs              = "apply"
#     variables         = "read"
#     state_versions    = "write"
#     sentinel_mocks    = "read"
#     workspace_locking = true
#   }

#   team_id      = tfe_team.team.id
#   workspace_id = tfe_workspace.workspace_b.id
# }

# resource "tfe_team_access" "access_c" {
#   permissions {
#     runs              = "apply"
#     variables         = "read"
#     state_versions    = "write"
#     sentinel_mocks    = "read"
#     workspace_locking = true
#   }

#   team_id      = tfe_team.team.id
#   workspace_id = tfe_workspace.workspace_c.id
# }

# resource "tfe_organization" "organization" {
#   name  = "Factory_Test"
#   email = "LPappas@gmail.com"
# }

# data "tfe_organization_membership" "membership" {
#   organization = "Factory_Test"
#   email        = "LPappas@gmail.com"
# }

# resource "tfe_team_organization_member" "member" {
#   team_id                    = tfe_team.team.id
#   organization_membership_id = data.tfe_organization_membership.membership.email
# }
