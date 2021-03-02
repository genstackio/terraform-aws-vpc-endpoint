data "aws_vpc_endpoint_service" "service" {
  service      = local.service
  service_type = local.type
}