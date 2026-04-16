instance_name    = "mon-serveur-web"
instance_type    = "t3.micro"
ami_id           = ""
root_volume_size = 20

vpc_id    = "vpc-0c2a05cbe674ffc85"
subnet_id = "subnet-07718d8aaf721b0a1"

allowed_ports       = [80, 443]
allowed_cidr_blocks = ["0.0.0.0/0"]

user_data = ""

tags = {
  Project     = "terraform-aws-library"
  Environment = "dev"
  Owner       = "jim-test"
  CostCenter  = "formation"
}