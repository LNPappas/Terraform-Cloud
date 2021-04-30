resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "30s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}

resource "github_repository" "repo_b" {
  name = "repo_b"
}

resource "github_repository" "repo_c" {
  name = "repo_c"
}

resource "github_repository_file" "b_tfvars" {
    depends_on = [time_sleep.wait_30_seconds]
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "repo_b.tfvars"
  content             = "repo_b.tfvars"
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "c_tfvars" {
    depends_on = [time_sleep.wait_30_seconds]
  repository          = github_repository.repo_c.name
  branch              = "main"
  file                = "repo_c.tfvars"
  content             = "repo_c.tfvars"
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_branch_protection_v3" "main_b" {
  repository = github_repository.repo_b.name
  branch     = "main"
}

resource "github_branch_protection_v3" "main_c" {
  repository = github_repository.repo_c.name
  branch     = "main"
}

resource "github_branch_default" "default_b" {
  repository = github_repository.repo_b.name
  branch     = "main"
}

resource "github_branch_default" "default_c" {
  repository = github_repository.repo_c.name
  branch     = "main"
}