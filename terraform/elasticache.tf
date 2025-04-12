# resource "aws_security_group" "elasticache_sg" {
#   name        = var.elasticache_security_group_name
#   description = "Security group for ElastiCache Memcached"
#   vpc_id      = data.aws_vpc.selected_vpc.id

#   ingress {
#     from_port = 11211
#     to_port   = 11211
#     protocol  = "tcp"
#     self      = true
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_elasticache_cluster" "loki_memcached" {
#   cluster_id           = "loki-memcached"
#   engine               = "memcached"
#   node_type            = "cache.t3.micro"
#   num_cache_nodes      = 2
#   parameter_group_name = "default.memcached1.6"
#   port                 = 11211
#   subnet_group_name    = aws_elasticache_subnet_group.loki_subnet_group.name
#   security_group_ids   = [aws_security_group.elasticache_sg.id]
# }

# resource "aws_elasticache_subnet_group" "loki_subnet_group" {
#   name       = var.elasticache_subnet_group_name
#   subnet_ids = [for subnet in data.aws_subnet.selected_subnets : subnet.id]
# }


