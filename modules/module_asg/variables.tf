variable "ec2role" {
  description = "Valor el EC2 Role Importado"
}

variable "albsg" {
  description = "Valor del ALB SG Importado"
}

variable "albtgarn" {
  description = "Valor del ARN Target Group Importado"
}

variable "pubsub" {
  description = "Valor de las subredes publicas Importadas"
}

variable "dataLT" {
    description = "Datos de AWS Launch Tempalte para AWS ASG"
    type = map(string)
}

variable "dataASG" {
    description = "Datos de AWS Auto Scaling Group"
    type = map(string)
}