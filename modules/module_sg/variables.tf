variable "sg_ingress_cidr" {
  description = "CIDR"
}

variable "ingres_port_listALB" {
  description = "Lista de los puertos de entrada"
  type        = list(number)

}

variable "ingres_port_listEC2" {
  description = "Lista de los puertos de entrada"
  type        = list(number)

}

variable "vpcid" {
  description = "Valor de la VPC Importado"
  
}