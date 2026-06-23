#!/bin/bash

IMAGE="furted/pymarvel:latest"
CONTAINER="pymarvel"

echo "==================================================="
echo "  pyMARVEL - Checking Updates and Starting App (Linux)"
echo "==================================================="

cleanup() {
    echo ""
    echo "[INFO] Stopping pyMARVEL container..."
    docker stop "$CONTAINER" >/dev/null 2>&1
    echo "[INFO] Done. Terminal safe to close."
    exit 0
}
trap cleanup SIGINT SIGTERM

if ! docker info >/dev/null 2>&1; then
    echo "[ERROR] Docker is not running!"
    echo "Please ensure the Docker service is started and your user belongs to the 'docker' group."
    read -n 1 -s -r -p "Press any key to exit..."
    exit 1
fi

echo "[INFO] Checking for the latest application updates..."
docker pull "$IMAGE"

if docker container inspect "$CONTAINER" >/dev/null 2>&1; then
    echo "[INFO] Updating local container environment..."
    docker stop "$CONTAINER" >/dev/null 2>&1
    docker rm "$CONTAINER" >/dev/null 2>&1
fi

echo "[INFO] Launching pyMARVEL environment..."
docker run -d --name "$CONTAINER" -p 8080:8080 "$IMAGE"

echo "[INFO] Waiting for local server to initialize..."
sleep 3

echo "[INFO] Opening Web Interface..."
xdg-open "http://localhost:8080" 2>/dev/null || echo "[INFO] Please open http://localhost:8080 manually."

echo "==================================================="
echo "  Application is now RUNNING at http://localhost:8080"
echo "  Minimize this window, but DO NOT close it."
echo "  Press CTRL + C inside this window to STOP the server."
echo "==================================================="

while true; do
    sleep 1
done