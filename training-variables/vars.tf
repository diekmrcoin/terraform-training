variable "structure" {
  type = list(object({
    cidr_block = string
    subnet     = string
  }))
  default = [
    {
      cidr_block = "10.0.0.0/16"
      subnet     = "10.0.0.0/24"
    },
    {
      cidr_block = "10.0.0.0/20"
      subnet     = "10.0.1.0/24"
    }
  ]
}

variable "default_zone" {
  default = "eu-west-3a"
}
