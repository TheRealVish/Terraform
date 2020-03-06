variable "vpcTagValue" {
}
variable "subnetTagValue" {
}

resource "aws_vpc" "testVPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
      Name = "${var.vpcTagValue}"
  }
} 

resource "aws_subnet" "testSubnet" {
  vpc_id = "${aws_vpc.testVPC.id}"
  cidr_block = "10.0.0.0/24"
  tags ={
    Name = "${var.subnetTagValue}"
  }

}
resource "aws_internet_gateway" "gate_way" {
  vpc_id = "${aws_vpc.testVPC.id}"
}

output "vpcID" {
  value = "${aws_vpc.testVPC.id}"
  sensitive = true
}
output "subnetID" {
  value = "${aws_subnet.testSubnet.id}"
  sensitive = true
}
