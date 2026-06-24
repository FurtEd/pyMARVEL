#!/bin/bash

# Navigáljunk a szkript saját mappájába
cd "$(dirname "$0")"

IMAGE="furted/pymarvel:latest"
CONTAINER="pymarvel"

echo "==================================================="
echo "  pyMARVEL - Checking Updates and Starting App (Linux)"
echo "==================================================="

cleanup() {
    echo ""
    echo "[INFO] Stopping pyMARVEL container..."
    sudo docker stop "$CONTAINER" >/dev/null 2>&1
    echo "[INFO] Done. Terminal safe to close."
    exit 0
}
trap cleanup SIGINT SIGTERM

# Ellenőrizzük, hogy a Docker elérhető-e (sudo-val, mert Linuxon ez a biztos)
if ! sudo docker info >/dev/null 2>&1; then
    echo "[ERROR] Docker is not running or cannot be accessed!"
    echo "Please ensure the Docker service is started (e.g., sudo systemctl start docker)."
    read -n 1 -s -r -p "Press any key to exit..."
    exit 1
fi

echo "[INFO] Checking for the latest application updates..."
sudo docker pull "$IMAGE"

if sudo docker container inspect "$CONTAINER" >/dev/null 2>&1; then
    echo "[INFO] Updating local container environment..."
    sudo docker stop "$CONTAINER" >/dev/null 2>&1
    sudo docker rm "$CONTAINER" >/dev/null 2>&1
fi

echo "[INFO] Launching pyMARVEL environment..."
sudo docker run -d --name "$CONTAINER" -p 8080:8080 "$IMAGE"

echo "[INFO] Waiting for local server to initialize..."
sleep 3

echo "[INFO] Opening Web Interface..."
# Megpróbáljuk megnyitni az alapértelmezett böngészőt
xdg-open "http://localhost:8080" 2>/dev/null || echo "[INFO] Please open http://localhost:8080 manually."

echo "==================================================="
echo "  Application is now RUNNING at http://localhost:8080"
echo "  Minimize this window, but DO NOT close it."
echo "  Press CTRL + C inside this window to STOP the server."
echo "==================================================="

while true; do
    sleep 1
done