Terraform:
assume_role_policy = <<POLICY
POLICY is permission in IAM ( user, groups of users or roles)
AssumeRole is set temporary credentails
vpc_config is list of subnet is config

Security group
aws_security_group egress (outbound), ingress(inbound)
security group act as firewall
security group act at instance level
Cost: no cost for security group
https://console.aws.amazon.com/billing/home?region=ap-southeast-1#/

aws_launch_configuration
Provide a resource to create a new launch configuration, use auto scaling group

aws_iam_instance_profile
Provide IAM instance profile

aws_security_group_rule
provide a security group rule resouces

kubernetes_config_map
the resource provides mechanism to inject containers with configuration data while keeping container agnostic of Kubernetes.

aws_eks_cluster
manage an eks cluster

aws_autoscaling_group
Provide scaling group resource

aws_iam_policy
Provide iam policy

cda0d887b038058baffdb216f9223eb9db06403b
npm run typeorm migration:revert -- --config apps/messaging-api/ormconfig.ts