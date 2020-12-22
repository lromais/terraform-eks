provider "aws" {
  region = "sa-east-1"
}

######################################
# Data sources to get VPC and subnets
######################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

#############
# RDS Aurora
#############
module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 2.0"  
  name                            = "test-aurora-db-postgres96"
  engine                          = "aurora-postgresql"
  engine_version                  = "9.6.9"
  subnets                         = module.vpc.private_subnets
  vpc_id                          = module.vpc.vpc_id
  replica_count                   = 1
  instance_type                   = "db.r4.large"
  storage_encrypted               = true
  apply_immediately               = true
  monitoring_interval             = 10
  db_parameter_group_name         = "default"
  db_cluster_parameter_group_name = "default"
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  tags                            = {
    Environment = "dev"
    Terraform   = "true"
  }
}



resource "aws_db_parameter_group" "aurora_db_postgres96_parameter_group" {
  name        = "test-aurora-db-postgres10-parameter-group"
  family      = "aurora-postgresql10"
  description = "test-aurora-db-postgres10-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "aurora_cluster_postgres96_parameter_group" {
  name        = "test-aurora-postgres10-cluster-parameter-group"
  family      = "aurora-postgresql10"
  description = "test-aurora-postgres10-cluster-parameter-group"
}

############################
# Example of security group
############################
resource "aws_security_group" "app_servers" {
  name        = "app-servers"
  description = "For application servers"
  vpc_id      =  module.vpc.vpc_id
}

resource "aws_security_group_rule" "allow_access" {
  type                     = "ingress"
  from_port                = module.aurora.this_rds_cluster_port
  to_port                  = module.aurora.this_rds_cluster_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.app_servers.id
  security_group_id        = module.aurora.this_security_group_id
}

