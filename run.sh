#!/bin/bash

# Function to display help message
show_help() {
    echo "Usage: ./run.sh [command]"
    echo ""
    echo "Commands:"
    echo "  up        - Start n8n container"
    echo "  down      - Stop n8n container"
    echo "  restart   - Restart n8n container"
    echo "  logs      - Show n8n container logs"
    echo "  status    - Show container status"
    echo "  help      - Show this help message"
    echo ""
    echo "Example: ./run.sh up"
}

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker and try again."
    exit 1
fi

# Process command
case "$1" in
    up)
        echo "Starting n8n container..."
        docker-compose up -d
        echo "n8n is running at http://localhost:5678"
        ;;
    down)
        echo "Stopping n8n container..."
        docker-compose down
        ;;
    restart)
        echo "Restarting n8n container..."
        docker-compose restart
        ;;
    logs)
        docker-compose logs -f
        ;;
    status)
        docker-compose ps
        ;;
    help|*)
        show_help
        ;;
esac