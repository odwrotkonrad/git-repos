##[>] 🤖🤖
terraform {
  required_version = "~> 1.15"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 18.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "gcs" {
    bucket = "konradodwrot-tfstate"
    prefix = "git-repos"
  }
}
##[<] 🤖🤖
