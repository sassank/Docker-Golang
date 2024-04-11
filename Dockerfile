# Base image for Golang development environment
FROM golang:latest AS builder

# Set working directory for the build stage
WORKDIR /app

# Copy your application code into the container
COPY . .

# Install dependencies during build stage (if using Go modules)
RUN go mod download

# Build the Golang application
RUN go build -o main .

# Base image for running the application
FROM postgres:latest

# Set working directory for the runtime stage
WORKDIR /app

# Copy the built Go binary from the builder stage
COPY --from=builder /app/main main

# Expose the PostgreSQL port (default: 5432)
EXPOSE 5432

# Command to run the application (replace with your actual command)
CMD ["main"]
