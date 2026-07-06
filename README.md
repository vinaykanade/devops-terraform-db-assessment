# DevOps Assessment: Terraform + Database Reliability

## Overview

This repository contains a DevOps assessment solution covering:

- Terraform AWS infrastructure design
- ALB → ECS/Fargate → RDS architecture
- Dev and prod Terraform environments
- Local PostgreSQL setup using Docker Compose
- Database migrations and seed data
- Query indexing and optimization explanation
- Database backup and restore scripts
- GitHub Actions workflow for Terraform checks

Actual AWS deployment is not required. Terraform is validated using fmt, init, validate, and plan review.

## Architecture

Internet → Application Load Balancer → ECS/Fargate → Private RDS PostgreSQL

Security group flow:

- ALB allows HTTP traffic from the internet on port 80.
- ECS allows traffic only from the ALB security group.
- RDS allows PostgreSQL traffic on port 5432 only from the ECS security group.
- RDS is private and not publicly accessible.

## Project Structure

```text
infra/
  modules/
    network/
    ecs/
    rds/
  envs/
    dev/
    prod/
database/
  migrations/
  seed/
scripts/
.github/workflows/
docker-compose.yml
README.md