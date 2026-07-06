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
    })), {})
    groups = optional(any, {})
  })
}
##[<] 🤖🤖
