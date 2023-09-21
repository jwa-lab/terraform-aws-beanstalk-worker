module "beanstalk" {
  source = "jwa-lab/beanstalk/aws"
  version = "0.1.1"

  beanstalk_env_name = var.beanstalk_env_name
  beanstalk_app_name = var.beanstalk_app_name

  tier = "Worker"
  solution_stack_name = var.solution_stack_name
  vpc_id = var.vpc_id

  production = var.production
  ha = var.ha

  description = "Worker environment for ${var.beanstalk_app_name}"

  profile_permissions_boundary_arn = var.profile_permissions_boundary_arn
  instance_type = var.instance_type

  beanstalk_settings = [
    {
      namespace = "aws:autoscaling:asg"
      name = "MaxSize"
      value = var.max_instance_count != null ? var.max_instance_count : var.ha ? 2 : 1
    },
    {
      namespace = "aws:autoscaling:asg"
      name = "MinSize"
      value = var.min_instance_count != null ? var.min_instance_count : var.ha ? 2 : 1
    },
    {
      namespace = "aws:elasticbeanstalk:sqsd"
      name = "HttpPath"
      value = "/worker"
    },
  ]

  beanstalk_env_vars = var.worker_env_vars
}






















#  setting {
#    namespace = "aws:elasticbeanstalk:sqsd"
#    name = "HttpPath"
#    value = "/worker"
#  }
#
#  setting {
#    namespace = "aws:elasticbeanstalk:sqsd"
#    name = "HttpPath"
#    value = "/worker"
#  }
#
#  dynamic "setting" {
#    for_each = local.worker_settings
#
#    content {
#      namespace = setting.value["namespace"]
#      name = setting.value["name"]
#      value = setting.value["value"]
#      resource = ""
#    }
#  }
#
#  dynamic "setting" {
#    for_each = var.worker_env_vars
#
#    content {
#      namespace = "aws:elasticbeanstalk:application:environment"
#      name = setting.value["name"]
#      value = setting.value["value"]
#      resource = ""
#    }
#  }
#}
