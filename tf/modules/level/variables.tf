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
    name             = string
    path             = string
    group            = string
    description      = string
    allow_force_push = bool
    topics           = set(string)
  }))
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
