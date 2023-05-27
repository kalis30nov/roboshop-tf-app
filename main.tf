resource "aws_instance" "test" {
    ami = "ami-0b5a2b5b8f2be4ec2"
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}

variable "instance_type" {}
variable "subnet_id" {}

module "web" {
  source = "git::https://github.com/kalis30nov/roboshop-tf-app.git"

  for_each = var.app
  instance_type = each.value["instance_type"]
  subnet_id = element(lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["subnet_name"], null), "subnet_ids", null), 0)
}