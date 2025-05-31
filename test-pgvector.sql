-- Test script to verify pgvector is working correctly
-- Run this after deployment to test the setup

-- Check if pgvector extension is installed
SELECT extname, extversion FROM pg_extension WHERE extname = 'vector';

-- Test basic vector operations
SELECT '[1,2,3]'::vector + '[4,5,6]'::vector as vector_addition;

-- Test distance calculations
SELECT 
    '[1,2,3]'::vector <-> '[1,2,3]'::vector as l2_distance_same,
    '[1,2,3]'::vector <-> '[4,5,6]'::vector as l2_distance_different,
    '[1,2,3]'::vector <=> '[1,2,3]'::vector as cosine_distance_same,
    '[1,2,3]'::vector <=> '[4,5,6]'::vector as cosine_distance_different;

-- Insert test data
INSERT INTO embeddings (name, embedding) VALUES 
    ('test1', '[0.1, 0.2, 0.3]'),
    ('test2', '[0.4, 0.5, 0.6]'),
    ('test3', '[0.7, 0.8, 0.9]')
ON CONFLICT DO NOTHING;

-- Test similarity search
SELECT 
    name, 
    embedding,
    embedding <=> '[0.1, 0.2, 0.3]' as cosine_distance
FROM embeddings 
ORDER BY cosine_distance 
LIMIT 3;
