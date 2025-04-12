resource "aws_ssm_parameter" "sonarqube_rds_endpoint" {
  name  = "/fiap-hackathon/sonarqube-rds-endpoint"
  type  = "String"
  value = "jdbc:postgresql://${aws_db_instance.sonarqube_db_postgres.endpoint}/${var.sonarqube_db_name}"
}

resource "aws_ssm_parameter" "loki_elasticache_endpoint" {
  name  = "/fiap-hackathon/loki-elasticache-endpoint"
  type  = "String"
  value = aws_elasticache_cluster.loki_memcached.cache_nodes[0].address
}

resource "aws_ssm_parameter" "video_file_store_bucket_name" {
  name  = "/fiap-hackathon/video-file-store-bucket"
  type  = "String"
  value = aws_s3_bucket.video_file_store.bucket
}