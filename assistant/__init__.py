"""
assistant/
│── __init__.py
│── config.py # env vars, constants, provider selection
│── scraper.py # fetch_links (selenium optional), fetch_pdf
│── text_processing.py # clean, chunking, hashing
│── embeddings.py # OpenAI/Ollama clients for embed + chat
│── db.py # postgres: create schema, upsert, pgvector queries
│── search.py # pgvector, optional faiss, canberra
│── pipeline.py # end-to-end ingest pipeline
│── cli.py # command-line interface
"""

# __all__ = [
# "config", "scraper", "text_processing", "embeddings", "db", "search", "pipeline"
# ]
