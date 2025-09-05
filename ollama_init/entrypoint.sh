#!/bin/bash
set -e

# Start Ollama in the background.
# ollama serve --verbose
/bin/ollama serve &
# Record Process ID.
pid=$!
echo "🔵 Started Ollama (PID $pid)..."

# Wait until Ollama is ready
# echo "⏳ Waiting for Ollama to be ready..."
# until curl -s http://localhost:11434/health; do
#     echo "Waiting for Ollama..."
#     sleep 2
# done
# echo "🟢 Ollama is ready!"


# Pull required model, retry until successful
MODEL="nomic-embed-text"
echo "🔴 Retrieving Ollama $MODEL model, so to wait until the model download to be completed for the query..."
# ollama pull nomic-embed-text  # for embedding
until /bin/ollama pull "$MODEL"; do  # ~3-4 min
    echo "Retrying model pull..."
    # Pause for Ollama to start.
    sleep 5
done
echo "🟢 Model $MODEL downloaded successfully!"


# Pull required model, retry until successful
MODEL="phi3"
echo "🔴 Retrieving Ollama $MODEL model, so to wait until the model download to be completed for the query..."
# ollama pull nomic-embed-text  # for embedding
until /bin/ollama pull "$MODEL"; do  # ~3-4 min
    echo "Retrying model pull..."
    # Pause for Ollama to start.
    sleep 5
done
echo "🟢 Model $MODEL downloaded successfully!"

echo "🟢 Done!"
# Keep Ollama running (wait for background process)
wait $pid
