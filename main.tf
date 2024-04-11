
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region  = "ap-northeast-2"
  profile = "lyh"
}
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws" # 외부 모듈 사용
  version         = "~> 5.0"
  name            = "final-vpc"
  cidr            = "172.28.0.0/16"
  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnets = ["172.28.10.0/24", "172.28.30.0/24"]
  public_subnets  = ["172.28.110.0/24", "172.28.130.0/24"]
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name    = "final-eks"
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  enable_irsa = true
  eks_managed_node_groups = {
    initial = {
      instance_types         = ["t3.medium"]
      min_size               = 1 // 최소값
      max_size               = 3 // 최대값
      desired_size           = 2 // 나타내는 갯수 
      vpc_security_group_ids = [module.add_node_sg.security_group_id]
    }
  }
  manage_aws_auth_configmap = true
  aws_auth_users = [
    {
      # aws의 계정 IAM 권한을 Container의 Account user/admin/으로 Mapping 
      userarn  = "arn:aws:iam::${data.aws_iam_user.EKS_Admin_ID.id}:user/lyh"
      username = "lyh" # Account의 사용자 명
      groups   = ["system:masters"]
    }
  ]
  cluster_additional_security_group_ids = [module.add_cluster_sg.security_group_id]
  cluster_endpoint_public_access        = true
}
module "add_cluster_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 5.0"
  name        = "add_cluster_sg"
  description = "add_cluster_sg"
  vpc_id          = module.vpc.vpc_id
  use_name_prefix = false
  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # eks명의 모듈의 module.eks.cluster_name이름을 가지는 cluster의 admin profile의 Account 정보 (token)를 가져옴
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--profile", "lyh"]
  }
}
data "aws_iam_user" "EKS_Admin_ID" {
  user_name = "lyh"
}
module "add_node_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 5.0"
  name        = "add_node_sg"
  description = "add_node_sg"
  vpc_id          = module.vpc.vpc_id
  use_name_prefix = false
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
module "BastionHost_SG" {
  source          = "terraform-aws-modules/security-group/aws"
  version         = "~> 5.0"
  name            = "BastionHost_SG"
  description     = "BastionHost_SG"
  vpc_id          = module.vpc.vpc_id
  use_name_prefix = false
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
data "aws_key_pair" "ec2-key" {
  key_name = "bootServer"
}
resource "aws_instance" "BastionHost" {
  ami                         = "ami-****"
  instance_type               = "t3.small"
  key_name                    = data.aws_key_pair.ec2-key.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.BastionHost_SG.security_group_id]
  tags = {
    Name = "BastionHost_Instance"
  }
}
module "NAT_SG" {
  source          = "terraform-aws-modules/security-group/aws"
  version         = "~> 5.0"
  name            = "NAT_SG"
  vpc_id          = module.vpc.vpc_id
  use_name_prefix = false
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = module.vpc.private_subnets_cidr_blocks[0]
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = module.vpc.private_subnets_cidr_blocks[1]
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
module "DB_SG" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"
  name    = "DB_SG"
  vpc_id  = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
resource "aws_instance" "nat_ec2" {
  ami                         = "ami-****"
  subnet_id                   = module.vpc.public_subnets[1]
  instance_type               = "t3.micro"
  key_name                    = data.aws_key_pair.ec2-key.key_name
  source_dest_check           = false
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.NAT_SG.security_group_id]
  tags = {
    Name = "nat-ec2"
  }
}
resource "aws_instance" "MariaDB-ec2" {
  ami                         = "ami-****"
  subnet_id                   = module.vpc.public_subnets[0]
  instance_type               = "t2.micro"
  key_name                    = data.aws_key_pair.ec2-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.DB_SG.security_group_id]
  tags = {
    Name = "MariaDB-ec2"
  }
}
# Private Subnet Routing Table ( dest: NAT Instance ENI )
data "aws_route_table" "private_0" {
  subnet_id  = module.vpc.private_subnets[0]
  depends_on = [module.vpc]
}
data "aws_route_table" "private_1" {
  subnet_id  = module.vpc.private_subnets[1]
  depends_on = [module.vpc]
}
resource "aws_route" "private_subnet_0" {
  route_table_id         = data.aws_route_table.private_0.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_instance.nat_ec2.primary_network_interface_id
  depends_on             = [module.vpc, aws_instance.nat_ec2]
}
resource "aws_route" "private_subnet_1" {
  route_table_id         = data.aws_route_table.private_1.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_instance.nat_ec2.primary_network_interface_id
  depends_on             = [module.vpc, aws_instance.nat_ec2]
}
// Private Subnet Tag ( AWS Load Balancer Controller Tag / internal )
resource "aws_ec2_tag" "private_subnet_tag1" {
  resource_id = module.vpc.private_subnets[0]
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}
resource "aws_ec2_tag" "private_subnet_tag2" {
  resource_id = module.vpc.private_subnets[1]
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}
// Public Subnet Tag ( AWS Load Balancer Controller Tag / internet-facing )
resource "aws_ec2_tag" "public_subnet_tag1" {
  resource_id = module.vpc.public_subnets[0]
  key         = "kubernetes.io/role/elb"
  value       = "1"
}
resource "aws_ec2_tag" "public_subnet_tag2" {
  resource_id = module.vpc.public_subnets[1]
  key         = "kubernetes.io/role/elb"
  value       = "1"
}
output "bastion_ip" {
  value       = aws_instance.BastionHost.public_ip
  description = "bastion-host public IP"
}
resource "aws_instance" "Jenkins-2a" {
  ami                         = "ami-****"
  instance_type               = "t3.small"
  key_name                    = data.aws_key_pair.ec2-key.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.BastionHost_SG.security_group_id]
  tags = {
    Name = "Jenkins-2a"
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt install openjdk-17-jdk -y
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install jenkins -y
  sudo systemctl start jenkins
  EOF
}
```
