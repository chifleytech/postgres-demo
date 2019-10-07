#!/usr/bin/env bash
rm -rf /Users/michaelwalker/sqlcd-demos
docker build -t chifleytech/sqlcd-postgres-demos:latest .
docker-compose up