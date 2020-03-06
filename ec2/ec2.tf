variable "instanceImage" {
}
variable "instancetype" {
}
variable "vpc_id_import" { 
}
variable "subnet_id_import" {
}


resource "aws_security_group" "sec_group" {
  name = "only_https"
  vpc_id = "${var.vpc_id_import}"
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
    subnet_id = "${var.subnet_id_import}"
    vpc_security_group_ids = ["${aws_security_group.sec_group.id}"]
}
resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.testec2.id}"
}