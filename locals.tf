locals {
    asg_tags =  merge(var.tags, {Name = "${var.env}-${var.name}"})
    dynamic_asg = [for k,v in local.asg_tags: tomap({"key" = k, "value" = v}) ]
}