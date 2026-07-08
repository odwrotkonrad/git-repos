##[>] 🤖🤖
variable "tree" {
  type = object({
    name        = string
    path        = string
    description = string
    projects = optional(map(object({
      name                = string
      path                = string
      description         = string
      allow_force_push    = optional(bool, false)
      topics              = optional(set(string), [])
      visibility          = optional(string, "public")
      enable_local_runner = optional(bool, false)
      pages_unique_domain = optional(bool)
    })), {})
    groups = optional(any, {})
  })
}

variable "local_runner_id" {
  type    = number
  default = null
}

variable "github_owner" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}
##[<] 🤖🤖
