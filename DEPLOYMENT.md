# Railway PostgreSQL with pgvector - Deployment Guide

## Issue Resolution

The deployment was failing because Railway was trying to use HTTP health checks on a PostgreSQL database. Here's the fix:

### Changes Made:

1. **Removed HTTP health check** from `railway.json` - PostgreSQL doesn't serve HTTP
2. **Added Docker health check** using `pg_isready` command
3. **Simplified Railway configuration** for database services

### Updated Configuration:

- `railway.json` now uses database-appropriate settings
- `Dockerfile` includes proper PostgreSQL health checks
- Environment variables are properly configured

## Deployment Steps:

1. **Commit and push** these changes to your repository
2. **Redeploy** on Railway - it should now work correctly
3. **Verify deployment** using the connection details Railway provides

## Connection Information:

After successful deployment, Railway will provide:

- Database URL (use this to connect from applications)
- Host, Port, Username, Password (for direct connections)

## Testing the Database:

Use the provided `test-pgvector.sql` script to verify pgvector is working:

```sql
-- Connect to your database and run:
SELECT extname, extversion FROM pg_extension WHERE extname = 'vector';
```

## Common Connection Patterns:

```bash
# Using psql (if you have PostgreSQL client installed)
psql -h <railway-host> -p <railway-port> -U postgres -d pgvector_db

# Using connection string in applications
postgresql://postgres:<password>@<railway-host>:<port>/pgvector_db
```

## Environment Variables for Applications:

When connecting from your apps, use these Railway-provided variables:

- `DATABASE_URL` (full connection string)
- `PGHOST`, `PGPORT`, `PGUSER`, `PGPASSWORD`, `PGDATABASE` (individual components)

The deployment should now succeed! 🚀
