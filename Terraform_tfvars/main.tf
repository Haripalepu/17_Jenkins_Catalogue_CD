
module "catalogue" {
    source               = "git::https://github.com/hari-palepu/17_Terraform_Roboshop_App_Module.git?ref=main"
    vpc_id               = data.aws_ssm_parameter.vpc_id.value
    component_sg_id      = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_ids   = split(",", data.aws_ssm_parameter.private_subnet_ids.value) #list of private subnte_ids
    iam_instance_profile = var.iam_instance_profile
    project_name         = var.project_name
    environment          = var.environment
    common_tags          = var.common_tags
    tags                 = var.tags
    dns_name             = var.dns_name
    alb_listener_arn     = data.aws_ssm_parameter.alb_listener_arn.value
    rule_priority        = 20
    app_version          = var.app_version 
}


#To check user is connecting or not user.alb-dev.haripalepu.cloud/health