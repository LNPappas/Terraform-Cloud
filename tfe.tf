# Testing enviornment to use 1 workspace to spin up 2 others
# workspace uses a runs trigger on workspaces b & c  when variables are set

resource "tfe_workspace" "workspace_b" {
  name              = "workspace_b"
  organization      = "db_test"
  terraform_version = "0.13.12"
  queue_all_runs    = false

  vcs_repo {
    identifier     = "LNPappas/repo_b"
    branch         = "main"
    oauth_token_id = "ot-2NQF7eb6F3E4s21g"
  }
}

resource "tfe_workspace" "workspace_c" {
  name              = "workspace_c"
  organization      = "db_test"
  terraform_version = "0.13.12"
  queue_all_runs    = false

  vcs_repo {
    identifier     = "LNPappas/repo_c"
    branch         = "main"
    oauth_token_id = "ot-2NQF7eb6F3E4s21g"
  }
}

resource "tfe_variable" "b_tfvars_plan" {
  key          = "TF_CLI_ARGS_plan"
  value        = "terraform.auto.tfvars"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "c_tfvars_plan" {
  key          = "TF_CLI_ARGS_plan"
  value        = "terraform.auto.tfvars"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}
