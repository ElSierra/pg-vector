# PostgreSQL with pgvector on Railway

This project sets up a PostgreSQL database with pgvector extension for vector similarity search on Railway.

## Features

- PostgreSQL 15 with pgvector extension
- Automatic pgvector extension initialization
- Sample embeddings table for testing
- Railway deployment ready

## Files

- `Dockerfile` - Container configuration with pgvector
- `init-pgvector.sql` - Database initialization script
- `railway.json` - Railway deployment configuration

## Environment Variables

The following environment variables can be set in Railway:

- `POSTGRES_PASSWORD` - Database password (default: postgres)
- `POSTGRES_USER` - Database username (default: postgres)
- `POSTGRES_DB` - Database name (default: postgres)

## Deployment

1. Push this repository to GitHub
2. Connect it to Railway
3. Railway will automatically build and deploy the container
4. The database will be available with pgvector extension enabled

## Usage

Once deployed, you can connect to the database and use vector operations:

```sql
-- Insert a vector
INSERT INTO embeddings (name, embedding)
VALUES ('example', '[0.1, 0.2, 0.3, ...]');

-- Find similar vectors using cosine distance
SELECT name, embedding <=> '[0.1, 0.2, 0.3, ...]' AS distance
FROM embeddings
ORDER BY distance
LIMIT 5;
```

## Vector Operations

pgvector supports three distance operators:

- `<->` - L2 distance
- `<#>` - negative inner product
- `<=>` - cosine distance

## Indexing

For better performance with large datasets, create HNSW indexes:

```sql
CREATE INDEX ON embeddings USING hnsw (embedding vector_cosine_ops);
```
