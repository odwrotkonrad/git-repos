##[>] 🤖🤖
variable "tree" {
  type = object({
    name        = string
    path        = string
    description = string
    projects = optional(map(object({
      name             = string
      path             = string
      description      = string
      allow_force_push = optional(bool, false)
      topics           = optional(set(string), [])
      visibility       = optional(string, "public")
    })), {})
    groups = optional(any, {})
  })
}

variable "github_owner" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}
##[<] 🤖🤖
