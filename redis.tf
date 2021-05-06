#Create subnet group

resource "aws_elasticache_subnet_group" "kiaasa-development-elasticache-subnet-gp" {
  name       = "kiaasa-development-elasticache-subnet-gp"
  subnet_ids = [aws_subnet.kiaasa_development_private-subnet-1a.id, aws_subnet.kiaasa_development_private-subnet-1b.id]

}

#Create ELASTICACHE Replication Group

resource "aws_elasticache_replication_group" "kiaasa-development-elasticache" {
  automatic_failover_enabled    = "true"
  replication_group_id          = "kiaasa-development-replication-group"
  replication_group_description = "kiaasa-development-replication-group"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 2
  engine_version                = "5.0.4"
  parameter_group_name          = "default.redis5.0"
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.kiaasa-development-elasticache-subnet-gp.name
  security_group_ids            = [aws_security_group.kiaasa-development-redis-sg.id]
  tags = {
    Name      = "Kiasadevelopmentelasticache"
    Terraform = "True"
  }
}