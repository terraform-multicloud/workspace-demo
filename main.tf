variable "numberofvms" {
    type = number
  
}


resource "aws_instance" "ec2-vm1" {
    count = var.numberofvms
    ami           = var.vmami
    instance_type = var.vmtype
    subnet_id = "subnet-01aac3d16b5e7d1ad"
    tags = {
      Name = "client3-vm-${count.index + 1}"
    }
  
}


variable "bucketnames" {
    type = list(string)
    default = ["bucketone-client3", "buckettwo-client3", "bucketthree-client3"]
  
}
resource "aws_s3_bucket" "buck1" {
    # count = length(var.bucketnames)
    for_each = toset(var.bucketnames)
    bucket = each.value

  
}



variable "map1" {
    type = map(string)
    default = {
        env1 = "dev-client3"
        env2 = "qa-client3"
        env3 = "prod-client3"
    }
  
}
output "map1value" {
    # value = var.map1["env2"]
    value = lookup(var.map1, "env2", "notfound")
  
}
resource "aws_s3_bucket" "buck2" {
    for_each = var.map1
    bucket = "himanshu-${each.value}" 
    tags = {
        Environment = each.key
    } 
}
# resource "aws_s3_bucket_metadata_configuration" "meta1" {
#     for_each = var.map1
#     bucket = each.value
#     metadata_configuration {
#         environment = "${each.key}"
#     }
  
# }



variable "num1" {
    type = number
    default = 30
  
}
output "onum1" {
    value = var.num1 >= 50 ? "Greater than 50" : "Less than or equal to 50"
  
}
variable "consent" {
    type = string
  
}

resource "aws_s3_bucket" "buck3" {
    count = var.consent == "yes" ? 1 : 0
    bucket = "conditional-bucket-client3"
  
}