module "vpcmodule" {
  source = "./vpc"
  vpcTagValue = "${var.environment}-vpc"
  subnetTagValue = "${var.environment}-subnet"
}
module "ec2module" {
  source = "./ec2"
  instanceImage = "ami-0389b2a3c4948b1a0"
  instancetype = "t2.micro"
  vpc_id_import = module.vpcmodule.vpcID
  subnet_id_import = module.vpcmodule.subnetID
}
module "moduleiam" {
  source = "./iam"
  newUserName = var.new_user
}
module "modulestate" {
  source = "./state"
  dstrct = true
}
module "modulesns" {
  source = "./sns"
  snstag = "${var.environment}-sns"
}
module "modulecloudwatch" {
  source = "./cloudwatch"
  event_sns_arn = module.modulesns.ec2_event_sns_arn
}
