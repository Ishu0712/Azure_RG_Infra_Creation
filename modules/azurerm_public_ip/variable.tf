variable "public_ips" {
  type = map(object({
    pip_name          = string
    location          = string
    rg_name           = string
    allocation_method = string

  }))
}
