variable "env" {
  type = string
}

variable "shutdown" {
  type    = bool
  default = false
}

variable "network" {
  type = object({
    name    = string
    domain  = string
    subnet  = string
    macaddr = string
  })
}

variable "storage" {
  type = object({
    pool      = string
    directory = string
  })
}

variable "nodes" {
  type = object({
    count   = number
    prefix  = string
    offset  = number
    firmware = object({
      file = string
      vars = string
    })
    vcpu    = number
    memory  = string
    image   = string
    storage = string
  })
}
