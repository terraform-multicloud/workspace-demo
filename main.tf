resource "aws_instance" "ec2-vm1" {
    ami           = var.vmami
    instance_type = var.vmtype
    subnet_id = "subnet-01aac3d16b5e7d1ad"
    tags = {
      Name = var.vmname
    }
  
}
