variable "name" {
  default     = "DishVPC"
  type        = string
  description = "Name of the VPC"
}

variable "project" {
  type        = string
  description = "Name of project this VPC is meant to house"
}

variable "environment" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "region" {
  default     = "us-west-2"
  type        = string
  description = "Region of the VPC"
}

variable "key_name" {
  type        = string
  description = "EC2 Key pair name for the bastion"
}

variable "cidr_block" {
  default     = "172.31.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["172.31.201.0/24", "172.31.202.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

/*
variable "private_subnet_cidr_blocks01_Names" {
  default     = {
    smf1  = "172.31.1.0/24"
    smf2  = "172.31.2.0/24"
    smf3  = "172.31.3.0/24", "172.31.4.0/24", "172.31.5.0/24", "172.31.6.0/24", "172.31.7.0/24", "172.31.8.0/24", "172.31.9.0/24", "172.31.10.0/24","172.31.11.0/24","172.31.12.0/24","172.31.13.0/24","172.31.14.0/24","172.31.15.0/24"]
  type        = map
  description = "List of private subnet CIDR blocks"
}

*/

variable "private_subnets_01" {
 default     = {
    "amfaz1-snt1" = "172.31.1.0/24"
    "amfaz1-snt2" = "172.31.2.0/24"
    "amfaz1-snt3" = "172.31.3.0/24"
    "amfaz1-snt4" = "172.31.4.0/24"
    "amfaz1-snt5" = "172.31.5.0/24"
    "udmaz1-snt1" = "172.31.6.0/24"
    "udmaz1-snt2" = "172.31.7.0/24"
    "udmaz1-snt3" = "172.31.8.0/24"
    "udmaz1-snt4" = "172.31.9.0/24"
    "udmaz1-snt5" = "172.31.10.0/24"
    "nrdaz1-snt1" = "172.31.11.0/24"
    "smfaz1-snt1" = "172.31.12.0/24"
    "smfaz1-snt2" = "172.31.13.0/24"
    "upfaz1-snt1" = "172.31.14.0/24"
    "upfaz1-snt2" = "172.31.15.0/24"
    "upfaz1-snt3" = "172.31.16.0/24"
    "upfaz1-snt4" = "172.31.17.0/24"
    "pcfaz1-snt1" = "172.31.18.0/24"
    "pcfaz1-snt2" = "172.31.19.0/24"
    "chfaz1-snt1" = "172.31.20.0/24"
    "chfaz1-snt2" = "172.31.21.0/24"
    "chfaz1-snt3" = "172.31.22.0/24"
  }
  type        = map
  description = "List of private subnet CIDR blocks"
}


variable "private_subnets_02" {
 default     = {
    "amfaz1-snt1" = "172.31.101.0/24"
    "amfaz1-snt2" = "172.31.102.0/24"
    "amfaz1-snt3" = "172.31.103.0/24"
    "amfaz1-snt4" = "172.31.104.0/24"
    "amfaz1-snt5" = "172.31.105.0/24"
    "udmaz1-snt1" = "172.31.106.0/24"
    "udmaz1-snt2" = "172.31.107.0/24"
    "udmaz1-snt3" = "172.31.108.0/24"
    "udmaz1-snt4" = "172.31.109.0/24"
    "udmaz1-snt5" = "172.31.110.0/24"
    "nrdaz1-snt1" = "172.31.111.0/24"
    "smfaz1-snt1" = "172.31.112.0/24"
    "smfaz1-snt2" = "172.31.113.0/24"
    "upfaz1-snt1" = "172.31.114.0/24"
    "upfaz1-snt2" = "172.31.115.0/24"
    "upfaz1-snt3" = "172.31.116.0/24"
    "upfaz1-snt4" = "172.31.117.0/24"
    "pcfaz1-snt1" = "172.31.118.0/24"
    "pcfaz1-snt2" = "172.31.119.0/24"
    "chfaz1-snt1" = "172.31.120.0/24"
    "chfaz1-snt2" = "172.31.121.0/24"
    "chfaz1-snt3" = "172.31.122.0/24"
  }
  type        = map
  description = "List of private subnet CIDR blocks"
}


/*
variable "private_subnet_cidr_blocks01" {
  default     = [ , , , ,,,,,,,,,,,,]
  type        = list
  description = "List of private subnet CIDR blocks"
}


variable "private_subnet_names_02" {
  default     = ["amfaz2-snt1","amfaz2-snt2", "amfaz2-snt3", "amfaz2-snt4", "amfaz2-snt5", "udmaz2-snt1", "udmaz2-snt2", "udmaz2-snt3", "udmaz2-snt4", "udmaz2-snt5","nrdaz2-snt1","smfaz2-snt1","smfaz2-snt2","upfaz2-snt1","upfaz2-snt2","upfaz2-snt3","upfaz2-snt4","pcfaz2-snt1","pcfaz2-snt2","chfaz2-snt1","chfaz2-snt2","chfaz2-snt3"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks02" {
  default     = ["172.31.101.0/24", "172.31.102.0/24","172.31.103.0/24", "172.31.104.0/24", "172.31.105.0/24", "172.31.106.0/24", "172.31.107.0/24", "172.31.108.0/24", "172.31.109.0/24", "172.31.110.0/24","172.31.111.0/24","172.31.112.0/24","172.31.113.0/24","172.31.114.0/24","172.31.115.0/24","172.31.116.0/24","172.31.117.0/24","172.31.118.0/24","172.31.119.0/24","172.31.120.0/24","172.31.121.0/24","172.31.122.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}*/

variable "availability_zones" {
  default     = ["us-east-2a", "us-east-2b"]
  type        = list
  description = "List of availability zones"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}
