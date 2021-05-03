# Testing enviornment to use 1 workspace to spin up 2 others
# workspace uses a runs trigger on workspaces b & c  when variables are set

resource "tfe_workspace" "workspace_b" {
  //   depends_on        = [github_repository_file.b_tfvars]
  name              = "workspace_b"
  organization      = "db_test"
  terraform_version = "0.14.5"
  queue_all_runs    = false

  vcs_repo {
    identifier     = "LNPappas/${github_repository.repo_b.name}"
    branch         = "main"
    oauth_token_id = "ot-2NQF7eb6F3E4s21g"
  }
}

// resource "tfe_variable" "b_tfvars_plan" {
//   key          = "TF_CLI_ARGS_plan"
//   value        = file("terraform.auto.tfvars")
//   category     = "terraform"
//   workspace_id = tfe_workspace.workspace_b.id
// }

resource "tfe_variable" "bucket_1" {
  key          = "bucket_1"
  value        = "${var.bucket_1}-${tfe_workspace.workspace_b.name}"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}


resource "tfe_variable" "bucket_2" {
  key          = "bucket_2"
  value        = "${var.bucket_2}-${tfe_workspace.workspace_b.name}"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}


resource "tfe_variable" "project_name" {
  key          = "project_name"
  value        = var.project_name
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}


resource "tfe_variable" "region" {
  key          = "region"
  value        = var.region
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_b.id
}


resource "tfe_variable" "github_token" {
  key          = "github_token"
  value        = var.github_token
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "github_token_env" {
  key          = "github_token"
  value        = var.github_token
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "gcp_credentials" {
  key          = "google_credentials"
  value        = var.google_credentials
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "google_credentials" {
  key          = "google_credentials"
  value        = var.google_credentials
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_variable" "workspace_trigger_id" {
  key          = "workspace_trigger_id"
  value        = var.workspace_trigger_id
  category     = "terraform"
  sensitive    = false
  workspace_id = tfe_workspace.workspace_b.id
}

resource "tfe_run_trigger" "trigger_b" {
  workspace_id  = tfe_workspace.workspace_b.id
  sourceable_id = var.workspace_trigger_id
}

resource "tfe_workspace" "workspace_c" {
  name              = "workspace_c"
  organization      = "db_test"
  terraform_version = "0.14.5"
  queue_all_runs    = false

  vcs_repo {
    identifier     = "LNPappas/repo_c"
    branch         = "main"
    oauth_token_id = "ot-2NQF7eb6F3E4s21g"
  }
}

resource "tfe_variable" "bucket_1" {
  key          = "bucket_1"
  value        = "${var.bucket_1}-${tfe_workspace.workspace_c.name}"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}


resource "tfe_variable" "bucket_2" {
  key          = "bucket_2"
  value        = "${var.bucket_2}-${tfe_workspace.workspace_c.name}"
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}


resource "tfe_variable" "project_name" {
  key          = "project_name"
  value        = var.project_name
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}


resource "tfe_variable" "region" {
  key          = "region"
  value        = var.region
  category     = "terraform"
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_variable" "github_token" {
  key          = "github_token"
  value        = var.github_token
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_variable" "github_token_env" {
  key          = "github_token"
  value        = var.github_token
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_variable" "github_token" {
  key          = "github_token"
  value        = var.github_token
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_c.id
}


resource "tfe_variable" "github_token" {
  key          = "github_token"
  value        = var.github_token
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_variable" "google_credentials" {
  key          = "google_credentials"
  value        = var.google_credentials
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_variable" "workspace_trigger_id_c" {
  key          = "workspace_trigger_id"
  value        = var.workspace_trigger_id
  category     = "terraform"
  sensitive    = false
  workspace_id = tfe_workspace.workspace_c.id
}

resource "tfe_run_trigger" "trigger_c" {
  workspace_id  = tfe_workspace.workspace_c.id
  sourceable_id = var.workspace_trigger_id
}