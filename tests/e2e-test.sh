#!/bin/bash
set -e

echo "Running end-to-end tests..."

# Check if frontend is up
curl -f http://localhost:8080

# Check product catalog API
curl -f http://localhost:3550/api/products

# Check if cart service is functioning
curl -f -X POST http://localhost:7070/api/cart

echo "All tests passed!"