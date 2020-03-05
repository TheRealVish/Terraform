resource "aws_vpc" "testVPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
      Name = "${var.tags["vpctag"]}"
  }
} 

resource "aws_subnet" "testSubnet" {
  vpc_id = "${aws_vpc.testVPC.id}"
  cidr_block = "10.0.0.0/24"
  tags ={
    Name = "${var.tags["subnettag"]}"
  }

}

resource "aws_instance" "testec2" {
    ami = "${var.instanceImage}"
    instance_type = "${var.instancetype}"
    subnet_id = "${aws_subnet.testSubnet.id}"
}
resource "aws_internet_gateway" "gate_way" {
  vpc_id = "${aws_vpc.testVPC.id}"
}

resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.testec2.id}"
}

output "public_IP" {
  value = "${aws_eip.elastic_ip.public_ip}"
}
