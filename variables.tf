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
    secret_string = string
  }))
}

variable "parameters" {
  description = "A map of parameters to create in Parameter Store"
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}