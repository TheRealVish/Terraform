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
resource "aws_internet_gateway" "gate_way" {
  vpc_id = "${aws_vpc.testVPC.id}"
}

resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.testec2.id}"
}
resource "aws_security_group" "sec_group" {
  name = "only_https"
  vpc_id = "${aws_vpc.testVPC.id}"
  ingress{
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 443
    to_port = 443 
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "testec2" {
    ami = "${var.instanceImage}"
    instance_type = "${var.instancetype}"
    subnet_id = "${aws_subnet.testSubnet.id}"
    vpc_security_group_ids = ["${aws_security_group.sec_group.id}"]
}
output "public_IP" {
  value = "${aws_eip.elastic_ip.public_ip}"
}
