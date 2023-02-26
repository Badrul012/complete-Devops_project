output "database_instance_endpoint" {
  description = "The endpoint URL of the database instance"
  value       = aws_db_instance.database_instance.endpoint
}
