variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-00a0a7cb1593bd724"
    "us-east-2" = "ami-0e2435e8671c38d2a"
  }
}
variable "region" { 
    default =  "us-east-1"
}
variable "access_key" {}
variable "secret_key" {}
