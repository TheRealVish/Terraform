
#Access keys for login
variable "accessKey" {
}
variable "secretKey" {
}
variable "Region" {
}
#tags 
variable "tags"{
  default = {
    vpctag = "testVPC",
    subnettag = "testSubnet"
  }
}
#ec2

variable "instanceImage" {
  default ="ami-0389b2a3c4948b1a0"
}
variable "instancetype" {
  default = "t2.micro"
}
