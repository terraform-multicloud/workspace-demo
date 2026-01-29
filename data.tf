data "aws_s3_bucket" "databucket1" {
    bucket = "himanshu-manual-bucket"
 
}
data "aws_availability_zones" "azs" {
    region = var.regionname
  
}
output "all-azs" {
    value = data.aws_availability_zones.azs.names
  
}


data "aws_vpc" "def-vpc" {
  default = true
}
resource "aws_security_group" "def-sg" {
    vpc_id = data.aws_vpc.def-vpc.id
    name = "manual-sg-default-vpc"
  
}
