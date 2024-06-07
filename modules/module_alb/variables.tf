variable "vpcid" {
  description = "Valor de la VPC Importado"
}

variable "albsg" {
  description = "Valor del ALB SG Importado"
}

variable "pubsub" {
  description = "Valor de las subredes publicas Importadas"
}

variable "albtgdata" {
  description = "Datos del AWS ALB target group "
  type        = map(string)
}

variable "albdata" {
  description = "Datos del AWS ALB target group "
  type        = map(string)
}