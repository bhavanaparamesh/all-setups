# 1. Create Docker Compose plugin directory
sudo mkdir -p /usr/local/lib/docker/cli-plugins

# 2. Check server architecture
ARCH=$(uname -m)

# 3. Download Docker Compose
sudo curl -fSL "https://github.com/docker/compose/releases/download/v5.6.1/docker-compose-linux-${ARCH}" -o /usr/local/lib/docker/cli-plugins/docker-compose

# 4. Give executable permission
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# 5. Verify installation
docker compose version
