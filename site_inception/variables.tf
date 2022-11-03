variable "inception_projects" {
  type = list(string)
}

variable "include_inception_project" {
  type    = bool
  default = false
}

variable "enable_versioning" {
  type    = bool
  default = true
}

variable "disable_force_destroy" {
  type    = bool
  default = false
}
