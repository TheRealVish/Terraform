module "vpcmodule" {
  source = "./vpc"
  vpcTagValue = "vpcTest"
  subnetTagValue = "subnetTest"
}
resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.testec2.id}"
}
resource "aws_security_group" "sec_group" {
  name = "only_https"
  vpc_id = "${module.vpcmodule.vpcID}"
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
    subnet_id = "${module.vpcmodule.subnetID}"
    vpc_security_group_ids = ["${aws_security_group.sec_group.id}"]
}
output "public_IP" {
  value = "${aws_eip.elastic_ip.public_ip}"
}
