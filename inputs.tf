variable "name" {
  description = "Name of the application"
  type        = string
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "hosted_zone_domain" {
  type        = string
  description = "Hosted zone to add doamin and cloufront Cname to"
  nullable    = true
}
variable "create_custom_domain" {
  type        = bool
  description = "Whether to use a custom domain or not"
  default     = false
}

variable "custom_domain_name" {
  type        = string
  description = "Custom domain name"
  nullable    = true
}
