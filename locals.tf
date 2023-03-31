locals {
  worker_settings = setsubtract([
    {
      namespace = "aws:ec2:instances"
      name = "InstanceTypes"
      value = var.instance_type != null ? var.instance_type : (var.production ? "t4g.small" : "t4g.micro")
    },
  ], [{}])
}
