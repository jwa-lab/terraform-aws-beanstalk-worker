variable "beanstalk_env_name" {
  type = string
  description = "Name of the environment to create. Used for the Beanstalk environment name and CNAME prefix, the IAM instance profile, the S3 logs bucket, the security groups"
}

variable "beanstalk_app_name" {
  type = string
  description = "Name of the beanstalk application to which the new environment will be attached."
}

variable "vpc_id" {
  type = string
  description = "Id of the VPC."
}

variable "production" {
  type = bool
  default = false
  description = "Deploy environment with production configuration (termination protection, logs retention, ...)"
}

variable "ha" {
  type = bool
  default = false
}

variable "worker_env_vars" {
  type = list(object({
    name: string,
    value: string,
  }))
  default = []
}

variable "solution_stack_name" {
  type = string
  description = "See https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html#concepts.platforms.list or run `aws elasticbeanstalk list-available-solution-stacks`"
}

variable "instance_type" {
  type = string
  default = null
}
