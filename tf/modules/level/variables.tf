##[>] 🤖🤖
variable "groups" {
  type = map(object({
    name        = string
    leaf_path   = string
    description = string
    parent      = optional(string)
  }))
}

variable "projects" {
  type = map(object({
    name                = string
    path                = string
    group               = string
    description         = string
    allow_force_push    = bool
    topics              = set(string)
    visibility          = string
    enable_local_runner = bool
    pages_unique_domain = optional(bool)
  }))
}

variable "local_runner_id" {
  type    = number
  default = null
}

variable "parent_ids" {
  type    = map(string)
  default = {}
}

variable "github_owner" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}
##[<] 🤖🤖
