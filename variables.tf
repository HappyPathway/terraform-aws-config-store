# Missing Vraiables:  [
#     "secret_string",
#     "path_key",
#     "path_prefix"
# ]
variable "secrets" {
  default = []
  type = list(object({
    path_prefix   = string
    path_key      = string
    secret_string = optional(string, null)
  }))
}

variable "parameters" {
  description = "A map of parameters to create in Parameter Store"
  type = list(object({
    name  = string
    value = optional(string, null)
    type  = string
  }))
  default = []
}

variable "init_parameters" {
  type    = bool
  default = false
}

variable "init_secrets" {
  type    = bool
  default = false
}
