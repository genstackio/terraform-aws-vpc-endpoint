resource "aws_vpc_endpoint" "service" {
  vpc_id              = var.vpc_id
  service_name        = data.aws_vpc_endpoint_service.service.service_name
  // common
  vpc_endpoint_type   = local.type
  // for Interface endpoints
  security_group_ids  = local.isInterface ? var.security_group_ids : null
  subnet_ids          = local.isInterface ? var.subnet_ids : null
  private_dns_enabled = local.isInterface ? var.private_dns_enabled : null
  // for Gateway endpoints
  route_table_ids     = local.isInterface ? null : [var.route_table_id]
}

// Gateway only
resource "aws_vpc_endpoint_route_table_association" "service" {
  count           = local.gatewayCount
  route_table_id  = var.route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.service.id
}
