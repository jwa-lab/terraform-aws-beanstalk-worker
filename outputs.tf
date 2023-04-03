output "instance_role" {
  value = module.beanstalk.instance_role
}

output "beanstalk_env" {
  value = module.beanstalk.beanstalk_env
}

output "instances_security_group_id" {
  value = module.beanstalk.instances_security_group_id
}
