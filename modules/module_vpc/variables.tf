variable "cidr_vpc" {
  description = "VPC from Terraform"
  type        = string
}

variable "pubsubnets" {
  type = list(map(string))
  default = [
    {
      pubsubnets = "10.80.0.0/24"
      subzones   = "us-east-1a"
    },
    {
      pubsubnets = "10.80.1.0/24"
      subzones   = "us-east-1b"
    }
  ]
}

variable "privsubnets" {
  type = list(map(string))
  default = [
    {
      privsubnets = "10.80.2.0/24"
      subzones    = "us-east-1a"
    },
    {
      privsubnets = "10.80.3.0/24"
      subzones    = "us-east-1b"
    }
  ]
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}