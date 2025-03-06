Example configuration for server:


```
# DB Version: 17
# OS Type: linux
# DB Type: web
# Total Memory (RAM): 6 GB
# CPUs num: 3
# Connections num: 1000
# Data Storage: ssd

max_connections = 1000
shared_buffers = 1536MB
effective_cache_size = 4608MB
maintenance_work_mem = 384MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
effective_io_concurrency = 200
work_mem = 786kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB
shared_preload_libraries = 'pgx_ulid'
```

Cli representation of configuration:

```bash
postgres -c max_connections=1000 -c shared_buffers=1536MB -c effective_cache_size=4608MB -c maintenance_work_mem=384MB -c checkpoint_completion_target=0.9 -c wal_buffers=16MB -c default_statistics_target=100 -c random_page_cost=1.1 -c effective_io_concurrency=200 -c work_mem=786kB -c huge_pages=off -c min_wal_size=1GB -c max_wal_size=4GB shared_preload_libraries = 'pgx_ulid'
```

pg_dump -C -h localhost -U twir twir | psql -h postgres-new -U twir twir