#resource "aws_dynamodb_table" "terraform_locks" {
#  name           = "terraform_locks"
#  billing_mode   = "PAY_PER_REQUEST"
#  hash_key       = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#}

# Crea un bucket S3 para almacenar el estado de Terraform
#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "terra-bucket-state-pia983" # Nombre único del bucket

 # lifecycle {
  #  prevent_destroy = false
 # }
#}