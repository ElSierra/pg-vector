# Use the official PostgreSQL image as base
FROM postgres:15

# Install pgvector extension
RUN apt-get update && \
    apt-get install -y postgresql-15-pgvector && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres}
ENV POSTGRES_USER=${POSTGRES_USER:-postgres}
ENV POSTGRES_DB=${POSTGRES_DB:-postgres}

# Copy initialization script to enable pgvector
COPY init-pgvector.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432