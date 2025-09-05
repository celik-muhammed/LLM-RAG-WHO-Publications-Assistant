.PHONY: build_pg_vector build_rag run_rag

# Build the pg_vector Docker image
build_pg_vector:
	docker build -f Dockerfile.postgres -t postgres_vector .

# Build the rag Docker image
build_rag:
	@# $(grep -v '^#' .env | sed 's/^/--build-arg /')
	@# --build-arg TZ_INFO="$TZ_INFO" \
	docker build -f Dockerfile.rag -t rag .

# Run the rag_app using Docker Compose
run_rag:
	docker compose run rag_app

# Build both images and run rag_app
all: build_pg_vector build_rag run_rag
