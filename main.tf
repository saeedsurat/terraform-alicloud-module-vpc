# Configure the Alicloud Provider


resource "alicloud_vpc" "vpc" {
# count = "${var.env == "sandbox" ? 1 : 0}"
  name = "mumbai_vpc"
  cidr_block = var.vpc_cidr
#  tags = "vpc_mumbai"
}

# Loop and if condition example
resource alicloud_vswitch "vswitch_1" {
  count = length(var.zones)
  vpc_id = alicloud_vpc.vpc.id
  cidr_block = element(var.vswitch_cidr,count.index)
  availability_zone = element(var.zones,count.index)
  name = "vswitch1-${count.index}"
#  tags = "vswitch_1"

#  tags = {
#    Created      = "Terraform"
#    Environment = "dev"
#  }
}


