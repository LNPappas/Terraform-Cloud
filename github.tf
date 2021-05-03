resource "github_repository" "repo_b" {
  name                 = "repo_b"
  auto_init            = true
  vulnerability_alerts = true
}

resource "github_repository_file" "b_tfvars" {
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "terraform.auto.tfvars"
  content             = file("terraform.auto.tfvars")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "main" {
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "main.tf"
  content             = file("main.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "providers" {
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "providers.tf"
  content             = file("providers.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "variables" {
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("variables.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository" "repo_c" {
  name = "repo_c"
  auto_init = true
  vulnerability_alerts = true
}

resource "github_repository_file" "c_tfvars" {
  repository          = github_repository.repo_c.name
  branch              = "main"
  file                = "terraform.auto.tfvars"
  content             = file("terraform.auto.tfvars")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "main_c" {
  repository          = github_repository.repo_c.name
  branch              = "main"
  file                = "main.tf"
  content             = file("main.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "providers_c" {
  repository          = github_repository.repo_c.name
  branch              = "main"
  file                = "providers.tf"
  content             = file("providers.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "variables_c" {
  repository          = github_repository.repo_c.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("variables.tf")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}
