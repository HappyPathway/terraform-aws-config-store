# Missing Vraiables:  [
#     "secret_string",
#     "path_key",
#     "path_prefix"
# ]
variable "secrets" {
  default = null
  type = object({
    path_prefix   = string
    path_key      = string
    secret_string = string
  })
}

variable "parameters" {
  description = "A map of parameters to create in Parameter Store"
  type = map(object({
    name  = string
    value = string
    type  = string
  }))
  default = null
}
