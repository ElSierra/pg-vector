-- Initialize pgvector extension
-- This script runs automatically when the container starts

-- Enable the pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Optional: Create a sample table to test vector functionality
-- You can remove this if not needed
CREATE TABLE IF NOT EXISTS embeddings (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    embedding VECTOR(1536)  -- OpenAI embeddings are 1536 dimensions
);

-- Create an index for vector similarity search (optional)
-- Uncomment if you want to enable HNSW index for better performance
-- CREATE INDEX ON embeddings USING hnsw (embedding vector_cosine_ops);
