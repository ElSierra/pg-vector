# Use pgvector-enabled Postgres image
FROM ankane/pgvector

# Set environment variables for Postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=pgvector_db

# Expose Postgres port
EXPOSE 5432
