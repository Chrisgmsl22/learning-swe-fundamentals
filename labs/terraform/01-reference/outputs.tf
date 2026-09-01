# =============================================================================
# OUTPUT — a value this stack hands back, to you or to another stack.
# =============================================================================

output "vpc_id" {
  description = "The VPC id."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Both public subnet ids. An ALB attaches to all of them."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Both private subnet ids. App servers and the database live here."
  value       = aws_subnet.private[*].id
}

output "nat_public_ip" {
  description = "The address the outside world sees when a private server calls out."
  value       = aws_eip.nat.public_ip
}
